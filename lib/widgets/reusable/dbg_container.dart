import 'package:flutter/material.dart';
//take no space if _dbg is false
class DbgContainer extends StatelessWidget {
  final String info;
  final bool _dbg = true;

  DbgContainer({this.info});

  @override
  Widget build(BuildContext context) {
    return _dbg
        ? Container(
            color: Colors.red,
            child: Text(info ?? 'debug-box'),
          )
        : Container();
  }
}
