import 'package:blog_project/vars/consts.dart';
import 'package:flutter/material.dart';

class WhiteBorder extends StatelessWidget {
  final Widget child;

  const WhiteBorder({Key key, this.child}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(decoration: BoxDecoration(
      border: Border.all(color :Const.searchBarColor),borderRadius: BorderRadius.all(Radius.circular(10))
    ),child: child,);
  }
}
