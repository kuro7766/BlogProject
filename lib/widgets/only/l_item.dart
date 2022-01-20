import 'package:blog_project/widgets/reusable/over_lap_inkwell.dart';
import 'package:flutter/material.dart';

import '../../consts.dart';

class LItem extends StatelessWidget {
  final IconData iconData;
  final String text;
final GestureTapCallback onTap;
  LItem({this.iconData, this.text, this.onTap});

  @override
  Widget build(BuildContext context) {
    return OverlapInkwell(
      onTap: this.onTap,
      color: Color(0xff3A3F51),
      child: SizedBox(
        height: Const.lItemSize,
        child: Padding(
          padding: EdgeInsets.only(right: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(this.iconData,color: Colors.white,),
              SizedBox(width: 10,),
              Text(this.text,style: TextStyle(
                color: Colors.white
              ),),
            ],
          ),
        ),
      ),
    );
  }
}
