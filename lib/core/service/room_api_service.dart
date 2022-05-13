import 'package:dio/dio.dart';

import '../../model/player/player_model.dart';
import '../../model/room/room_model.dart';
import '../api/room_api.dart';

class RoomApiService {
  static Future<RoomModel?> createRoom(
    String username,
    bool isSpectator,
    int teamsAmount,
  ) async {
    Response response = await RoomApi.postRoom(username, isSpectator, teamsAmount);
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
    Response response = await RoomApi.postRoomJoin(username, isSpectator, roomId);
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
    int roomId,
    List<PlayerModel> players,
  ) async {
    Response response = await RoomApi.postRoomStart(roomId, players);
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
    Response response = await RoomApi.getRoom(playerId, roomId);
    try {
      Map<String, dynamic> data = response.data['payload'];
      RoomModel room = RoomModel.fromJson(data);
      return room;
    } catch (e) {
      print("something wrong sending /room/create");
    }
    return null;
  }
}
