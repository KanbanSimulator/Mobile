import 'package:get/get.dart';
import 'package:kanban/controller/room_controller.dart';

import '../core/api.dart';
import '../model/task/task_model.dart';

class BoardController extends GetxController {
  var roomController = Get.find<RoomController>();

  final tasks = <TaskModel>[].obs;

  fetch() async {
    tasks.value = await BoardApi.getTasks(roomController.teamId);
    tasks.refresh();
  }
}