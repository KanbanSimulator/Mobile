import 'package:dio/dio.dart';
import 'package:kanban/model/task_model.dart';

class _Api {
  static final Dio _dio = new Dio();
  static const String baseUrl = 'https://peaceful-cove-23510.herokuapp.com';

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

  // static Future<> postRoom()
}

class Api {
  static Future<List<TaskModel>> getTasks(int day) async {
    List<TaskModel> tasks = await _Api.getTasksMock(day);
    return tasks;
  }

  static void createRoom() {}

}
