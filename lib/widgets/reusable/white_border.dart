import 'package:blog_project/consts.dart';
import 'package:flutter/material.dart';

class WhiteBorder extends StatelessWidget {
  final Widget child;
  final Color color;
  final double borderRadius;
  const WhiteBorder({Key key, this.child, this.color, this.borderRadius}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(decoration: BoxDecoration(
      color: color??Colors.transparent,
      border: Border.all(color :color??Const.searchBarColor),borderRadius: BorderRadius.all(Radius.circular(borderRadius??10.0))
    ),child: child,);
  }
}
