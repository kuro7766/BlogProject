import 'package:flutter/material.dart';

typedef Tap = void Function();

class OverlapInkwell extends StatelessWidget {
  final Widget child;
  final Tap onTap;
  final Color color;
  final Color splashColor;

  OverlapInkwell({this.child, this.onTap, this.color, this.splashColor});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: this.color ?? Colors.grey[800],
      child: InkWell(
        onTap: onTap ?? () {},
        child: child,
        splashColor: this.splashColor,
      ),
    );
  }
}
