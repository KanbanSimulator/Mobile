import 'dart:async';

import 'package:get/get.dart';

class LPController {
  var worker = ((timer) async => {}).obs;
  var duration = const Duration().obs;

  Timer? timer;

  start({required void Function(Timer) worker, required Duration duration}) {
    timer = Timer.periodic(duration, worker);
  }

  stop() {
    if (timer == null) {
      printError(info: "You cannot stop LP before you start it!");
    }
    timer!.cancel();
    timer = null;
  }
}