import 'package:dio/dio.dart';
import 'package:kanban/model/room/room_model.dart';
import 'package:kanban/model/task/task_model.dart';

class _Api {
  static final Dio _dio = new Dio();
  static const String baseUrl = 'http://peaceful-cove-23510.herokuapp.com';

  static Future<List<TaskModel>> getTasksMock(int day) async {
    // mock
    return [
      TaskModel(
        title: 'task 1',
        value: 12,
        stage: 0,
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
      TaskModel(
        title: 'task 4',
        value: 12,
        stage: 0,
        progress: [
          '12/18',
          '0/24',
          '0/13',
        ],
        peopleCount: [0, 0, 0],
      ),
      TaskModel(
        title: 'task 5',
        value: 12,
        stage: 1,
        progress: [
          '0/18',
          '0/24',
          '0/13',
        ],
        peopleCount: [0, 0, 0],
      ),
    ];
  }

  // static Future<List<TaskModel>> getTasks(int day) async {
  //   _dio.get("$baseUrl/")
  // }

  static Future<Response> postRoom(
    String name,
    bool isSpectator,
    int teamsAmount,
  ) async {
    return _dio.post("$baseUrl/room/create", data: {
      "player": {
        "name": name,
        "spectator": true,
      },
      "teamsAmount": teamsAmount
    });
  }

  static Future<Response> getRoom(int playerId, int roomId) async {
    return _dio.get("$baseUrl/room/$roomId", queryParameters: {
      "playerId": playerId,
    });
  }
}

class Api {
  static Future<List<TaskModel>> getTasks(int day) async {
    List<TaskModel> tasks = await _Api.getTasksMock(day);
    return tasks;
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
      return room;
    } catch (e) {
      print("something wrong sending /room/create");
    }
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
  }
}
