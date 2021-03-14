
import 'package:blog_project/consts.dart';
import 'package:blog_project/md_widgets/markdown_widget.dart';
import 'package:blog_project/routes/welcome/right_list_view.dart';
import 'package:blog_project/util/debug.dart';
import 'package:blog_project/widgets/only/inner_layer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../tests.dart';

class RightListMdState extends State<InnerLayerContainer> {
  @override
  Widget build(BuildContext context) {
    return InnerLayer(left: buildMarkdownListView(),right: ListView.builder(
      shrinkWrap: true,
      itemBuilder: (c, i) {
        Debug.log(3, i);
        return Card(color: Const.cardColor,child: Text('$i'*20));
      },
      itemCount: 100,
    ),);
  }


  Widget buildMarkdownListView() {
    List<Widget> c = [
      Container(
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Colors.black,
          // image: const DecorationImage(
          //   image: NetworkImage(
          //       'https://flutter.github.io/assets-for-api-docs/assets/widgets/owl-2.jpg'
          //       // 'https://ww3.sinaimg.cn/mw690/632f581djw1e86v310m6bj211y0lcabx.jpg'
          //       ),
          //   fit: BoxFit.cover,
          // ),
          border: Border.all(
            color: Colors.black54,
            width: 8,
          ),
          borderRadius: BorderRadius.circular(12),
        ),
        child: buildMarkdown(),
      ),
      // SizedBox(height: 500,child: getMarkdownBody(context))
      Stack(
        children: [
          Align(
              alignment: AlignmentDirectional.centerStart,
              child: ElevatedButton(onPressed: () {}, child: Text('上一篇'))),
          Align(
              alignment: AlignmentDirectional.centerEnd,
              child: ElevatedButton(onPressed: () {}, child: Text('下一篇')))
        ],
      )
    ];
    c
      ..add(Text('发表评论'))
      ..add(TextField(
        keyboardType: TextInputType.multiline,
        maxLines: null,
        decoration: InputDecoration(
            border: InputBorder.none,
            hintText: '居然什么也不说，哼',
            hintStyle: TextStyle(fontSize: 12)),
      ))
      ..add(Row(
        children: [Text('姓名'), Text('邮箱'), Text('地址')],
      ))
      ..add(Align(
          alignment: AlignmentDirectional.centerStart,
          child: ElevatedButton(onPressed: () {
            // RenderBox box = mdKey.currentContext.findRenderObject();
            // Offset position = box.localToGlobal(Offset.zero); //this is global position
            // double y = position.dy;
            // Debug.log(7, y);
          }, child: Text('发表评论'))));
    return ListView(
      shrinkWrap: true,
      children: c,
    );
  }
  GlobalKey mdKey = GlobalKey();

  Widget buildMarkdown() => MarkdownWidget(
    data: Tests.s2,
    key: mdKey,
    shrinkWrap: true,
    styleConfig: StyleConfig(
        markdownTheme: MarkdownTheme.darkTheme,
        pConfig: PConfig(custom: (node) {
          return Text(
            '${node.tag}',
            style: TextStyle(color: Colors.blueGrey),
          );
        }),
        titleConfig: TitleConfig(
          showDivider: false,
          // commonStyle: TextStyle(color: Colors.black),
        ),
        preConfig: PreConfig(
            autoDetectionLanguage: true,
            preWrapper: (w, t) {
              return w;
            })),
  );
}
