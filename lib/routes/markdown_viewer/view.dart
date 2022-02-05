import 'package:blog_project/indexes/generated_framework_widget_indexes.dart';
import 'package:blog_project/routes/article/unified.dart';
import 'package:blog_project/routes/article/unified_impl.dart';
import 'package:blog_project/routes/blog_gate/logic.dart';
import 'package:blog_project/routes/blog_gate/state_global.dart';
import 'package:blog_project/widgets/asset_markdown.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'logic.dart';

class UnifiedViewerComponent extends StatefulWidget {
  @override
  _UnifiedViewerComponentState createState() => _UnifiedViewerComponentState();
}

class _UnifiedViewerComponentState extends State<UnifiedViewerComponent> {
  final logic = Get.put(MarkdownViewerLogic());
  final state = Get.find<MarkdownViewerLogic>().state;

  @override
  Widget build(BuildContext context) {
    dynamic data=(articleInfoAndMetasBuilder[articleInfoAndMetasQuickIndex[
    Get.find<GlobalLogic>().state.articleId.value]]['builder']
    as Function)();
    return Column(
      children: [
        UnifiedItem(
          title: (data as UnifiedWritingImpl).metaInfo['title'],
          child: (data as Widget),
        ),
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
