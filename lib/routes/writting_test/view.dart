import 'package:blog_project/util/debug.dart';
import 'package:blog_project/util/getx_debug_tool.dart';
import 'package:blog_project/widgets/test/md_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:get/get.dart';

import 'logic.dart';
import 'package:markdown/markdown.dart' as m;

class WrittingTestComponent extends StatefulWidget {

  // static var previewMarkdown=true;
  static var previewMarkdown=false;
  @override
  _WrittingTestComponentState createState() => _WrittingTestComponentState();
}

class _WrittingTestComponentState extends State<WrittingTestComponent> {
  final logic = Get.put(WrittingTestLogic());
  final state = Get.find<WrittingTestLogic>().state;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topLeft,
      child: Wrap(
        children: [
          MarkdownBody(
            data:
"""

"""

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
            selectable: false,
            builders: <String, MarkdownElementBuilder>{
              'warning': WarningBuilder(),
            },
            blockSyntaxes: [
              B2BlockSyntax(),
            ],
          )
          // MarkdownBody(
          //   data: '<img>fdslfffffaj</img>sdflakjr',
          //   selectable: true,
          //   // fitContent: false,
          //   // softLineBreak: true,
          // ),
          // MarkdownBody(
          //   data: '555',
          //   selectable: true,
          // ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    Get.delete<WrittingTestLogic>();
    super.dispose();
  }
}
