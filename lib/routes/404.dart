import 'package:flutter/material.dart';

class Route404 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Center(
      child: Column(
        children: [
          Text('您要找的资源不存在\n请检查链接是否正确'),
        ],
      ),
    ),);
  }
}
