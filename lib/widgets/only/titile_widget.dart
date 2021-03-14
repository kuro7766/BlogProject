import 'package:flutter/material.dart';

import '../../consts.dart';

class TitleCard extends StatelessWidget {
  final String title;
  final Widget child;

  TitleCard({this.title, this.child});

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
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: Const.normalTextSize),
                ),
              ),
              child
            ],
          ),
        ),
        SizedBox(
          height: 10,
        )
      ],
    );
  }
}
