import 'dart:js' as js;

import 'package:flutter/cupertino.dart';


class JSUtil {
  static call({@required String function,@required List params}) {
    js.context.callMethod(function, params);
  }
}
