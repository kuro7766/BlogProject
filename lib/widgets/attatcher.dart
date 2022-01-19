import 'package:flutter/cupertino.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';

var attach = (BuildContext context, AlignmentGeometry alignment,Widget widget) async {
  SmartDialog.showAttach(
    targetContext: context,
    isPenetrateTemp: true,
    alignmentTemp: alignment,
    clickBgDismissTemp: true,
    widget: widget,

  );
  await Future.delayed(Duration(milliseconds: 350));
};