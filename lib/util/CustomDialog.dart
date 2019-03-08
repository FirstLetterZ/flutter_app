import 'package:flutter/material.dart';

class CustomDialog extends StatelessWidget {
  final Widget child;
  final EdgeInsetsGeometry contentPadding;
  final Color backgroundColor;
  final double elevation;
  final bool cancelable;
  final Function onDismiss;

  const CustomDialog({
    Key key,
    this.child,
    this.contentPadding = const EdgeInsets.all(16.0),
    this.backgroundColor = Colors.white,
    this.elevation,
    @required this.cancelable,
    this.onDismiss,
  })
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return
      Dialog(
        backgroundColor: backgroundColor,
        elevation: elevation,
        child:
        WillPopScope(
          onWillPop: () {
            if (this.onDismiss != null) {
              this.onDismiss();
            }
            return Future.value(cancelable);
          },
          child: IntrinsicWidth(
            child:
            Padding(
              child: child,
              padding: contentPadding,
            ),
          ),
        ),
      );
  }

}
