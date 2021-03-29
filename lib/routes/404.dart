import 'package:flutter/material.dart';

class Route404 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Center(
      child: Text('你要找的资源不存在\n请检查链接是否正确'),
    ),);
  }
}
