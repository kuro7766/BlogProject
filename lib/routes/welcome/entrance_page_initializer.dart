import 'dart:async';

import 'package:blog_project/config.dart';
import 'package:blog_project/entity/show_banner_event.dart';
import 'package:blog_project/routes/welcome/entrance_top_layer.dart';
import 'package:blog_project/util/debug.dart';
import 'package:blog_project/util/getx_debug_tool.dart';
import 'package:blog_project/util/js_util.dart';
import 'package:blog_project/unused/configuration.dart';
import 'package:blog_project/consts.dart';
import 'package:event_bus/event_bus.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:blog_project/widgets/ShouldRebuild.dart';
import 'package:ua_client_hints/ua_client_hints.dart';
import 'package:user_agent_parser/user_agent_parser.dart';
import 'dart:io' show Platform; //at the top

import 'inner_layer.dart';

class EntrancePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _EntrancePageState();
  }
}

class _EntrancePageState extends State<EntrancePage> with TickerProviderStateMixin {
  AnimationController controller;
  Animation<double> animation;
  var barHeight = Const.barHeight;
  StreamSubscription _subscription;

  @override
  void initState() {
    super.initState();

    JSUtil.call(function: 'setTitle', params: []);

    controller = new AnimationController(
        vsync: this, duration: Duration(milliseconds: 500));
    controller.value = 1;
    animation =
        // Tween(begin: 1.0, end: 0.0).animate(controller);
        CurveTween(curve: Curves.fastOutSlowIn).animate(controller);
    _subscription = Get.find<EventBus>().on<ShowBannerEvent>().listen((event) {
      controller.forward();
    });
  }

  __insideLayer() => Column(
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: Container(),
                  flex: Const.leftFlex,
                ),
                Expanded(
                  flex: Const.rightFlex,
                  child: buildInnerCombineList(),
                ),
              ],
            ),
          ),
        ],
      );

  @override
  Widget build(BuildContext context) {
    // log(60, Get.currentRoute);
    // log2(3, 'rbuild33333');
    // Dbg.log( Platform.operatingSystem); //in your code

    Dbg.log(Get.currentRoute,'entrance');

    if (Get.currentRoute.startsWith('/entrance') &&!Get.parameters.containsKey('user')) {
      // Future.microtask(() => Get.offNamed('/404'));
      // return Container();
    } else {
      Config.user = Get.parameters['user'] ?? Config.user;
    }

    return Scaffold(
        backgroundColor: Colors.grey[100],
        body: GestureDetector(
            onTap: () {
              FocusScope.of(context).requestFocus(new FocusNode());
            },
            child: ShouldRebuild<Stack>(
              shouldRebuild: (oldWidget, newWidget) => false,
              child: Stack(
                children: [
                  __insideLayer(),
                  EntranceTopLayer(
                    animation: animation,
                  )
                ],
              ),
            )));
  }

  Widget buildInnerCombineList() {
    return NotificationListener(
        onNotification: (t) {
          if (t is ScrollUpdateNotification && t.depth == 0) {
            log(84, t.metrics.pixels);
            if (t.scrollDelta > 0.1) {
              controller.reverse();
            } else {
              controller.forward();
            }
            // if (t.metrics.pixels > 0) {
            //   controller.reverse();
            // } else {
            //   controller.forward();
            // }
          }
          return false;
        },
        child: CenterInnerLayerContainer());
  }
}
