import 'package:blog_project/routes/article/unified_impl.dart';
import 'package:blog_project/routes/article/unified_impl.dart';
import 'package:blog_project/util/annotation/widget_article_meta_data.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'logic.dart';
@ArticleMetaData({
  "title": "舒尔特游戏",
  "tag":"游戏",
  "date": "2022-02-15 12:08:17"
})
class Shulte_gameComponent extends StatefulWidget with UnifiedWritingImpl{
  @override
  _Shulte_gameComponentState createState() => _Shulte_gameComponentState();
  @override
  // TODO: implement descriptionWidgetContent
  Widget get descriptionWidgetContent => md('舒尔特游戏');
}

class _Shulte_gameComponentState extends State<Shulte_gameComponent> with UnifiedWritingImpl{
  final logic = Get.put(Shulte_gameLogic());

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        descriptionWidgetContent
      ],
    );
  }

  @override
  void dispose() {
    Get.delete<Shulte_gameLogic>();
    super.dispose();
  }
}