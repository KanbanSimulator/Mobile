import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:kanban/const/app_style.dart';
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
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Spectator? ", style: AppStyle.labelTextStyle),
                  const SizedBox(width: 8),
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
                child: TextInput(
                  placeholder: "How many teams?",
                  controller: _teamsCounterFieldController,
                ),
              ),
              const SizedBox(height: 32),
              SizedBox(
                width: 200,
                child: AppButton("Create waiting room"),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _onSwitchSpectator(bool value) {
    setState(() {
      _isSpectatorSelected = !_isSpectatorSelected;
    });
  }
}
