import 'dart:async';

import 'package:blog_project/util/debug.dart';
import 'package:blog_project/widgets/only/markdown_web.dart';
import 'package:event_bus/event_bus.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../vars/consts.dart';

class ManageInnerLayer extends StatefulWidget {
  final Widget left;
  final Widget right;

  ManageInnerLayer({this.left, this.right});

  @override
  _ManageInnerLayerState createState() => _ManageInnerLayerState();
}

class _ManageInnerLayerState extends State<ManageInnerLayer> {
  ScrollController controller;
  StreamSubscription _scrollStreamSubscription;

  @override
  void initState() {
    super.initState();
    log(81, 'init');
    controller = ScrollController();
    EventBus eventBus = Get.find();
    _scrollStreamSubscription = eventBus.on<WebScrollEvent>().listen((event) {
      var target = (controller?.offset ?? 0) + event.dy;
      if (target < 0) target = 0;
      controller?.jumpTo(target);
    });
  }

  @override
  void dispose() {
    super.dispose();
    _scrollStreamSubscription.cancel();
    controller.dispose();
    controller = null;
    log(81, 'dispose');
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      controller: controller,
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
                  child:
                      Align(alignment: Alignment.topCenter, child: widget.left),
                  flex: 5),
              Expanded(flex: 2, child: widget.right)
            ],
          ),
        ),
      ],
    );
  }
}
