import 'package:dio/dio.dart';
import '../../model/move_card_dto/move_card_dto.dart';
import '../../model/move_person_dto/move_person_dto.dart';
import 'api_base.dart';

class BoardApi {
  static String baseBoardUrl = "${ApiBase.baseUrl}/board";

  static Future<Response> getPostBoard(int teamId) async {
    return ApiBase.dio.post("$baseBoardUrl/$teamId");
  }

  static Future<Response> postMoveCard(MoveCardDto moveCardDto) async {
    return ApiBase.dio.post("$baseBoardUrl/move-card", data: moveCardDto);
  }

  static Future<Response> postStartDay(int teamId) async {
    return ApiBase.dio.post("$baseBoardUrl/$teamId/start-day");
  }

  static postMovePerson(int teamId, MovePersonDto movePersonDto) async {
    return ApiBase.dio.post("$baseBoardUrl/$teamId/move-person", data: movePersonDto);
  }
}
