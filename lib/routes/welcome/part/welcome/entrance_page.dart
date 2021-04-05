import 'dart:async';

import 'package:blog_project/entity/show_banner_event.dart';
import 'package:blog_project/routes/welcome/part/entrance_top/entrance_top_layer.dart';
import 'package:blog_project/util/debug.dart';
import 'package:blog_project/vars/configuration.dart';
import 'package:blog_project/vars/consts.dart';
import 'package:event_bus/event_bus.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'inner_layer.dart';

class MainPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {

    return _MainPageState();
  }
}

class _MainPageState extends State<MainPage> with TickerProviderStateMixin {
  AnimationController controller;
  Animation<double> animation;
  var barHeight = Const.barHeight;
  StreamSubscription _subscription;
  @override
  void initState() {
    super.initState();
    controller = new AnimationController(
        vsync: this, duration: Duration(milliseconds: 500));
    controller.value = 1;
    animation =
        // Tween(begin: 1.0, end: 0.0).animate(controller);
        CurveTween(curve: Curves.fastOutSlowIn).animate(controller);
    _subscription=Get.find<EventBus>().on<ShowBannerEvent>().listen((event) {
      controller.forward();
    });
  }

  layer1() => Column(
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
                  child: buildCombineList(),
                ),
              ],
            ),
          ),
        ],
      );

  @override
  Widget build(BuildContext context) {
    // log(60, Get.currentRoute);
    if (Get.currentRoute.startsWith('/entrance') &&
        !Get.parameters.containsKey('user')) {

      //todo something went wrong
      Future.microtask(() => Get.offNamed('/404'));
      return Container();
    } else {

      Config.user = Get.parameters['user'] ?? Config.user;
    }

    return Scaffold(
        backgroundColor: Colors.grey[100],
        body: GestureDetector(
          onTap: () {
            FocusScope.of(context).requestFocus(new FocusNode());
          },
          child: Stack(
            children: [
              layer1(),
              EntranceTopLayer(
                animation: animation,
              )
            ],
          ),
        ));
  }

  Widget buildCombineList() {
    return NotificationListener(
        onNotification: (t) {
          if (t is ScrollUpdateNotification && t.depth == 0) {
            log(84, t.metrics.pixels);
            // if (t.scrollDelta > 0.1) {
            //   controller.reverse();
            // } else {
            //   controller.forward();
            // }
            if (t.metrics.pixels > 0) {
              controller.reverse();
            } else {
              controller.forward();
            }
          }
          return false;
        },
        child: CenterInnerLayerContainer());
  }
}
