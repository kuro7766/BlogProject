import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:math';

class FloatBoxWidget extends StatefulWidget {
  final Widget child;
  final double scale;
  FloatBoxWidget({this.child,this.scale});

  @override
  _FloatBoxWidgetState createState() => _FloatBoxWidgetState();
}

class _FloatBoxWidgetState extends State<FloatBoxWidget> with SingleTickerProviderStateMixin {
  AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 200),
      vsync: this,
    );
    // ..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (x) {
        // print('e');
        _controller.forward();
      },
      onExit: (x) {
        _controller.reset();
      },
      child: AnimatedBuilder(
        animation: _controller,
        child:widget.child,
        builder: (BuildContext context, Widget child) {
          // return Card(child: Text('${_controller.value}'));
          // print(_controller.value);
          return Transform.scale(scale: _controller.value*(widget.scale??0.3)+1,child: child,);
          // return Transform.translate(
          //   offset: Offset(0, _controller.value * 8),
          //   child: child,
          // );
        },
      ),
    );
  }
}
