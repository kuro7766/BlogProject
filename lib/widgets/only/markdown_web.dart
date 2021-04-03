// ignore: avoid_web_libraries_in_flutter
import 'dart:async';
import 'dart:html' as html;

import 'package:blog_project/entity/markdown_event.dart';
import 'package:blog_project/init_web_markdown.dart';
import 'package:blog_project/util/debug.dart';
import 'package:blog_project/vars/consts.dart';
import 'package:event_bus/event_bus.dart';
import 'package:flutter/material.dart';
import 'dart:ui' as ui;

import 'package:get/get.dart';
import 'package:uuid/uuid.dart';
import 'package:uuid/uuid_util.dart';

class WebScrollEvent {
  int dy;

  WebScrollEvent(this.dy);
}

class MarkDownWeb extends StatefulWidget {
  final String data;
  final String uuid = Uuid().v4();

  MarkDownWeb(this.data);

  @override
  _MarkDownWebState createState() => _MarkDownWebState();
}

class _MarkDownWebState extends State<MarkDownWeb> {
  double mdHeight;

  @override
  void initState() {
    super.initState();
    EventBus eventBus = Get.find();
    eventBus.on<MarkdownEvent>().listen((event) {
      if (event.data['uuid'] != widget.uuid) return;
      log(95, event.data);
      if (event.data['type'] == 'setHeight') {
        if(mdHeight!=event.data['msg']) {
          mdHeight = event.data['msg'];
          if (mounted) setState(() {});
        }
      }
      if (event.data['type'] == 'scroll') {
        eventBus.fire(WebScrollEvent(event.data['msg']));
      }
      if (event.data['type'] == 'log') {
        log(93, event.data['msg']);
      }
      if (event.data['type'] == 'webloaded') {
        sendIFrameMessage({'type': 'render', 'msg': widget.data}, widget.uuid);
      }
      if (event.data['type'] == 'received') {
        log(92, '${widget.uuid} : ${event.data}');
      }
    });
    mdHeight = 0.0;
  }

  @override
  Widget build(BuildContext context) {
    log(92, 'rb');
    // ignore: undefined_prefixed_name
    ui.platformViewRegistry.registerViewFactory(widget.uuid, (int viewId) {
      html.IFrameElement iFrameElement = html.IFrameElement()
        ..src = Const.displayMarkdownUrl + '?uuid=${widget.uuid}'
        ..id = widget.uuid
        ..style.border = 'none';
      return iFrameElement;
    });
    return SizedBox(
      height: mdHeight == 0 ? 0 : mdHeight + 30,
      // height: mdHeight + 100,
      child: HtmlElementView(
        viewType: widget.uuid,
      ),
    );
  }
}
