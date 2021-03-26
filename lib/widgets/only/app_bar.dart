import 'package:blog_project/util/debug.dart';
import 'package:blog_project/vars/configuration.dart';
import 'package:blog_project/vars/consts.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SimpleAppBar extends AppBar {
  final String _appBarTitle;
  final Color color;
  final Color textColor;
  SimpleAppBar(this._appBarTitle,  {this.textColor=Colors.white,this.color = Colors.white})
      : super(
          backgroundColor: color,
          title: Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  _appBarTitle,
                  style: TextStyle(color: textColor),
                ),
              ],
            ),
          ),
          leading: Builder(
            builder: (BuildContext context) {
              return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      children: [
                        SizedBox(
                          width: 10,
                        ),
                        InkWell(
                          onTap: () {



                            Get.offNamed(Config.currentHomePageRoute);
                          },
                          child: Icon(
                            Icons.arrow_back,
                            size: 30,
                            color:Colors.black,
                          ),
                        )
                      ],
                    ),
                  ]);
            },
          ),
        );
}
