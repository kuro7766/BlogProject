import 'package:blog_project/widgets/only/basic_container.dart';
import 'package:flutter/material.dart';

import '../../vars/consts.dart';

class TitleListCard extends StatelessWidget {
  final String title;
  final List<String> list;

  TitleListCard({this.title, this.list});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        BasicContainer(
          child: Column(
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  title,
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                      fontSize: Const.normalTextSize),
                ),
              )
            ]..addAll(List.generate(
                list.length,
                (index) => Text(
                      list[index],
                      style: TextStyle(fontSize: Const.normalTextSize),
                    ))),
          ),
        ),
        SizedBox(
          height: 10,
        )
      ],
    );
  }
}
