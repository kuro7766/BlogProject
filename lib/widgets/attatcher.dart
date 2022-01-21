import 'package:flutter/cupertino.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';

var attach = (BuildContext context, AlignmentGeometry alignment,Widget widget) async {
  await SmartDialog.showAttach(
    targetContext: context,
    isPenetrateTemp: false,
    alignmentTemp: alignment,
    clickBgDismissTemp: true,
    widget: widget,
  );
  // await Future.delayed(Duration(milliseconds: 350));
  // SmartDialog.dismiss();
};
