import 'package:blog_project/routes/main_page/main_base_widget.dart';
import 'package:blog_project/widgets/only/markdown_web.dart';
import 'package:flutter/material.dart';

class CommentArea extends MainContentBaseStatelessWidget {
  @override
  Widget build(BuildContext context) {
    return buildMarkdownListView();
  }

  Widget buildMarkdownListView() {
    List<Widget> c = [
      // SizedBox(height: 500,child: getMarkdownBody(context))
      Stack(
        children: [
          Align(
              alignment: AlignmentDirectional.centerStart,
              child: Tooltip(
                  message: '上一篇',
                  child: ElevatedButton(onPressed: () {}, child: Text('上一篇')))),
          Align(
              alignment: AlignmentDirectional.centerEnd,
              child: Tooltip(
                  message: '下一篇',
                  child: ElevatedButton(onPressed: () {}, child: Text('下一篇'))))
        ],
      )
    ];
    c
      ..add(Text('发表评论'))
      ..add(SizedBox(
        height: 200,
        child: TextField(
          keyboardType: TextInputType.multiline,
          maxLines: null,
          decoration: InputDecoration(
              border: InputBorder.none,
              hintText: '居然什么也不说，哼',
              hintStyle: TextStyle(fontSize: 12)),
        ),
      ))
      ..add(Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [Text('姓名*'),TextField(
          keyboardType: TextInputType.multiline,
          maxLines: null,
          decoration: InputDecoration(
              border: InputBorder.none,
              hintText: '请输入姓名',
              hintStyle: TextStyle(fontSize: 12)),
        ), Text('邮箱'), TextField(
          keyboardType: TextInputType.multiline,
          maxLines: null,
          decoration: InputDecoration(
              border: InputBorder.none,
              hintText: '请输入邮箱',
              hintStyle: TextStyle(fontSize: 12)),
        ),Text('地址'),TextField(
          keyboardType: TextInputType.multiline,
          maxLines: null,
          decoration: InputDecoration(
              border: InputBorder.none,
              hintText: '输入博客地址',
              hintStyle: TextStyle(fontSize: 12)),
        ),],
      ))
      ..add(Align(
          alignment: AlignmentDirectional.centerStart,
          child: ElevatedButton(
              onPressed: () {
                // RenderBox box = mdKey.currentContext.findRenderObject();
                // Offset position = box.localToGlobal(Offset.zero); //this is global position
                // double y = position.dy;
                //
              },
              child: Text('发表评论'))));
    return ListView(
      shrinkWrap: true,
      children: c,
    );
  }
}
