import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:kanban/const/app_const.dart';
import 'package:kanban/const/app_res.dart';
import 'package:kanban/const/app_style.dart';
import 'package:kanban/core/api.dart';
import 'package:kanban/core/app_ui.dart';
import 'package:kanban/core/cache_service.dart';
import 'package:kanban/model/room/room_model.dart';
import 'package:kanban/page/lobby.dart';
import 'package:kanban/widget/app_button_widget.dart';
import 'package:kanban/widget/text_input_widget.dart';

class JoinPage extends StatefulWidget {
  const JoinPage({Key? key}) : super(key: key);

  @override
  State<JoinPage> createState() => _JoinPageState();
}

class _JoinPageState extends State<JoinPage> {
  var _isSpectatorSelected = false;
  final _roomIdFieldController = TextEditingController(text: "");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppStyle.backgroundColor,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(80.0),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text(
                "Join room",
                style: AppStyle.pageHeaderTextStyle,
              ),
              const SizedBox(height: 48),
              SizedBox(
                width: 200,
                child: TextInput(
                  placeholder: "Enter room id",
                  controller: _roomIdFieldController,
                  keyboardType: TextInputType.number,
                ),
              ),
              const SizedBox(height: 24),
              Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text("Spectator? ", style: AppStyle.labelTextStyle),
                  const SizedBox(width: 50),
                  CupertinoSwitch(
                    value: _isSpectatorSelected,
                    onChanged: _onSwitchSpectator,
                    activeColor: Colors.redAccent,
                  ),
                ],
              ),
              const SizedBox(height: 32),
              SizedBox(
                width: 200,
                height: 48,
                child: AppButton(
                  "Join waiting room",
                  onPressed: () => _onJoinWaitingRoomPressed(context),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _onJoinWaitingRoomPressed(BuildContext context) async {
    String username = await CacheService.getUsername();
    if (username == AppConst.unnamed) {
      AppUi.toast(context, AppRes.checkLoggedIn);
      return;
    }
    String roomIdString = _roomIdFieldController.text;
    if (!_validateRoomId(roomIdString)) {
      AppUi.toast(context, AppRes.incorrectRoomId);
      return;
    }
    int roomId = int.parse(roomIdString);
    RoomModel? roomJoined = await Api.joinRoom(
      username,
      _isSpectatorSelected,
      roomId,
    );
    CacheService.store("userId", roomJoined!.player!.id);
    print('room just joined: ${roomJoined.toJson().toString()}');
    print("user id set: ${await CacheService.getUserId()}");
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(
        builder: (routeContext) => LobbyPage(roomModel: roomJoined),
      ),
    );
  }

  void _onSwitchSpectator(bool value) {
    setState(() {
      _isSpectatorSelected = !_isSpectatorSelected;
    });
  }

  bool _validateRoomId(String s) {
    int t = 0;
    try {
      t = int.parse(s);
    } catch (e) {
      return false;
    }
    return t > 0 && t < 32768;
  }
}
