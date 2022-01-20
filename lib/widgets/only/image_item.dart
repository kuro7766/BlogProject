import 'package:blog_project/widgets/only/basic_container.dart';
import 'package:blog_project/widgets/reusable/float_box_widget.dart';
import 'package:flutter/material.dart';

import '../../consts.dart';

class ArticleItemWidget extends StatelessWidget {
  final String imageUrl;
  final String text;

  ArticleItemWidget({this.imageUrl, this.text});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        BasicContainer(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                flex: 3,
                child: Row(
                  children: [
                    Expanded(
                      child: FloatBoxWidget(
                          scale: 0.2,
                          child: Image.network(
                            imageUrl ?? Const.emptyImgUrl,
                          )),
                    ),
                  ],
                ),
              ),
              // SizedBox(height: 30,),
              // SizedBox(width: 30,),
              // SizedBox(height: 1,child: Padding(padding: EdgeInsets.only(left: 30,right: 30),child: Container(color: Colors.grey,)),),
              // SizedBox(height: 30,),
              SizedBox(
                width: 30,
              ),
              Expanded(flex: 1,
                child: Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      text,
                      style: TextStyle(fontWeight: FontWeight.bold),
                    )),
              ),
            ],
          ),
        ),
        SizedBox(
          height: Const.rListDefaultGap,
        )
      ],
    );
  }
}
