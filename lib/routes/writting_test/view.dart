import 'dart:html';
import 'dart:io';

import 'package:blog_project/util/debug.dart';
import 'package:blog_project/util/getx_debug_tool.dart';
import 'package:blog_project/widgets/test/md_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

import 'logic.dart';
import 'package:markdown/markdown.dart' as m;

class WrittingTestComponent extends StatefulWidget {
  // static var previewMarkdown = true;
  static get previewMarkdown=>_WrittingTestComponentState.previewMarkdown;
  @override
  _WrittingTestComponentState createState() => _WrittingTestComponentState();
}

class _WrittingTestComponentState extends State<WrittingTestComponent> {
  final logic = Get.put(WrittingTestLogic());
  final state = Get.find<WrittingTestLogic>().state;

  // static var previewMarkdown = true;
  static var previewMarkdown = false;
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topLeft,
      child: MarkdownBody(
        data: ["""
x
"""].last

        // http://kuroweb.tk/picture/16433054765217948.jpg
//             """
// B Hello **bold**
// sfdasd
// xxx warning **bold**
// """r

        // """
        // B Hello **bold**
        //
        // [[warning]] warning **bold**
        // """
        ,
        selectable: true,
        builders: <String, MarkdownElementBuilder>{
          'warning': WarningBuilder(),
        },
        blockSyntaxes: [
          B2BlockSyntax(),
        ],
        onTapLink: (String text, String href, String title) async {
          var fail = !await launch(href);
          if (fail) {
            Get.snackbar('Error', 'Could not open link',
                snackPosition: SnackPosition.BOTTOM);
          }
        },
      ),
    );
  }

  @override
  void dispose() {
    Get.delete<WrittingTestLogic>();
    super.dispose();
  }
}
