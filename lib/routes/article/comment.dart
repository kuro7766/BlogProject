import 'package:blog_project/widgets/only/markdown_web.dart';
import 'package:flutter/material.dart';

class CommentArea extends StatefulWidget {
  @override
  _CommentAreaState createState() => _CommentAreaState();
}

class _CommentAreaState extends State<CommentArea> {
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
              child: Tooltip(message: '上一篇',child: ElevatedButton(onPressed: () {}, child: Text('上一篇')))),
          Align(
              alignment: AlignmentDirectional.centerEnd,
              child: Tooltip(message: '下一篇',child: ElevatedButton(onPressed: () {}, child: Text('下一篇'))))
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
