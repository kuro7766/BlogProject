import 'dart:math';

import 'package:blog_project/entity/article_id_entity.dart';
import 'package:blog_project/entity/article_item_entity.dart';
import 'package:blog_project/routes/welcome/part/welcome/inner_layer.dart';
import 'package:blog_project/util/debug.dart';
import 'package:blog_project/vars/django_function.dart';
import 'package:blog_project/vars/configuration.dart';
import 'package:blog_project/widgets/only/image_item.dart';
import 'package:blog_project/widgets/only/inner_layer.dart';
import 'package:blog_project/widgets/only/page_index_button.dart';
import 'package:blog_project/widgets/only/titile_widget.dart';
import 'package:blog_project/widgets/only/title_list_card.dart';
import 'package:blog_project/widgets/reusable/dbg_container.dart';
import 'package:blog_project/widgets/reusable/float_box_widget.dart';
import 'package:blog_project/widgets/reusable/http_builder.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../vars/consts.dart';

class RightList extends State<CenterInnerLayerContainer> {
  int page = 1;

  @override
  Widget build(BuildContext context) {
    return ManageInnerLayer(
      left: HttpBuilder<List<ArticleIdEntity>>(
        url: DjangoUrl.selectArticleIdByUserName(Config.user),
        builder: (c, j) {
          int pageCount = (j.length ~/ 10) + (j.length % 10 == 0 ? 0 : 1);
          int rowIndexCount = (min<int>(Config.currentPage + 3, pageCount)) -
              (max<int>(Config.currentPage - 3, 1)) +
              1 +
              2;
          if (rowIndexCount == 2) rowIndexCount = 0;

          return Column(
            children: [
              ListView.builder(
                  shrinkWrap: true,
                  itemCount: j.length,
                  itemBuilder: (c, i) {
                    // return FloatBoxWidget(child: ImgItem());
                    return HttpBuilder<ArticleItemEntity>(
                      url: DjangoUrl.selectArticleIdPictureDescription(
                          j[i].articleId),
                      builder: (c1, j1) {
                        return ImgItem(
                          imageUrl: j1.pictureUrl,
                          text: j1.articleDescription,
                        );
                        return Text('${j1.toJson()}');
                      },
                    );
                    return Text('${j[i].articleId}');
                    // return HttpBuilder(url: DjangoUrl.selectArticleIdPictureDescription(j[i]['article_id'], '1'),
                    // builder: (c1,j1){
                    //   return ImgItem(imageUrl: 'http://kuroweb.cf/picture/1615892316837.jpg',text: '${j[i]}',);
                    // },);
                  }),
              // ListView.builder(
              //   itemBuilder: (c, i) {
              //     return PageIndexButton(i + 1);
              //   },
              //   scrollDirection: Axis.horizontal,
              // ),
            ]..add(rowIndexCount == 3
                ? DbgContainer()
                : Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(rowIndexCount, (index) {
                      // return PageIndexWidget(
                      //     child: Icon(Icons.arrow_forward_ios_outlined))
                      // PageIndexWidget(child: Icon(Icons.arrow_forward_ios_outlined))
                      if (index == rowIndexCount - 1) {
                        return PageIndexWidget(
                            child: Icon(Icons.arrow_forward_ios_outlined));
                      } else if (index == 0) {
                        return PageIndexWidget(
                            child: Icon(Icons.arrow_back_ios_outlined));
                      }
                      return PageIndexButton(
                        index,
                        highlight: index == Config.currentPage,
                      );
                    }),
                  )),
          );
        },
      ),
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
                title: '标签',
                child: GridView.builder(shrinkWrap: true,itemCount: 10,gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3
                ), itemBuilder:(c,i){
                  return Text('$i');
                }),
              )
            ]),
      ),
    );
  }
}
