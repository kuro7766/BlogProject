import 'dart:html' as html;

import 'package:blog_project/entity/markdown_event.dart';
import 'package:blog_project/util/debug.dart';
import 'package:event_bus/event_bus.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void init() {
  EventBus eventBus = Get.put(EventBus(),permanent: true);
  html.window.onMessage.listen((event) {
    var data = event.data;
    log(89, data);
    eventBus.fire(MarkdownEvent(data));
  });
  html.window.onBlur.listen((e) {
    FocusManager.instance.primaryFocus.unfocus();
  });
}

html.IFrameElement getIFrame(String iFrameId) {
  return html.document.getElementById(iFrameId);
}

void sendIFrameMessage(dynamic msg,String iFrameId){
  getIFrame(iFrameId)?.contentWindow?.postMessage(msg, '*');
}
