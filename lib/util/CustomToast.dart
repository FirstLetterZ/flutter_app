import 'package:flutter/material.dart';

void toast(BuildContext context, String msg,
    {int milliseconds = 2000, Color backgroundColor = Colors.black45,
      double fontSize = 16, Color textColor = Colors.white}) async {
  if (context == null) {
    return;
  }
  if (milliseconds < 500) {
    milliseconds = 500;
  }
  OverlayState overlayState = Overlay.of(context);
  double op = 1.0;
  OverlayEntry overlayEntry = OverlayEntry(builder: (context) {
    return
      Center(
        child:
        AnimatedOpacity(
          child:
          Card(
            color: backgroundColor,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8)),
            margin: EdgeInsets.fromLTRB(20, 120, 20, 0),
            child:
            Padding(
              padding: const EdgeInsets.fromLTRB(8, 4, 8, 4),
              child: Text(msg,
                style: TextStyle(fontSize: fontSize, color: textColor,
                    decoration: TextDecoration.none),
              ),
            ),
          ),
          opacity: op,
          duration: Duration(milliseconds: 500),
        ),
      );
  });
  overlayState.insert(overlayEntry);
  //等待2秒
  await Future.delayed(Duration(milliseconds: milliseconds - 500));
  //移除
  op = 0.0;
  overlayEntry.markNeedsBuild();
  //等待2秒
  await Future.delayed(Duration(milliseconds: 500));
  overlayEntry.remove();
}
