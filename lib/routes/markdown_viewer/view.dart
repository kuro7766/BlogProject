import 'package:blog_project/routes/blog_gate/logic.dart';
import 'package:blog_project/widgets/asset_markdown.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'logic.dart';

class MarkdownViewerComponent extends StatefulWidget {
  @override
  _MarkdownViewerComponentState createState() =>
      _MarkdownViewerComponentState();
}

class _MarkdownViewerComponentState extends State<MarkdownViewerComponent> {
  final logic = Get.put(MarkdownViewerLogic());
  final state = Get.find<MarkdownViewerLogic>().state;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AssetMarkdown(
            resource: Get.find<GlobalLogic>().state.articleAssetResource.value),
        //底部小人
        SizedBox(
          height: 200,
        )
      ],
    );
  }

  @override
  void dispose() {
    Get.delete<MarkdownViewerLogic>();
    super.dispose();
  }
}
