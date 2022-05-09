import 'package:get/get.dart';
import 'package:kanban/controller/room_controller.dart';
import 'package:kanban/model/task_card/task_card_model.dart';

import '../const/app_const.dart';
import '../core/api.dart';
import '../model/task/task_model.dart';

class BoardController extends GetxController {
  var roomController = Get.find<RoomController>();

  var _isBacklogOpen = false.obs;
  var tasks = <TaskModel>[].obs;

  get isBacklogOpen => _isBacklogOpen.value;

  // get taskTable => [
  //       tasks.where((e) => e.stage == 7).toList(),
  //       tasks.where((e) => e.stage == 0).toList(),
  //       tasks.where((e) => e.stage == 3).toList(),
  //       tasks.where((e) => e.stage == 1).toList(),
  //       tasks.where((e) => e.stage == 4).toList(),
  //       tasks.where((e) => e.stage == 2).toList(),
  //       tasks.where((e) => e.stage == 5).toList(),
  //     ];

  fetch() async {
    tasks.value = await BoardApi.getTasks(roomController.teamId);
    tasks.refresh();
  }

  switchBacklog() {
    _isBacklogOpen.value = !_isBacklogOpen.value;
    _isBacklogOpen.refresh();
  }

  moveTask({required int taskId, required int toStage}) async {
    tasks.value = (await BoardApi.moveTask(taskId, 0, toStage)) ?? tasks;
    tasks.refresh();
  }

  movePerson({int? from, int? to}) async {
    print("move person from $from to $to");
    tasks.value = await BoardApi.movePerson(
      teamId: roomController.teamId,
      taskPrevId: from,
      taskNewId: to,
    );
  }
}
