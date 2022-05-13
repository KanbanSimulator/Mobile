import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:kanban/model/player/player_model.dart';
import 'package:kanban/model/room/room_model.dart';
import 'package:kanban/model/task/task_model.dart';

import '../../const/app_const.dart';
import '../../model/board_dto/board_model.dart';
import '../../model/card_dto/card_model.dart';
import '../../model/move_card_dto/move_card_dto.dart';
import '../../model/move_person_dto/move_person_dto.dart';
import '../../model/task_card/task_card_model.dart';
import '../api/board_api.dart';

class BoardApiService {
  static Future<BoardModel?> checkBoard(int teamId) async {
    Response response = await BoardApi.getPostBoard(teamId); // same request
    return _extractBoard(response);
  }

  static Future<List<TaskModel>> getTasks(int teamId) async {
    Response response = await BoardApi.getPostBoard(teamId); // same request
    return _extractTasks(response);
  }

  static Future<List<TaskModel>?> moveTask(int taskId, int toOrdering, int toStage) async {
    toStage = AppConst.stageFrontToBackMapping[toStage]!;
    final moveCardDto = MoveCardDto(
      cardId: taskId,
      ordering: toOrdering,
      columnNumber: toStage,
    );
    Response response = await BoardApi.postMoveCard(moveCardDto);
    return _extractTasks(response);
  }

  // if any of those args null it means it's from/to the PeopleBank
  static Future<List<TaskModel>> movePerson({required int teamId, int? taskPrevId, int? taskNewId}) async {
    final movePersonDto = MovePersonDto(
      prevCard: taskPrevId,
      currentCard: taskNewId,
    );
    Response response = await BoardApi.postMovePerson(teamId, movePersonDto);
    return _extractTasks(response);
  }

  static Future<BoardModel?> completeDay({required int teamId}) async {
    Response response = await BoardApi.postStartDay(teamId);
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
