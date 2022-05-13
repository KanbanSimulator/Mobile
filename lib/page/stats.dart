import 'package:flutter/material.dart';

import '../core/app_style.dart';

class StatsPage extends StatelessWidget {
  const StatsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          backgroundColor: AppStyle.backgroundColor,
          body: Padding(
            padding: const EdgeInsets.symmetric(vertical: 64.0, horizontal: 120),
            child: Column(
              children: [
                Expanded(
                  flex: 1,
                  child: Center(
                    child: Column(
                      children: [
                        const Text(
                          "Congratulations!",
                          style: AppStyle.pageHeaderTextStyle,
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: 12),
                        RichText(
                          textAlign: TextAlign.center,
                          text: TextSpan(
                            children: <TextSpan>[
                              TextSpan(
                                text: "You have submitted the ",
                                style: AppStyle.pageHeaderTextStyle.copyWith(
                                  fontSize: 12,
                                ),
                              ),
                              TextSpan(
                                text: "Product",
                                style: AppStyle.pageHeaderTextStyle.copyWith(
                                  fontSize: 12,
                                  color: Colors.redAccent,
                                ),
                              ),
                              TextSpan(
                                text: " to the ",
                                style: AppStyle.pageHeaderTextStyle.copyWith(
                                  fontSize: 12,
                                ),
                              ),
                              TextSpan(
                                text: "Customer",
                                style: AppStyle.pageHeaderTextStyle.copyWith(
                                  fontSize: 12,
                                  color: Colors.redAccent,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const Expanded(
                  flex: 6,
                  child: const Text(
                    "Statistics coming soon...",
                    style: TextStyle(
                      color: Colors.grey,
                    ),
                  ),
                ),
              ],
            ),
          )),
    );
  }
}
