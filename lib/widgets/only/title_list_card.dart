import 'package:flutter/material.dart';

import '../../consts.dart';

class TitleListCard extends StatelessWidget {
  final String title;
  final List<String> list;

  TitleListCard({this.title, this.list});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.all(10.0),
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(20.0)),
          child: Column(
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  title,
                  style: TextStyle(fontWeight: FontWeight.bold,fontSize: Const.normalTextSize),
                ),
              )
            ]..addAll(List.generate(list.length, (index) => Text(list[index],style: TextStyle(fontSize: Const.normalTextSize),))),
          ),
        ),
        SizedBox(
          height: 10,
        )
      ],
    );
  }
}
