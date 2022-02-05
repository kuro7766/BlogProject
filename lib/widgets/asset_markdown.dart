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

class CoverMarkdown extends StatelessWidget {
  final String resource;
  final int digestSubStringLength;
  final __sizeNotifier = (Size(0, 0)).obs;
  final useMask;
  final String title;
  final String resourceString;

  CoverMarkdown(
      {Key key,
      this.resource,
      this.digestSubStringLength = 0,
      this.useMask = false,
      this.title,
      this.resourceString})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SimpleHttpBuilder(
      httpFuture: (() async {
        if (resourceString != null) {
          return ResponseContent.success([this.title ?? '无标题', resourceString]);
        }
        var s = await rootBundle.loadString(Uri.decodeFull(resource));
        // Dbg.log(s);
        return ResponseContent.success(
            [Uri.decodeFull(p.basename(resource)), s]);
      })(),
      builder: (tuple) {
        var mdContent = tuple[1];
        var title = tuple[0].replaceFirst('\.md', '');
        mdContent = mdContent.replaceAll(RegExp(r'(^"""|"""$)'), '');

        return MeasureSize(
          onChange: (size) {
            Dbg.log('$size');
            if (useMask) __sizeNotifier.value = size;
          },
          child: Stack(
            children: [
              UnifiedItem(
                title: title,
                child: MarkdownBody(
                  syntaxHighlighter: HighLight(),
                  data: (digestSubStringLength <= 0
                          ? '$mdContent'
                          : mdContent.substring(0,
                              min('$mdContent'.length, digestSubStringLength)))
                      .replaceFirst(title, ''),
                  selectable: true,
                  onTapLink: (String text, String href, String title) async {
                    var fail = !await launch(href);
                    if (fail) {
                      Get.snackbar('Error', 'Could not open link',
                          snackPosition: SnackPosition.BOTTOM);
                    }
                  },
                ),
              ),
              Obx(() {
                return Container(
                  height: __sizeNotifier.value.height,
                  width: __sizeNotifier.value.width,
                  color: Colors.transparent,
                );
                // return Container();
              })
              //
              // Expanded(
              //   child: LayoutBuilder(builder: (ctx,constraints){
              //     Dbg.log(constraints);
              //     return Text('fdsalkj');
              //   }),
              // )
            ],
          ),
        );
        // return Markdown(
        //   shrinkWrap: true,
        //   selectable: true,
        //   data: dd,
        // );
      },
    );
  }
}
