import 'package:blog_project/routes/article/unified_impl.dart';
import 'package:blog_project/util/annotation/widget_article_meta_data.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'logic.dart';

@ArticleMetaData({"title": "B", "tag": "", "date": "2022-02-12 19:15:42"})
class React1Component extends StatelessWidget with UnifiedWritingImpl {
  final logic = Get.put(React1Logic());
  final state = Get.find<React1Logic>().state;

  @override
  Widget get descriptionWidgetContent => Column(
        children: [
          md('计数器测试'),
        ],
      );

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Obx(() {
        return Column(
          children: [
            descriptionWidgetContent,
            Text('${state.counter.value}'),
            ElevatedButton(
                onPressed: () {
                  state.counter.value++;
                },
                child: Text('click'))
          ],
        );
      }),
    );
  }
}
