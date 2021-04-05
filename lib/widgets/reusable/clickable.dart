import 'package:flutter/material.dart';

class Clickable extends StatefulWidget {
  final Widget child;

  const Clickable({Key key, this.child}) : super(key: key);
  @override
  _ClickableState createState() => _ClickableState();
}

class _ClickableState extends State<Clickable> {
  @override
  Widget build(BuildContext context) {
    return widget.child;
  }
}
