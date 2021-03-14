import 'package:blog_project/util/debug.dart';
import 'package:blog_project/widgets/only/l_item.dart';
import 'package:blog_project/widgets/reusable/over_lap_inkwell.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../consts.dart';

class LList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        ClipOval(
          child: SizedBox(
              height: 150,
              child:
                  Image.network('http://kuroweb.cf/picture/1615726693603.jpg')),
        ),
        OverlapInkwell(
          child: ConstrainedBox(
            constraints: BoxConstraints(
              minHeight: 100.0,
              // maxHeight: 30.0,
            ),
            child: Align(
              alignment: Alignment.topLeft,
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Text('公告:小游戏已上线 2021.3.14',
                    style: TextStyle(
                        fontWeight: FontWeight.w900, color: Colors.white)),
              ),
            ),
          ),
        ),
        Align(
          alignment: Alignment.centerLeft,
          child: Text('导航',
              style: TextStyle(
                  fontSize: Const.lTitleSize, color: Const.lTitleColor)),
        ),
        LItem(iconData: Icons.home_outlined,text: '首页',onTap: (){
          Debug.log(11,'ontap');
        },),
        LItem(iconData: Icons.code_sharp,text: 'github',onTap: (){
          Debug.log(11,'ontap');
        },),
        LItem(iconData: Icons.alternate_email,text: 'QQ',onTap: (){
          Debug.log(11,'ontap');
        },),

        OverlapInkwell(
          color: Color(0xff3A3F51),
          child: SizedBox(
            height: Const.lItemSize,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.local_fire_department_sharp,
                  color: Colors.red,
                ),
                Stack(
                  children: [
                    SizedBox(
                      width: 80,
                      height: 100,
                      child: Center(
                          child: Text(
                        '游戏',
                        style: TextStyle(color: Colors.red),
                      )),
                    ),
                    SizedBox(
                      width: 80,
                      height: 100,
                      child: Align(
                        alignment: Alignment.topRight,
                        child: Text(
                          'hot',
                          style: TextStyle(color: Colors.red),
                        ),
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
