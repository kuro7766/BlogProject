import 'package:blog_project/routes/welcome/right_list_view.dart';
import 'package:blog_project/widgets/only/inner_layer.dart';
import 'package:blog_project/widgets/only/title_list_card.dart';
import 'package:flutter/cupertino.dart';

class RightList extends State<InnerLayerContainer>{
  @override
  Widget build(BuildContext context) {
    return InnerLayer(left: ListView.builder(shrinkWrap: true,itemCount: 10,itemBuilder: (c,i){
      return Text('$i');
    }),right: ListView.builder(shrinkWrap: true,itemCount: 10,itemBuilder: (c,i){
      return TitleListCard(title: '我是标题',list: [
        'abc',
        'def'
      ],);
    }),);
  }

}