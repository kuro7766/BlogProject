import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BasicContainer extends StatelessWidget {
  final Widget child;
  BasicContainer({this.child});
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10.0),
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(20.0)),
      child: child
    );
  }
}
