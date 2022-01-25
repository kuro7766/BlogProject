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

    // final m.Document document = m.Document(
    //     extensionSet: m.ExtensionSet.gitHubFlavored,
    //     encodeHtml: false,
    //     inlineSyntaxes: [TaskListSyntax()]);
    // // final List<String> lines = data.split(RegExp(r'(\r?\n)|(\r?\t)|(\r)'));
    // List<m.Node> nn=document.parseInline('''
    // 另外还需要考虑自定义能力，getx mvc页面仍然可以使用，呈现的仍然是stateless widget，因此用mixin更为合适，mixin应该提供如下信息：
    // - 组件预览效果
    // - 组件标题
    // ''');
    // for(var n in nn){
    //
    //   Dbg.log(n.runtimeType,'R');
    //   Dbg.log(n is m.Element,'R');
    // }
    // List<m.Node> nodes = document.parseLines(lines);
    // _tocList = LinkedHashMap();
    // _helper = MarkdownHelper(wConfig: widgetConfig);
    // _widgets = [];
    // nodes.forEach((element) {
    //   _widgets.add(_generatorWidget(element, childMargin));
    // });


    return Align(
      alignment: Alignment.topLeft,
      child: Wrap(
        children: [
          MarkdownBody(
            data:
            """
B Hello **bold**
sfdasd
xxx warning **bold**
"""
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
