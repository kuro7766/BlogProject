import 'package:blog_project/widgets/only/basic_container.dart';
import 'package:blog_project/widgets/reusable/float_box_widget.dart';
import 'package:flutter/material.dart';
import 'package:highlight/languages/tex.dart';

import '../../consts.dart';

class ImgItem extends StatelessWidget {
  final String imageUrl;
  final String text;

  ImgItem({this.imageUrl, this.text});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        BasicContainer(
          child: Column(children: [
            FloatBoxWidget(child: Image.network(imageUrl,)),
            SizedBox(height: 30,),
            SizedBox(height: 1,child: Padding(padding: EdgeInsets.only(left: 30,right: 30),child: Container(color: Colors.grey,)),),
            SizedBox(height: 30,),
            Text(text,style: TextStyle(fontWeight: FontWeight.bold),),
          ],),
        ),
        SizedBox(height: Const.rListDefaultGap,)
      ],
    );
  }
}
