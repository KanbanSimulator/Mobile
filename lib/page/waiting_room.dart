import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:kanban/const/app_const.dart';
import 'package:kanban/const/app_res.dart';
import 'package:kanban/const/app_style.dart';
import 'package:kanban/core/api/api.dart';
import 'package:kanban/core/app_ui.dart';
import 'package:kanban/core/cache_service.dart';
import 'package:kanban/model/room/room_model.dart';
import 'package:kanban/widget/app_button_widget.dart';
import 'package:kanban/widget/text_input_widget.dart';

class WaitingRoomPage extends StatefulWidget {
  const WaitingRoomPage({
    Key? key,
  }) : super(key: key);

  @override
  State<WaitingRoomPage> createState() => _WaitingRoomPageState();
}

class _WaitingRoomPageState extends State<WaitingRoomPage> {
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
                "Waiting room",
                style: AppStyle.pageHeaderTextStyle,
              ),
              const SizedBox(height: 32),
              SizedBox(
                width: 200,
                height: 48,
                child: AppButton(
                  "Start game",
                  onPressed: () => _onStartGamePressed(context),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _onStartGamePressed(BuildContext context) async {
    String username = await CacheService.getUsername();
    if (username == AppConst.unnamed) {
      AppUi.toast(context, AppRes.checkLoggedIn);
      return;
    }
  }
}
