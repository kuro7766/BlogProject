

import 'package:blog_project/logic/main_content/view.dart';
import 'package:blog_project/routes/welcome/part/welcome/inner_layer.dart';
import 'package:blog_project/widgets/only/inner_layer.dart';
import 'package:blog_project/widgets/only/titile_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../vars/consts.dart';

class CenterInnerLayerContainerState extends State<CenterInnerLayerContainer>
    with SingleTickerProviderStateMixin {
  int page = 1;
  Animation<RelativeRect> animation;
  AnimationController controller;

  @override
  void initState() {
    super.initState();
    controller = new AnimationController(
        vsync: this, duration: Duration(milliseconds: 300));
    controller.value = 1;
    animation = RelativeRectTween(
            begin: RelativeRect.fromLTRB(0, 0, 0, -200),
            end: RelativeRect.fromLTRB(0, 0, 0, 0))
        .animate(controller);
  }

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ManageInnerLayer(
      left:
      // SizeTransition(
      //     sizeFactor: controller, child: MarkDownWeb(Tests.s)),
      MainContentPage(),
      right: Padding(
        padding: EdgeInsets.only(left: 20),
        child: ListView(
            shrinkWrap: true,
            children: [
              SizedBox(
                height: 300,
                child: DefaultTabController(
                  length: 3,
                  child: Column(
                    children: <Widget>[
                      Container(
                        constraints: BoxConstraints(maxHeight: Const.barHeight),
                        child: Material(
                          color: Colors.lightBlue,
                          child: TabBar(
                            indicatorColor: Colors.black,
                            tabs: [
                              Tab(
                                icon: Icon(Icons.wb_sunny),
                                text: '天气',
                              ),
                              Tab(
                                icon: Icon(Icons.local_fire_department),
                                text: '热门文章',
                              ),
                              Tab(icon: Icon(Icons.access_time), text: '最近文章'),
                            ],
                          ),
                        ),
                      ),
                      Expanded(
                        child: TabBarView(
                          children: [
                            TitleCard(
                              title: '天气',
                              child: SizedBox(
                                height: 120,
                                child: Icon(Icons.wb_sunny),
                              ),
                            ),
                            Icon(Icons.directions_transit),
                            Icon(Icons.directions_bike),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              TitleCard(
                title: '标签云',
                child: Padding(
                  padding: EdgeInsets.only(top: 20),
                  child:
                  Wrap(
                    spacing: 1.0, // gap between adjacent chips
                    runSpacing: 1.0, // gap between lines
                    children: <Widget>[
                      Chip(label: Text('a')),
                      Chip(label: Text('a')),
                      Chip(label: Text('javaa')),
                      Chip(label: Text('a')),
                      Chip(label: Text('a')),
                      Chip(label: Text('a')),
                      Chip(label: Text('a')),
                      Chip(label: Text('a')),
                      Chip(
                        avatar: CircleAvatar(backgroundColor: Colors.blue.shade900, child: Text('ML')),
                        label: Text('Lafayette'),
                      ),
                      Chip(
                        avatar: CircleAvatar(backgroundColor: Colors.blue.shade900, child: Text('#')),
                        label: Text('Mulligan'),
                      ),
                      Chip(
                        avatar: ClipOval(child: Container(color: Colors.red,)),
                        label: Text('Laurens'),
                      ),
                    ],
                  )
                  // GridView.builder(
                  //     shrinkWrap: true,
                  //     itemCount: 10,
                  //     gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  //         crossAxisCount: 5),
                  //     itemBuilder: (c, i) {
                  //       return Text('$i');
                  //     }),
                ),
              ),
              TitleCard(title: '统计',child:
                Align(
                  alignment: Alignment.centerLeft,
                  child: Column(
                    crossAxisAlignment:  CrossAxisAlignment.start,
                    children: [
                      Text("文章：132 篇"),
                      Text("评论：510 条"),
                      Text("访问总量：67,021次"),
                      Text("运行时长：2年219天"),
                      Text("最后更新：2天前"),
                    ],
                  ),
                ),)
            ]),
      ),
    );
  }
}
