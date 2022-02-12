import 'package:blog_project/routes/article/unified_impl.dart';
import 'package:blog_project/util/annotation/widget_article_meta_data.dart';
import 'package:blog_project/util/getx_debug_tool.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:widget_mask/widget_mask.dart';

import 'logic.dart';

@ArticleMetaData({"title": "Test", "tag": "", "date": "2022-02-12 21:20:54"})
class React1Component extends StatefulWidget with UnifiedWritingImpl {
  @override
  _React1ComponentState createState() => _React1ComponentState();

  @override
  // TODO: implement descriptionWidgetContent
  Widget get descriptionWidgetContent => Column(
        children: [md('计数器测试-新')],
      );
}

class _React1ComponentState extends State<React1Component>
    with UnifiedWritingImpl {
  final logic = Get.put(React1Logic());
  final state = Get.find<React1Logic>().state;

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
                child: Text('click')),
       
          ],
        );
      }),
    );
  }

  @override
  void dispose() {
    Dbg.log('delete');
    Get.delete<React1Logic>();
    super.dispose();
  }
}
