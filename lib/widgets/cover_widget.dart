import 'dart:math';

import 'package:blog_project/routes/article/unified.dart';
import 'package:blog_project/util/getx_debug_tool.dart';
import 'package:blog_project/util/my_code_style.dart';
import 'package:blog_project/util/simple_http_builder.dart';
import 'package:blog_project/widgets/measure_size.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

import 'only/titile_widget.dart';
import 'package:path/path.dart' as p;

class MaskWidget extends StatelessWidget {
  final Widget child;
  final useMask;

  MaskWidget({
    Key key,
    this.child,
    this.useMask = true,
  }) : super(key: key);
  final __sizeNotifier = (Size(0, 0)).obs;

  @override
  Widget build(BuildContext context) {
    return MeasureSize(
      onChange: (size) {
        Dbg.log('$size');
        if (useMask) __sizeNotifier.value = size;
      },
      child: Stack(
        children: [
          child,
          Obx(() {
            return Container(
              height: __sizeNotifier.value.height,
              width: __sizeNotifier.value.width,
              color: Colors.transparent,
            );
            // return Container();
          })
          //
        ],
      ),
    );
  }
}
