import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:kanban/const/app_style.dart';

class LobbyPage extends StatefulWidget {
  const LobbyPage({Key? key}) : super(key: key);

  @override
  State<LobbyPage> createState() => _LobbyPageState();
}

class _LobbyPageState extends State<LobbyPage> {
  var _isSpectatorSelected = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppStyle.backgroundColor,
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Spectator? "),
                CupertinoSwitch(
                  value: _isSpectatorSelected,
                  onChanged: _onSwitchSpectator,
                  activeColor: Colors.redAccent,
                ),
              ],
            ),
          ],
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
