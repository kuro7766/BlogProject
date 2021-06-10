import 'package:blog_project/entity/tag_id_entity.dart';
import 'package:blog_project/entity/tag_name_entity.dart';
import 'package:blog_project/entity/weather_bean_entity.dart';
import 'package:blog_project/routes/main_page/main_content/logic.dart';
import 'package:blog_project/routes/main_page/main_content/view.dart';
import 'package:blog_project/routes/welcome/part/welcome/inner_layer.dart';
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
                              child: HttpBuilder<WeatherBeanEntity>(
                                url: Const.weather,
                                builder2: (json) {
                                  return Column(
                                    children: [
                                      (json.weatherinfo.weather.contains('雨'))?Icon(Icons.cloud): Icon(Icons.wb_sunny),
                                      Text(json.weatherinfo.city),
                                      Text(json.weatherinfo.weather)
                                    ],
                                  );
                                },
                              )
                              // Icon(Icons.wb_sunny),
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
                child: HttpBuilder<List<TagIdEntity>>(
                    url: DjangoUrl.getUserTags(Config.user),
                    builder: (c, j) => Wrap(
                          children: List.generate(
                              j.length,
                              (index) => HttpBuilder<TagNameEntity>(
                                    url: DjangoUrl.getTagNameById(
                                        j[index].tagId),
                                    builder: (c1, j1) => GestureDetector(
                                        onTap: () {
                                          logic.toTagList(home: true);
                                        },
                                        child: Chip(label: Text(j1.tagName))),
                                  )),
                        ))),
          ),
          TitleCard(
            title: '统计',
            child: Align(
              alignment: Alignment.centerLeft,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("文章：132 篇"),
                  Text("评论：510 条"),
                  Text("访问总量：67,021次"),
                  Text("运行时长：2年219天"),
                  Text("最后更新：2天前"),
                ],
              ),
            ),
          )
        ]),
      ),
    );
  }
}
