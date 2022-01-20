import 'dart:async';
import 'dart:ui';

import 'package:blog_project/entity/token_entity.dart';
import 'package:blog_project/util/http_request.dart';
import 'package:blog_project/consts.dart';
import 'package:blog_project/vars/django_function.dart';
import 'package:blog_project/widgets/only/base_scaffold.dart';
import 'package:blog_project/widgets/reusable/over_lap_inkwell.dart';
import 'package:blog_project/widgets/reusable/white_border.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class _LoginPageState extends State<LoginPage> with SingleTickerProviderStateMixin {
  AnimationController controller;
  Animation<RelativeRect> animation;
  TextEditingController uc = new TextEditingController();
  TextEditingController pc = new TextEditingController();

  get validU => uc.text.isNotEmpty;

  get validP => pc.text.isNotEmpty;

  var checkErr = false;

  @override
  void initState() {
    super.initState();
    controller = new AnimationController(
        vsync: this, duration: Duration(milliseconds: 1500));
    controller.value = 0;

    animation = RelativeRectTween(
            begin: RelativeRect.fromLTRB(0, 0, 0, -200),
            end: RelativeRect.fromLTRB(0, 0, 0, 0))
        .animate(controller);
    // Tween(begin: 1.0, end: 0.0).animate(controller);
    // CurveTween(curve: Curves.fastOutSlowIn).animate(controller);
    controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
        child: Stack(
      children: [
        Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(colors: [Colors.red, Colors.blue]),
          ),
        ),
        OverlapInkwell(
            color: Colors.red,
            child: IconButton(
                icon: Icon(Icons.arrow_back),
                onPressed: () {
                  Get.offNamed('/entrance?user=a');
                  // Get.close(0);
                })),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: Stack(
                children: [
                  PositionedTransition(
                    rect: animation,
                    child: FadeTransition(
                      opacity: controller,
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.network(Const.loginImgUrl),
                            Text('博客登录系统')
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              flex: 1,
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.only(right: 100, left: 100),
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Theme(
                        data: new ThemeData(
                          primaryColor: Const.searchBarColor,
                          primaryColorDark: Const.searchBarColor,
                        ),
                        child: new TextField(
                          controller: uc,
                          decoration: new InputDecoration(
                            errorText:
                                checkErr ? (validU ? null : '该字段不能为空') : null,
                            labelText: '用户名',
                            border: new OutlineInputBorder(
                              borderSide:
                                  new BorderSide(color: Const.searchBarColor),
                              borderRadius: const BorderRadius.all(
                                const Radius.circular(30.0),
                              ),
                            ),
                            enabledBorder: new OutlineInputBorder(
                              borderSide:
                                  new BorderSide(color: Const.searchBarColor),
                              borderRadius: const BorderRadius.all(
                                const Radius.circular(30.0),
                              ),
                            ),
                            // filled: true,
                            // hintStyle: new TextStyle(color: Colors.grey[800]),
                            // hintText: "用户名",
                          ),
                        ),
                      ),
                      SizedBox(
                        height: Const.loginDividerHeight,
                      ),
                      Theme(
                        data: new ThemeData(
                          primaryColor: Const.searchBarColor,
                          primaryColorDark: Const.searchBarColor,
                        ),
                        child: new TextField(
                          controller: pc,
                          decoration: new InputDecoration(
                            labelText: '密码',
                            errorText:
                                checkErr ? (validP ? null : '该字段不能为空') : null,
                            border: new OutlineInputBorder(
                              borderSide:
                                  new BorderSide(color: Const.searchBarColor),
                              borderRadius: const BorderRadius.all(
                                const Radius.circular(30.0),
                              ),
                            ),
                            enabledBorder: new OutlineInputBorder(
                              borderSide:
                                  new BorderSide(color: Const.searchBarColor),
                              borderRadius: const BorderRadius.all(
                                const Radius.circular(30.0),
                              ),
                            ),
                            // filled: true,
                            // hintStyle: new TextStyle(color: Colors.grey[800]),
                            // hintText: "密码",
                          ),
                        ),
                      ),
                      SizedBox(
                        height: Const.loginDividerHeight,
                      ),
                      WhiteBorder(
                          child: MaterialButton(
                              onPressed: () {
                                checkErr = true;
                                setState(() {});
                                if (validU && validP) {
                                  simpleHttpRequest<TokenEntity>(
                                      DjangoUrl.loginToGetToken(
                                          uc.text, pc.text), callback: (j) {

                                    if (j.token.isNotEmpty) {
                                      GetStorage().write('token', j.token);
                                      Get.dialog(Center(
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            MaterialButton(
                                              onPressed: () {},
                                              child: Text('提示:登录成功',
                                                  style: TextStyle(
                                                      color: Const
                                                          .searchBarColor)),
                                            ),
                                            WhiteBorder(
                                              child: MaterialButton(
                                                onPressed: () {
                                                  Timer(
                                                      Duration(
                                                          milliseconds: 300),
                                                      () {
                                                    Get.offNamed('/manage');
                                                  });
                                                },
                                                child: Text(
                                                  '登录成功，点击进入',
                                                  style: TextStyle(
                                                      color:
                                                          Const.searchBarColor),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ));
                                    }
                                  });
                                }
                              },
                              child: Text('登录'))),
                      Text('未注册账号的用户将自动注册')
                    ],
                  ),
                ),
              ),
              flex: 1,
            )
          ],
        ),
      ],
    ));
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();

  }
}

class LoginPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _LoginPageState();
  }
}
