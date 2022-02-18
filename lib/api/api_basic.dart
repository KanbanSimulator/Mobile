import 'package:dio/dio.dart';
import 'package:kanban/model/task_model.dart';

class _ApiBasic {
  static final Dio _dio = new Dio();

  static Future<List<TaskModel>> getTasks(int day) async {
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
      ),
      TaskModel(
        title: 'task 1',
        value: 12,
        stage: 0,
        progress: [
          '12/18',
          '0/24',
          '0/13',
        ],
      ),
      TaskModel(
        title: 'task 2',
        value: 12,
        stage: 1,
        progress: [
          '0/18',
          '0/24',
          '0/13',
        ],
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
      ),
      TaskModel(
        title: 'task 1',
        value: 12,
        stage: 0,
        progress: [
          '12/18',
          '0/24',
          '0/13',
        ],
      ),
      TaskModel(
        title: 'task 2',
        value: 12,
        stage: 1,
        progress: [
          '0/18',
          '0/24',
          '0/13',
        ],
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
      ),
      TaskModel(
        title: 'task 1',
        value: 12,
        stage: 0,
        progress: [
          '12/18',
          '0/24',
          '0/13',
        ],
      ),
      TaskModel(
        title: 'task 2',
        value: 12,
        stage: 1,
        progress: [
          '0/18',
          '0/24',
          '0/13',
        ],
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
      ),
      TaskModel(
        title: 'task 1',
        value: 12,
        stage: 0,
        progress: [
          '12/18',
          '0/24',
          '0/13',
        ],
      ),
      TaskModel(
        title: 'task 2',
        value: 12,
        stage: 1,
        progress: [
          '0/18',
          '0/24',
          '0/13',
        ],
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
      ),
      TaskModel(
        title: 'task 1',
        value: 12,
        stage: 0,
        progress: [
          '12/18',
          '0/24',
          '0/13',
        ],
      ),
      TaskModel(
        title: 'task 2',
        value: 12,
        stage: 1,
        progress: [
          '0/18',
          '0/24',
          '0/13',
        ],
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
      ),
      TaskModel(
        title: 'task 1',
        value: 12,
        stage: 0,
        progress: [
          '12/18',
          '0/24',
          '0/13',
        ],
      ),
      TaskModel(
        title: 'task 2',
        value: 12,
        stage: 1,
        progress: [
          '0/18',
          '0/24',
          '0/13',
        ],
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
      ),
      TaskModel(
        title: 'task 1',
        value: 12,
        stage: 0,
        progress: [
          '12/18',
          '0/24',
          '0/13',
        ],
      ),
      TaskModel(
        title: 'task 2',
        value: 12,
        stage: 1,
        progress: [
          '0/18',
          '0/24',
          '0/13',
        ],
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
      ),
      TaskModel(
        title: 'task 1',
        value: 12,
        stage: 0,
        progress: [
          '12/18',
          '0/24',
          '0/13',
        ],
      ),
      TaskModel(
        title: 'task 2',
        value: 12,
        stage: 1,
        progress: [
          '0/18',
          '0/24',
          '0/13',
        ],
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
      ),
      TaskModel(
        title: 'task 1',
        value: 12,
        stage: 0,
        progress: [
          '12/18',
          '0/24',
          '0/13',
        ],
      ),
      TaskModel(
        title: 'task 2',
        value: 12,
        stage: 1,
        progress: [
          '0/18',
          '0/24',
          '0/13',
        ],
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
      ),
      TaskModel(
        title: 'task 1',
        value: 12,
        stage: 0,
        progress: [
          '12/18',
          '0/24',
          '0/13',
        ],
      ),
      TaskModel(
        title: 'task 2',
        value: 12,
        stage: 1,
        progress: [
          '0/18',
          '0/24',
          '0/13',
        ],
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
      ),
      TaskModel(
        title: 'task 1',
        value: 12,
        stage: 0,
        progress: [
          '12/18',
          '0/24',
          '0/13',
        ],
      ),
      TaskModel(
        title: 'task 2',
        value: 12,
        stage: 1,
        progress: [
          '0/18',
          '0/24',
          '0/13',
        ],
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
      ),
    ];
  }
}

class ApiBasic {
  static Future<List<TaskModel>> getTasks(int day) async {
    List<TaskModel> tasks = await _ApiBasic.getTasks(day);
    return tasks;
  }
}
