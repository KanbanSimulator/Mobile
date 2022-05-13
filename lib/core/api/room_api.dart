
import 'package:dio/dio.dart';

import '../../model/player/player_model.dart';
import 'api_base.dart';

class RoomApi {
  static String baseRoomUrl = "${ApiBase.baseUrl}/room";

  static Future<Response> postRoom(String name, bool isSpectator, int teamsAmount) async {
    return ApiBase.dio.post("$baseRoomUrl/create", data: {
      "player": {
        "name": name,
        "spectator": isSpectator,
      },
      "teamsAmount": teamsAmount
    });
  }

  static Future<Response> postRoomJoin(String name, bool isSpectator, int roomId) async {
    return ApiBase.dio.post("$baseRoomUrl/$roomId/join", data: {
      "name": name,
      "spectator": isSpectator,
    });
  }

  static Future<Response> postRoomStart(int roomId, List<PlayerModel> players) async {
    return ApiBase.dio.post("$baseRoomUrl/$roomId/start", data: {
      "players": players,
    });
  }

  static Future<Response> getRoom(int playerId, int roomId) async {
    return ApiBase.dio.get("$baseRoomUrl/$roomId", queryParameters: {
      "playerId": playerId,
    });
  }
}
