import 'package:flutter/material.dart';

import '../../consts.dart';

class InnerLayer extends StatefulWidget {
  final Widget left;
  final Widget right;

  InnerLayer({this.left, this.right});

  @override
  _InnerLayerState createState() => _InnerLayerState();
}

class _InnerLayerState extends State<InnerLayer> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        SizedBox(
          height: Const.barHeight,
        ),
        Padding(
          padding: EdgeInsets.all(10.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              // Expanded(child: buildTocWidget()),
              Expanded(
                  child: Align(
                      alignment: Alignment.topCenter,
                      child: widget.left),
                  flex: 4),
              Expanded(
                  flex: 1,
                  child: widget.right)
            ],
          ),
        ),
      ],
    );
  }
}
