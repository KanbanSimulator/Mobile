import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kanban/controller/room_controller.dart';

import '../const/app_const.dart';
import '../const/app_res.dart';
import '../core/app_ui.dart';
import '../core/service/board_api_service.dart';
import '../model/board_dto/board_model.dart';
import '../model/task/task_model.dart';

class BoardController extends GetxController {
  var roomController = Get.find<RoomController>();

  var _isBacklogOpen = false.obs;
  var tasks = <TaskModel>[].obs;
  var board = BoardModel().obs;

  get isBacklogOpen => _isBacklogOpen.value;

  get taskTable {
    return <List<TaskModel>>[
      tasks.where((e) => e.stage == 7).toList(),
      tasks.where((e) => e.stage == 0).toList(),
      tasks.where((e) => e.stage == 3).toList(),
      tasks.where((e) => e.stage == 1).toList(),
      tasks.where((e) => e.stage == 4).toList(),
      tasks.where((e) => e.stage == 2).toList(),
      tasks.where((e) => e.stage == 5).toList(),
    ];
  }

  TaskModel? getTaskById(int id) {
    return tasks.firstWhereOrNull((TaskModel t) => t.id == id);
  }

  fetchTasks() async {
    tasks.value = await BoardApiService.getTasks(roomController.teamId);
    tasks.refresh();
  }

  fetchBoard({BuildContext? context}) async {
    BoardModel newBoard = (await BoardApiService.checkBoard(roomController.teamId)) ?? board.value;
    var newDay = newBoard.day;
    var boardDay = board.value.day;
    board.value = newBoard;
    board.refresh();
    if (context != null &&
        newDay != boardDay &&
        (boardDay ?? 1) < AppConst.gameOverDay) {
      AppUi.toast(context, AppRes.newDayStarted, color: Colors.white);
    }
  }

  switchBacklog() {
    _isBacklogOpen.value = !_isBacklogOpen.value;
    _isBacklogOpen.refresh();
  }

  moveTask({required int taskId, required int toStage}) async {
    tasks.value = (await BoardApiService.moveTask(taskId, 0, toStage)) ?? tasks;
    tasks.refresh();
  }

  completeTask({required int taskId}) {
    moveTask(taskId: taskId, toStage: 6);
  }

  movePerson({int? from, int? to}) async {
    tasks.value = await BoardApiService.movePerson(
      teamId: roomController.teamId,
      taskPrevId: from,
      taskNewId: to,
    );
    tasks.refresh();
    fetchBoard();
  }

  completeDay(context) async {
    await BoardApiService.completeDay(teamId: roomController.teamId);
    await fetchBoard(context: context);
    await fetchTasks();
  }

  shouldAllowMove({required int taskStage, required List<String> taskProgress, required int toStage}) {
    var taskStageBack = AppConst.stageFrontToBackMapping[taskStage]!;
    var toStageBack = AppConst.stageFrontToBackMapping[AppConst.stageIMapping[toStage]!]!;
    if ((taskStageBack - toStageBack).abs() != 1) {
      // then they're not neighboring columns
      print("move not allowed : not neighbors");
      return false;
    }
    // next criterion is that the task should be full at its stage and should be in Finish
    String stageProgress = taskProgress[(taskStage) % 3];
    if (stageProgress.split('/')[0] != stageProgress.split('/')[1] && taskStage != 7) {
      print("move not allowed: stage not completed");
      return false;
    }
    print("we allow task at stage $taskStage($taskStageBack) into stage $toStage($toStageBack)");
    return true;
  }
}
