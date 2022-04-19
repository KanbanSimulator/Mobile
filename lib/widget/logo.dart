import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../const/app_assets.dart';
import '../page/splash.dart';

class Logo extends StatelessWidget {
  const Logo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: () {
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(
              builder: (routeContext) => const SplashPage(),
            ),
          );
        },
        child: SvgPicture.asset(AppAssets.logo),
      ),
    );
  }
}
