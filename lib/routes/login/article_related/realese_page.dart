import 'dart:async';

import 'package:blog_project/md_widgets/markdown_widget.dart';
import 'package:blog_project/tests.dart';
import 'package:blog_project/util/debug.dart';
import 'package:blog_project/widgets/only/my_markdown.dart';
import 'package:blog_project/widgets/reusable/dbg_container.dart';
import 'package:blog_project/widgets/reusable/white_border.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:html/parser.dart' show parse;

class ReleaseArticle extends StatefulWidget {
  @override
  _ReleaseArticleState createState() => _ReleaseArticleState();
}

class _ReleaseArticleState extends State<ReleaseArticle> {
  TextEditingController controller = TextEditingController();
  int lastUpdate = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller.addListener(() {
      lastUpdate = DateTime.now().millisecondsSinceEpoch;
      Timer(Duration(seconds: 1), () {
        var current = DateTime.now().millisecondsSinceEpoch;
        if (current - lastUpdate > 990) {
          log(47, 'refresh');
          if (mounted) {
            setState(() {});
          }
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          color: Color(0xffd9d9f3),
        ),
        Column(
          children: [
            Row(children: [Expanded(child: Container()),
            WhiteBorder(
              child: MaterialButton(onPressed: (){

              },child: Padding(padding: EdgeInsets.all(10),child: Text('从本地获取'))),
            ),SizedBox(width: 20,),WhiteBorder(
                child: MaterialButton(onPressed: (){

                },child: Padding(padding: EdgeInsets.all(10),child: Text('发布文章'))),
              )],),
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: WhiteBorder(
                      child: TextField(
                        controller: controller,
                        maxLines: 999,
                        keyboardType: TextInputType.multiline,
                      ),
                    ),
                    flex: 1,
                  ),
                  SizedBox(width: 10,),
                  Expanded(
                    child: WhiteBorder(
                      child: Align(
                          alignment: Alignment.topCenter,
                          child: MyMarkDown(controller.text)),
                    ),
                    flex: 1,
                  )
                ],
              ),
            ),
          ],
        )
      ],
    );
  }
}
