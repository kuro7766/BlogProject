import 'package:blog_project/routes/welcome/right_list_view.dart';
import 'package:blog_project/widgets/only/inner_layer.dart';
import 'package:blog_project/widgets/only/title_list_card.dart';
import 'package:blog_project/widgets/reusable/float_box_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RightList extends State<InnerLayerContainer> {
  @override
  Widget build(BuildContext context) {
    return InnerLayer(
      left: ListView.builder(
          shrinkWrap: true,
          itemCount: 10,
          itemBuilder: (c, i) {
            return Text('$i');
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
                        constraints: BoxConstraints(maxHeight: 70.0),
                        child: Material(
                          color: Colors.indigo,
                          child: TabBar(
                            tabs: [
                              Tab(icon: Icon(Icons.comment)),
                              Tab(icon: Icon(Icons.local_fire_department)),
                              Tab(icon: Icon(Icons.access_time)),
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
                  ),),
            ),
            FloatBoxWidget(
              child: TitleListCard(
                title: '我是标题',
                list: ['abc', 'def'],
              ),
            )
          ]..addAll(List.generate(100, (index) => Text('fladksjl')))),
    );
  }
}
