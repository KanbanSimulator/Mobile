import 'package:dio/dio.dart';
import 'package:kanban/model/player/player_model.dart';
import 'package:kanban/model/room/room_model.dart';
import 'package:kanban/model/task/task_model.dart';

class _Api {
  static final Dio _dio = new Dio();
  static const String baseUrl = 'https://peaceful-cove-23510.herokuapp.com';

  static List<TaskModel> getTasksMock(int day) {
    // mock
    return [
      TaskModel(
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

class Api {
  static Future<List<TaskModel>> getTasks(int teamId) async {
    List<TaskModel>? tasks;

    // Response response = await _Api.getPostBoard(teamId);
    // try {
    //   Map<String, dynamic> data = response.data['payload'];
    //   print("data on get tasks: $data");
    // } catch (e) {
    //   print("something wrong sending /room/create");
    // }

    return _Api.getTasksMock(0);

    return tasks ?? [];
  }

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
