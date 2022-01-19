import 'package:flutter/cupertino.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';

class ObxObserveWidget extends StatelessWidget {
  final WidgetCallback builder;
  final List<RxObjectMixin> observe;

  const ObxObserveWidget(
    this.observe,
    this.builder, {
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      for (final rxObject in observe) {
        rxObject.value;
      }
      return builder();
    });
  }
}
