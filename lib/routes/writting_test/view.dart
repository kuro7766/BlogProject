import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:get/get.dart';

import 'logic.dart';

class WrittingTestComponent extends StatefulWidget {
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
            data: 'fdsk'*200,
            selectable: true,
            // fitContent: false,
            softLineBreak: true,
          ),
          MarkdownBody(
            data: '555',
            selectable: true,
          ),
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
