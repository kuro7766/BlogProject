import 'package:blog_project/routes/welcome/inner_layer.dart';
import 'package:blog_project/widgets/only/image_item.dart';
import 'package:blog_project/widgets/only/inner_layer.dart';
import 'package:blog_project/widgets/only/page_index_button.dart';
import 'package:blog_project/widgets/only/title_list_card.dart';
import 'package:blog_project/widgets/reusable/float_box_widget.dart';
import 'package:blog_project/widgets/reusable/http_builder.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../consts.dart';

class RightList extends State<InnerLayerContainer> {
  @override
  Widget build(BuildContext context) {
    return InnerLayer(
      left: ListView.builder(
          shrinkWrap: true,
          itemCount: 10,
          itemBuilder: (c, i) {
            if (i >= 9) {
              return Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  PageIndexButton(1,onTap: (){
                  },),
                  PageIndexButton(2),
                  PageIndexButton(3),

                  PageIndexWidget(child:Icon(Icons.arrow_forward_ios_outlined))
                ],
              );
            }
            // return FloatBoxWidget(child: ImgItem());
            return HttpBuilder(builder: (c,j){
              return ImgItem(imageUrl: j['img'],text: '$j',);
              return Text('${j['img']}');
            },);
          }),
      right: ListView(
          shrinkWrap: true,
          children: [
            SizedBox(
              height: 100,
              child: DefaultTabController(
                length: 3,
                child: Column(
                  children: <Widget>[
                    Container(
                      constraints: BoxConstraints(maxHeight: Const.barHeight),
                      child: Material(
                        color: Colors.lightBlue,
                        child: TabBar(
                          indicatorColor: Colors.redAccent,
                          tabs: [
                            Tab(icon: Icon(Icons.comment),text: '最新评论',),
                            Tab(icon: Icon(Icons.local_fire_department),text: '热门文章',),
                            Tab(icon: Icon(Icons.access_time),text:'最近文章'),
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      child: TabBarView(
                        children: [
                          Icon(Icons.directions_car),
                          Icon(Icons.directions_transit),
                          Icon(Icons.directions_bike),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            TitleListCard(
              title: '标签',
              list: ['abc', 'def'],
            )
          ]..addAll(List.generate(100, (index) => Text('fladksjl')))),
    );
  }
}
