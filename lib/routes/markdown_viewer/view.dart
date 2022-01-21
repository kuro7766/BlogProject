import 'package:blog_project/routes/blog_list_main_content/logic.dart';
import 'package:blog_project/widgets/asset_markdown.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'logic.dart';

class MarkdownViewerComponent extends StatefulWidget {
  @override
  _MarkdownViewerComponentState createState() => _MarkdownViewerComponentState();
}

class _MarkdownViewerComponentState extends State<MarkdownViewerComponent> {
  final logic = Get.put(MarkdownViewerLogic());
  final state = Get.find<MarkdownViewerLogic>().state;

  @override
  Widget build(BuildContext context) {
    return AssetMarkdown(resource:Get.find<GlobalLogic>().state.articleAssetResource.value);
  }

  @override
  void dispose() {
    Get.delete<MarkdownViewerLogic>();
    super.dispose();
  }
}