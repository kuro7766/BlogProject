

import 'dart:async';

import 'package:blog_project/tests.dart';
import 'package:blog_project/util/debug.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';

import 'md_widgets/markdown_widget.dart';

class MarkdownPage extends StatefulWidget {
  final String data;

  MarkdownPage(this.data);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _MarkdownPageState();
  }
}

class _MarkdownPageState extends State<MarkdownPage>
    with TickerProviderStateMixin {
  AnimationController controller;
  Animation<double> animation;

  @override
  void initState() {
    super.initState();
    controller =
        new AnimationController(vsync: this, duration: Duration(milliseconds: 500));
    controller.value=1;
    animation =
        // Tween(begin: 1.0, end: 0.0).animate(controller);
    CurveTween(curve: Curves.fastOutSlowIn).animate(controller);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        GestureDetector(
          onTap: () {
            Debug.log(4, 'on tap');
            controller.reverse();
            Timer(Duration(seconds: 1), (){
              controller.forward();
            });
          },
          child: SizeTransition(
            sizeFactor: animation,
            child: SizedBox(
              height: 70,
              child: Container(
                color: Colors.deepPurpleAccent,
                child: Row(
                  children: [
                    Expanded(flex: 1, child: Text('我的博客')),
                    Expanded(flex: 10, child: Text('内容'))
                  ],
                ),
              ),
            ),
          ),
        ),
        Expanded(
          child: Row(
            children: [
              Expanded(
                flex: 1,
                child: ListView(
                  children: [
                    FlutterLogo(
                      size: 100,
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text('导航'),
                    ),
                    InkWell(
                      onTap: () {},
                      child: Padding(
                        padding: EdgeInsets.only(top: 10, bottom: 10),
                        child: Align(
                          alignment: Alignment.center,
                          child: Text('首页'),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                flex: 10,
                child: ListView(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        // Expanded(child: buildTocWidget()),
                        Expanded(
                            child: Align(
                                alignment: Alignment.topCenter,
                                child: buildMarkdownListView()),
                            flex: 3),
                        Expanded(
                            child: ListView.builder(
                          shrinkWrap: true,
                          itemBuilder: (c, i) {
                            Debug.log(3, i);
                            return Text('$i');
                          },
                          itemCount: 100,
                        ))
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    ));
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
          child: ElevatedButton(onPressed: () {}, child: Text('发表评论'))));
    return ListView(
      shrinkWrap: true,
      children: c,
    );
  }

  Widget buildMarkdown() => MarkdownWidget(
        data: widget.data,
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

  @deprecated
  Widget getMarkdownBody(BuildContext context) {
    final isDark =
        Theme.of(context).brightness == Brightness.dark ? true : false;

    return MarkdownWidget(
      data: Tests.s,
      shrinkWrap: true,
      loadingWidget: Container(),
      styleConfig: StyleConfig(
          codeConfig: CodeConfig(codeStyle: TextStyle(fontSize: 50)),
          pConfig: PConfig(
              onLinkTap: (url) => print('should launch url'),
              selectable: false),
          titleConfig: TitleConfig(
            showDivider: false,
            commonStyle: TextStyle(color: Colors.red),
          ),
          imgBuilder: (url, attr) {
            double w;
            double h;
            if (attr['width'] != null) w = double.parse(attr['width']);
            if (attr['height'] != null) h = double.parse(attr['height']);
            return GestureDetector(
              onTap: () => print('should launch url'),
              child: Card(
                child: FadeInImage.assetNetwork(
                  placeholder: 'assets/img/loading.gif',
                  placeholderScale: 0.5,
                  image: url ?? '',
                  height: h,
                  width: w,
                  fit: BoxFit.cover,
                ),
              ),
            );
          },
          preConfig: PreConfig(
              preWrapper: (child, text) {
                return Stack(
                  children: <Widget>[
                    child,
                    Container(
                      margin: EdgeInsets.only(top: 5, right: 5),
                      alignment: Alignment.topRight,
                      child: IconButton(
                        onPressed: () {
                          Widget toastWidget = Align(
                            alignment: Alignment.bottomCenter,
                            child: Container(
                              margin: EdgeInsets.only(bottom: 50),
                              decoration: BoxDecoration(
                                  border: Border.all(
                                      color: Color(0xff006EDF), width: 2),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(
                                    4,
                                  )),
                                  color: Color(0xff007FFF)),
                              width: 100,
                              height: 30,
                              child: Center(
                                child: Material(
                                  color: Colors.transparent,
                                  child: Text(
                                    '复制成功',
                                    style: TextStyle(
                                        fontSize: 10, color: Colors.white),
                                  ),
                                ),
                              ),
                            ),
                          );
                          // ToastWidget().showToast(context, toastWidget, 1);
                        },
                        icon: Icon(
                          Icons.content_copy,
                          size: 10,
                        ),
                      ),
                    )
                  ],
                );
              },
              language: 'dart'),
          markdownTheme:
              isDark ? MarkdownTheme.darkTheme : MarkdownTheme.lightTheme),
    );
  }
}
