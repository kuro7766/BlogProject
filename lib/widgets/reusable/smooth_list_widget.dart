import 'package:flutter/material.dart';

class SmoothListWidget extends StatefulWidget {
  final List<Widget> children;

  const SmoothListWidget({Key key, this.children}) : super(key: key);
  @override
  _SmoothListWidgetState createState() => _SmoothListWidgetState();
}

class _SmoothListWidgetState extends State<SmoothListWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(children: widget.children,);
  }
}
