import 'dart:async';

import 'package:event_bus/event_bus.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

import '../getx_debug_tool.dart';

//project configuration
EventBus __bus = EventBus(sync: true);

void fireEvent(dynamic targetClassOrString, dynamic message) {
  // Dbg.log(
  //     'fireEvent to $targetClassOrString with message "$message"', 'fireEvent');
  __bus.fire(__BaseEventBusMixinEvent(targetClassOrString.toString(), message));
}

void fireEventToMany(List targetClassesOrStrings, dynamic message) {
  for (var targetClassOrString in targetClassesOrStrings) {
    fireEvent(targetClassOrString, message);
    // __bus.fire(
    //     __BaseEventBusMixinEvent(targetClassOrString.toString(), message));
  }
}

mixin BaseEventBusMixin {
  StreamSubscription __eventSubscription;

  void receiveEvent(dynamic message) {}

  void __listenStream() {
    Dbg.log(runtimeType.toString(), 'EventBus_Listen');
    __eventSubscription = __bus.on<__BaseEventBusMixinEvent>().listen((event) {
      if (event.type == runtimeType.toString()) receiveEvent(event.data);
    });
  }

  void __cancelStream() {

    Dbg.log(runtimeType.toString(), 'EventBus_Cancel');

    __eventSubscription?.cancel();
  }
}

/// 由于mixin无法继承，真正mix到State组件上的时候需要同时使用BaseEventBusMixin和StateEventBusMixin两个
mixin StateEventBusReceiverMixin<T extends StatefulWidget> on State<T>
    implements BaseEventBusMixin {
  @override
  @mustCallSuper
  void initState() {
    super.initState();

    __listenStream();
  }

  @override
  @mustCallSuper
  void dispose() {
    __cancelStream();


    super.dispose();
  }
}

mixin GetxControllerEventBusReceiverMixin on GetxController
    implements BaseEventBusMixin {
  @override
  @mustCallSuper
  void onInit() {
    super.onInit();

    __listenStream();
  }

  @override
  @mustCallSuper
  void onClose() {
    __cancelStream();

    super.onClose();
  }
}

class __BaseEventBusMixinEvent {
  final String type;
  final dynamic data;

  __BaseEventBusMixinEvent(this.type, this.data);
}
