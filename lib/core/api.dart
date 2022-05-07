import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:kanban/model/player/player_model.dart';
import 'package:kanban/model/room/room_model.dart';
import 'package:kanban/model/task/task_model.dart';

import '../const/app_const.dart';
import '../model/card_dto/card_model.dart';
import '../model/move_card_dto/move_card_dto.dart';
import '../model/task_card/task_card_model.dart';

class _Api {
  static final Dio _dio = new Dio();
  static const String baseUrl = 'https://peaceful-cove-23510.herokuapp.com';

  // BOARD
  static List<TaskModel> getTasksMock(int day) {
    // mock
    return [
      TaskModel(
        id: 55,
        title: 'task 1',
        value: 12,
        stage: 3,
        progress: [
          '12/18',
          '0/24',
          '0/13',
        ],
        peopleCount: [0, 0, 0],
      ),
      TaskModel(
        id: 66,
        title: 'task 2',
        value: 12,
        stage: 1,
        progress: [
          '1/18',
          '0/24',
          '0/13',
        ],
        peopleCount: [0, 0, 0],
      ),
      TaskModel(
        id: 77,
        title: 'task 2',
        value: 12,
        stage: 1,
        progress: [
          '1/18',
          '0/24',
          '0/13',
        ],
        peopleCount: [0, 0, 0],
      ),
      TaskModel(
        id: 88,
        title: 'task 3',
        value: 12,
        stage: 2,
        progress: [
          '12/19',
          '0/24',
          '0/13',
        ],
        peopleCount: [0, 0, 0],
      ),
    ];
  }

  static Future<Response> getPostBoard(int teamId) async {
    return _dio.post("$baseUrl/board/$teamId");
  }

  static Future<Response> postMoveCard(MoveCardDto moveCardDto) async {
    return _dio.post("$baseUrl/board/move-card", data: moveCardDto);
  }

  // ROOM
  static Future<Response> postRoom(String name, bool isSpectator, int teamsAmount) async {
    return _dio.post("$baseUrl/room/create", data: {
      "player": {
        "name": name,
        "spectator": isSpectator,
      },
      "teamsAmount": teamsAmount
    });
  }

  static Future<Response> postRoomJoin(String name, bool isSpectator, int roomId) async {
    return _dio.post("$baseUrl/room/$roomId/join", data: {
      "name": name,
      "spectator": isSpectator,
    });
  }

  static Future<Response> postRoomStart(String name, int roomId, List<PlayerModel> players) async {
    return _dio.post("$baseUrl/room/$roomId/start", data: {
      "players": players,
    });
  }

  static Future<Response> getRoom(int playerId, int roomId) async {
    return _dio.get("$baseUrl/room/$roomId", queryParameters: {
      "playerId": playerId,
    });
  }
}

class RoomApi {
  static Future<RoomModel?> createRoom(
    String username,
    bool isSpectator,
    int teamsAmount,
  ) async {
    Response response = await _Api.postRoom(username, isSpectator, teamsAmount);
    try {
      Map<String, dynamic> data = response.data['payload'];
      RoomModel room = RoomModel.fromJson(data);
      // print("room on create room response: ${room.toJson().toString()}");
      return room;
    } catch (e) {
      print("something wrong sending /room/create");
    }
    return null;
  }

  static Future<RoomModel?> joinRoom(
    String username,
    bool isSpectator,
    int roomId,
  ) async {
    Response response = await _Api.postRoomJoin(username, isSpectator, roomId);
    try {
      Map<String, dynamic> data = response.data['payload'];
      RoomModel room = RoomModel.fromJson(data);
      return room;
    } catch (e) {
      print("err msg: ${e.toString()}");
      print("something wrong sending /room/{roomid}/start");
    }
    return null;
  }

  static Future<RoomModel?> startGame(
    String username,
    int roomId,
    List<PlayerModel> players,
  ) async {
    Response response = await _Api.postRoomStart(username, roomId, players);
    try {
      Map<String, dynamic> data = response.data['payload'];
      print("data raw on receive from server (start game) : $data");
      RoomModel room = RoomModel.fromJson(data);
      return room;
    } catch (e) {
      print("err msg: ${e.toString()}");
      print("something wrong sending /room/{roomid}/start");
    }
    return null;
  }

  static Future<RoomModel?> checkRoom(
    int playerId,
    int roomId,
  ) async {
    Response response = await _Api.getRoom(playerId, roomId);
    try {
      Map<String, dynamic> data = response.data['payload'];
      print("data on get room: $data");
      RoomModel room = RoomModel.fromJson(data);
      return room;
    } catch (e) {
      print("something wrong sending /room/create");
    }
    return null;
  }
}

class BoardApi {
  static Future<List<TaskModel>> getTasks(int teamId) async {
    List<TaskModel>? tasks;

    Response response = await _Api.getPostBoard(teamId);
    try {
      Map<String, dynamic> data = response.data['payload'];
      List cards = data['cards'];
      tasks = [];
      for (var c in cards) {
        CardModel cardModel = CardModel.fromJson(c);
        tasks.add(TaskModel.fromCardModel(cardModel));
        // print(tasks.last);
      }
      // log("data on get tasks: cards: $cards ${cards.runtimeType}");
      // log("data on get tasks: tasks: $tasks ${tasks.runtimeType}");
    } catch (e) {
      print("something wrong sending /room/create");
    }

    // return _Api.getTasksMock(0);
    return tasks ?? [];
  }

  static void moveTask(int taskId, int toOrdering, int toStage) async {
    toStage = AppConst.stageFrontToBackMapping[toStage]!;
    final moveCardDto = MoveCardDto(
      cardId: taskId,
      ordering: toOrdering,
      columnNumber: toStage,
    );
    print("sending move card dto : $moveCardDto");
    Response response = await _Api.postMoveCard(moveCardDto);
    print(response.data['payload']);
  }
}
