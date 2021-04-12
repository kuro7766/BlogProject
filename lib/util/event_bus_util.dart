import 'dart:async';

import 'package:event_bus/event_bus.dart';

class Events {
  static EventBus _eventBus;

  static EventBus getEventBus() {
    if (_eventBus == null) _eventBus = EventBus();
    return _eventBus;
  }
}
