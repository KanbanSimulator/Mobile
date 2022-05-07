import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:kanban/const/app_const.dart';
import 'package:kanban/const/app_res.dart';
import 'package:kanban/core/app_style.dart';
import 'package:kanban/core/api.dart';
import 'package:kanban/core/app_ui.dart';
import 'package:kanban/core/cache_service.dart';
import 'package:kanban/model/room/room_model.dart';
import 'package:kanban/page/lobby.dart';
import 'package:kanban/widget/app_button_widget.dart';
import 'package:kanban/widget/text_input_widget.dart';

class CreatePage extends StatefulWidget {
  const CreatePage({Key? key}) : super(key: key);

  @override
  State<CreatePage> createState() => _CreatePageState();
}

class _CreatePageState extends State<CreatePage> {
  var _isSpectatorSelected = false;
  var _teamsCounter = 1;
  final _teamsCounterFieldController = TextEditingController(text: "1");

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
                "Game details",
                style: AppStyle.pageHeaderTextStyle,
              ),
              const SizedBox(height: 48),
              SizedBox(
                width: 200,
                child: TextInput(
                  placeholder: "How many teams?",
                  controller: _teamsCounterFieldController,
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
                  "Create waiting room",
                  onPressed: () => _onCreateWaitingRoomPressed(context),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _onCreateWaitingRoomPressed(BuildContext context) async {
    String username = await CacheService.getUsername();
    if (username == AppConst.unnamed) {
      AppUi.toast(context, AppRes.checkLoggedIn);
      return;
    }
    String teamsCounter = _teamsCounterFieldController.text;
    if (!_validateTeamsCounter(teamsCounter)) {
      AppUi.toast(context, AppRes.incorrectTeamsCounter);
      return;
    }
    RoomModel? roomCreated = await RoomApi.createRoom(
      username,
      _isSpectatorSelected,
      int.parse(teamsCounter),
    );
    int roomId = roomCreated!.id!;
    CacheService.store("userId", roomCreated.player!.id);
    print('room just created: ${roomCreated.toJson().toString()}');
    print("user id set: ${await CacheService.getUserId()}");
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(
        builder: (routeContext) => LobbyPage(roomModel: roomCreated),
      ),
    );
  }

  void _onSwitchSpectator(bool value) {
    setState(() {
      _isSpectatorSelected = !_isSpectatorSelected;
    });
  }

  bool _validateTeamsCounter(String s) {
    int t = 0;
    try {
      t = int.parse(s);
    } catch (e) {
      return false;
    }
    return t > 0 && t < 16;
  }
}
