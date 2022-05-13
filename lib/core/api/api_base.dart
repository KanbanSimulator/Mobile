import 'package:dio/dio.dart';
import 'package:kanban/model/player/player_model.dart';
import 'package:kanban/model/room/room_model.dart';

class ApiBase {
  static final Dio dio = Dio();
  static const String baseUrl = 'https://peaceful-cove-23510.herokuapp.com';
}
