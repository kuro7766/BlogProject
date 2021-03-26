import 'package:flutter/material.dart';

import '../../vars/consts.dart';

class ManageInnerLayer extends StatefulWidget {
  final Widget left;
  final Widget right;

  ManageInnerLayer({this.left, this.right});

  @override
  _ManageInnerLayerState createState() => _ManageInnerLayerState();
}

class _ManageInnerLayerState extends State<ManageInnerLayer> {
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
