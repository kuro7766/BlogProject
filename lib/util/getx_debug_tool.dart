//一个免context的debug tool，可显示当前路由，彩色打印工具
import 'dart:io';

import 'package:get/get.dart';

class Dbg {
  // debug toggle
  static const bool debug = true;

  static const _logFilterConfigs = {
    'enableTagOnly': false, // 只允许有tag的打印，其余全部过滤
    'enabledTagName': '' // 允许打印的tag名称

    ,
    'routeOnly': false, // 只允许指定的route的打印，其余全部过滤
    'enabledRouteName': '' // 允许打印的route名称

    // 以下暂不可用
    ,
    'disableByRegex': false,
    'disabledRegex': '',

    'enableByRegex': false,
    'enabledRegex': ''
  };

  static void log(dynamic msg, [String tag]) {
    if (true) {
      if (debug &&
          (!_logFilterConfigs['enableTagOnly'] ||
              _logFilterConfigs['enableTagOnly'] &&
                  tag?.compareTo(_logFilterConfigs['enabledTagName']) == 0) &&
          (!_logFilterConfigs['routeOnly'] ||
              _logFilterConfigs['routeOnly'] &&
                  Get.currentRoute
                          .compareTo(_logFilterConfigs['enabledRouteName']) ==
                      0)) {
        print('\x1B[35m[DebugTool]\x1B[0m : '
            '${tag == null ? "" : " \x1B[32m<$tag>\x1B[0m"} '
            'Route\x1B[35m["${Get.currentRoute}"]\x1B[0m->| $msg');
      }
    }
    // if (Platform.isIOS) {
    //   print('[DebugTool] : '
    //       '${tag == null ? "" : " <$tag>"} '
    //       'Route["${Get.currentRoute}"]->| $msg');
    // }
  }

  static get _colorTable => {
        'black': '\x1B[30m',
        'red': '\x1B[31m',
        'green': '\x1B[32m',
        'yellow': '\x1B[33m',
        'blue': '\x1B[34m',
        'magenta': '\x1B[35m',
        'cyan': '\x1B[36m',
        'white': '\x1B[37m',
        'reset': '\x1B[0m',
      };

  // color from color table
  static String coloredString(dynamic msg, String color) {
    return '${_colorTable[color]}$msg\x1B[0m';
  }
}
