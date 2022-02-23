import 'dart:html';
import 'dart:io';

import 'package:blog_project/util/debug.dart';
import 'package:blog_project/util/getx_debug_tool.dart';
import 'package:blog_project/widgets/mmarkdown.dart';
import 'package:blog_project/widgets/test/md_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

import 'logic.dart';
import 'package:markdown/markdown.dart' as m;

class WritingTestComponent extends StatefulWidget {
  // static var previewMarkdown = true;
  static get previewMarkdown => _WritingTestComponentState.previewMarkdown;

  @override
  _WritingTestComponentState createState() => _WritingTestComponentState();
}

class _WritingTestComponentState extends State<WritingTestComponent> {
  final logic = Get.put(WrittingTestLogic());
  final state = Get.find<WrittingTestLogic>().state;

  // static var previewMarkdown = true;
  static var previewMarkdown = false;
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topLeft,
      child: Column(
        children: [
          MMarkdown(data: [
            r"""
dfss
ddfsdfaf

fff$aaa$fffs$bbb$dsdssds


"""
          ].last,),
          SizedBox(height: 300),
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
