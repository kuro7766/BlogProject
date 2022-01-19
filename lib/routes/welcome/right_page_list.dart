import 'package:blog_project/entity/tag_id_entity.dart';
import 'package:blog_project/entity/tag_name_entity.dart';
import 'package:blog_project/entity/weather_bean_entity.dart';
import 'package:blog_project/routes/blog_list_main_content/logic.dart';
import 'package:blog_project/routes/blog_list_main_content/view.dart';
import 'package:blog_project/routes/welcome/inner_layer.dart';
import 'package:blog_project/util/debug.dart';
import 'package:blog_project/vars/configuration.dart';
import 'package:blog_project/vars/django_function.dart';
import 'package:blog_project/widgets/only/inner_layer.dart';
import 'package:blog_project/widgets/only/titile_widget.dart';
import 'package:blog_project/widgets/reusable/http_builder.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../vars/consts.dart';

class CenterInnerLayerContainerState extends State<CenterInnerLayerContainer>
    with SingleTickerProviderStateMixin {
  int page = 1;
  Animation<RelativeRect> animation;
  AnimationController controller;
  final MainContentLogic logic = Get.put(MainContentLogic());

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
    log2(1, 'rebuild right');
    return ManageInnerLayer(
      left: MainContentPage(),
      right: Padding(
        padding: EdgeInsets.only(left: 20),
        child: ListView(shrinkWrap: true, children: [
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
                            text: '推荐',
                          ),
                          Tab(icon: Icon(Icons.access_time), text: '其他'),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: TabBarView(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 8.0),
                          child: TitleCard(
                            title: '天气',
                            child:
                            // Text('暂无')
                            SizedBox(
                                height: 120,
                                child: Text('暂无')
                                // Icon(Icons.wb_sunny),
                                ),
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
            title: '博客公告',
            child: Padding(
                padding: EdgeInsets.only(top: 20),
                child: Text('即将正式上线')
                // HttpBuilder<List<TagIdEntity>>(
                //     url: DjangoUrl.getUserTags(Config.user),
                //     builder: (c, j) => Wrap(
                //           children: List.generate(
                //               j.length,
                //               (index) => HttpBuilder<TagNameEntity>(
                //                     url: DjangoUrl.getTagNameById(
                //                         j[index].tagId),
                //                     builder: (c1, j1) => GestureDetector(
                //                         onTap: () {
                //                           logic.toTagList(home: true);
                //                         },
                //                         child: Chip(label: Text(j1.tagName))),
                //                   )),
                //         ))
            ),
          ),
          TitleCard(
            title: '小游戏',
            child: Align(
              alignment: Alignment.centerLeft,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text("击剑游戏 hot"),Icon(Icons.local_fire_department,color: Colors.red,)
                    ],
                  )
                ],
              ),
            ),
          )
        ]),
      ),
    );
  }
}
