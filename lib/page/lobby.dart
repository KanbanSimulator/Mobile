import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:kanban/const/app_const.dart';
import 'package:kanban/const/app_res.dart';
import 'package:kanban/const/app_style.dart';
import 'package:kanban/core/api/api.dart';
import 'package:kanban/core/app_ui.dart';
import 'package:kanban/core/cache_service.dart';
import 'package:kanban/widget/app_button_widget.dart';
import 'package:kanban/widget/text_input_widget.dart';

class LobbyPage extends StatefulWidget {
  const LobbyPage({Key? key}) : super(key: key);

  @override
  State<LobbyPage> createState() => _LobbyPageState();
}

class _LobbyPageState extends State<LobbyPage> {
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
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text("Spectator? ", style: AppStyle.labelTextStyle),
                  CupertinoSwitch(
                    value: _isSpectatorSelected,
                    onChanged: _onSwitchSpectator,
                    activeColor: Colors.redAccent,
                  ),
                ],
              ),
              const SizedBox(height: 24),
              SizedBox(
                width: 200,
                child: TextInput(
                  placeholder: "How many teams?",
                  controller: _teamsCounterFieldController,
                  keyboardType: TextInputType.number,
                ),
              ),
              const SizedBox(height: 32),
              SizedBox(
                width: 200,
                height: 48,
                child: AppButton("Create waiting room", onPressed: () => _onCreateWaitingRoomPressed(context),),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _onCreateWaitingRoomPressed(BuildContext context) async {
    String username = await CacheService.getCredentials();
    if (username == AppConst.unnamed) {
      AppUi.toast(context, AppRes.checkLoggedIn);
      return;
    }
    Api.createRoom();
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
