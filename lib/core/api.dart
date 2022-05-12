import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:kanban/model/player/player_model.dart';
import 'package:kanban/model/room/room_model.dart';
import 'package:kanban/model/task/task_model.dart';

import '../const/app_const.dart';
import '../model/board_dto/board_model.dart';
import '../model/card_dto/card_model.dart';
import '../model/move_card_dto/move_card_dto.dart';
import '../model/move_person_dto/move_person_dto.dart';
import '../model/task_card/task_card_model.dart';

class _Api {
  static final Dio _dio = Dio();
  static const String baseUrl = 'https://peaceful-cove-23510.herokuapp.com';

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

  static Future<Response> postRoomStart(int roomId, List<PlayerModel> players) async {
    return _dio.post("$baseUrl/room/$roomId/start", data: {
      "players": players,
    });
  }

  static Future<Response> getRoom(int playerId, int roomId) async {
    return _dio.get("$baseUrl/room/$roomId", queryParameters: {
      "playerId": playerId,
    });
  }

  // BOARD
  static Future<Response> getPostBoard(int teamId) async {
    return _dio.post("$baseUrl/board/$teamId");
  }

  static Future<Response> postMoveCard(MoveCardDto moveCardDto) async {
    return _dio.post("$baseUrl/board/move-card", data: moveCardDto);
  }

  static Future<Response> postStartDay(int teamId) async {
    return _dio.post("$baseUrl/board/$teamId/start-day");
  }

  static postMovePerson(int teamId, MovePersonDto movePersonDto) async {
    return _dio.post("$baseUrl/board/$teamId/move-person", data: movePersonDto);
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
    int roomId,
    List<PlayerModel> players,
  ) async {
    Response response = await _Api.postRoomStart(roomId, players);
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
      RoomModel room = RoomModel.fromJson(data);
      return room;
    } catch (e) {
      print("something wrong sending /room/create");
    }
    return null;
  }
}

class BoardApi {
  static Future<BoardModel?> checkBoard(int teamId) async {
    Response response = await _Api.getPostBoard(teamId); // same request
    return _extractBoard(response);
  }

  static Future<List<TaskModel>> getTasks(int teamId) async {
    Response response = await _Api.getPostBoard(teamId); // same request
    return _extractTasks(response);
  }

  static Future<List<TaskModel>?> moveTask(int taskId, int toOrdering, int toStage) async {
    toStage = AppConst.stageFrontToBackMapping[toStage]!;
    final moveCardDto = MoveCardDto(
      cardId: taskId,
      ordering: toOrdering,
      columnNumber: toStage,
    );
    Response response = await _Api.postMoveCard(moveCardDto);
    return _extractTasks(response);
  }

  // if any of those args null it means it's from/to the PeopleBank
  static Future<List<TaskModel>> movePerson({required int teamId, int? taskPrevId, int? taskNewId}) async {
    final movePersonDto = MovePersonDto(
      prevCard: taskPrevId,
      currentCard: taskNewId,
    );
    Response response = await _Api.postMovePerson(teamId, movePersonDto);
    return _extractTasks(response);
  }

  static Future<BoardModel?> completeDay({required int teamId}) async {
    Response response = await _Api.postStartDay(teamId);
    return _extractBoard(response);
  }


  static List<TaskModel> _extractTasks(Response<dynamic> response) {
    List<TaskModel>? tasks;
    try {
      Map<String, dynamic> data = response.data['payload'];
      List cards = data['cards'];
      tasks = [];
      for (var c in cards) {
        CardModel cardModel = CardModel.fromJson(c);
        tasks.add(TaskModel.fromCardModel(cardModel));
      }
    } catch (e) {
      print("something wrong extracting tasks!");
    }
    return tasks ?? [];
  }

  static BoardModel? _extractBoard(Response<dynamic> response) {
    BoardModel? board;
    try {
      Map<String, dynamic> data = response.data['payload'];
      // print("board data from server: ${data}");
      board = BoardModel.fromJson(data);
      // print("board fetched: $board");
    } catch (e) {
      print("something went wrong extracting board model!");
    }
    return board;
  }
}
