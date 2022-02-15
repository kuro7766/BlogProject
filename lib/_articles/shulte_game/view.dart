import 'dart:math';

import 'package:blog_project/routes/article/unified_impl.dart';
import 'package:blog_project/routes/article/unified_impl.dart';
import 'package:blog_project/util/annotation/widget_article_meta_data.dart';
import 'package:blog_project/util/getx_debug_tool.dart';
import 'package:blog_project/util/obx_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'logic.dart';

@ArticleMetaData({"title": "舒尔特游戏", "tag": "游戏", "date": "2022-02-15 12:08:17"})
class Shulte_gameComponent extends StatefulWidget with UnifiedWritingImpl {
  @override
  _Shulte_gameComponentState createState() => _Shulte_gameComponentState();

  @override
  // TODO: implement descriptionWidgetContent
  Widget get descriptionWidgetContent => md('舒尔特游戏');
}

class _Shulte_gameComponentState extends State<Shulte_gameComponent>
    with UnifiedWritingImpl {
  final logic = Get.put(Shulte_gameLogic());

  @override
  Widget build(BuildContext context) {
    Dbg.log('$w,$h', 'wh2');
    var blockSize = min(h(context) - 200, w(context));
    var blockItemSize = blockSize / 5;
    Dbg.log(blockSize);
    return Column(
      children: [
        descriptionWidgetContent,
        SizedBox(
            width: blockSize,
            height: blockSize,
            child: Stack(
              children: [
                Obx(() {
                  return Visibility(
                    visible: !logic.right.value,
                    child: Center(
                      child: Text('${logic.nextTap}', style: TextStyle(
                          color: Colors.grey, fontSize: blockSize / 2),),
                    ),
                  );
                }),
                ObxObserveWidget([logic.myRefresh],() {
                  return GridView(
                      children: List.generate(25, (index) {
                        var x = index % 5;
                        var y = index ~/ 5;
                        return GestureDetector(
                          onTap: () {
                            logic.onTap(x, y);
                          },
                          child: Container(
                            width: blockItemSize,
                            height: blockItemSize,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                border: Border.all(color: Colors.black,
                                    width: 1)),
                            child: Center(
                              child: Text(
                                '${logic.getValue(x, y)}',
                                style: TextStyle(
                                    fontSize: blockItemSize * 0.8,
                                    color: Colors.black),
                              ),
                            ),
                          ),
                        );
                      }),
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 5));
                }),
              ],
            ))
      ],
    );
  }

  @override
  void dispose() {
    Get.delete<Shulte_gameLogic>();
    super.dispose();
  }
}
