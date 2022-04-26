import 'package:flutter/material.dart';
import 'package:kanban/const/app_style.dart';

class AppButton extends StatelessWidget {
  final onPressed;
  final String text;
  final Widget? leading;

  AppButton(
      this.text, {
        Key? key,
        this.onPressed,
        this.leading,
      }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: AppStyle.buttonDecoration,
      onPressed: onPressed,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          leading ?? const SizedBox.shrink(),
          if (leading != null && text.isNotEmpty) const SizedBox(width: 12),
          Text(
            text,
            style: AppStyle.buttonTextStyle,
          ),
        ],
      ),
    );
  }
}

//
// class AppButton extends StatelessWidget {
//   final onPressed;
//   final String text;
//   final Widget? leading;
//
//   AppButton(
//     this.text, {
//     Key? key,
//     this.onPressed,
//     this.leading,
//   }) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return ElevatedButton(
//       style: AppStyle.buttonDecoration,
//       onPressed: onPressed,
//       child: Expanded(
//         child: Row(
//           mainAxisSize: MainAxisSize.min,
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: [
//             // leading ?? const SizedBox.shrink(),
//             // if (leading != null && text.isNotEmpty) const SizedBox(width: 12),
//             Text(
//               text,
//               style: AppStyle.buttonTextStyle,
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
