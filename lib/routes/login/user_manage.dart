import 'package:blog_project/routes/login/article_related/article_manage_page.dart';
import 'package:blog_project/routes/login/friend_link_related/frind_link_page.dart';
import 'package:blog_project/routes/login/personal_info/personal_info_submit.dart';
import 'package:blog_project/util/debug.dart';
import 'package:blog_project/widgets/only/app_bar.dart';
import 'package:blog_project/widgets/only/base_scaffold.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import 'article_related/realese_page.dart';

class UserManage extends StatefulWidget {
  final String info;

  UserManage(this.info);

  @override
  _UserManageState createState() => _UserManageState();
}

class _UserManageState extends State<UserManage> {
  int currentSelection = 0;
  var menu = ['个人信息', '发布文章', '文章管理', '友链申请', '退出登录'];

  Widget buildPage() {
    if (currentSelection == 0) {
      return PersonalInfoSubmit();
    } else if (currentSelection == 1) {
      return ReleaseArticle();
    } else if (currentSelection == 2) {
      return ArticleManagePage();
    } else if (currentSelection == 3) {}
    return FriendLinkPage();
  }

  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
        appBar: SimpleAppBar(
          '博客管理',
          color: Color(0xfff4f0e6),
          textColor: Colors.black,
        ),
        child: Container(
          color: Color(0xffceefe4),
          child: Row(
            children: [
              Expanded(
                flex: 2,
                child: ListView(
                  children: List.generate(
                    menu.length,
                    (index) => MaterialButton(
                      padding: EdgeInsets.all(0),
                      onPressed: () {
                        currentSelection = index;
                        log(32, currentSelection);
                        setState(() {});
                        if (currentSelection == 4) {
                          GetStorage().remove('token');
                          Get.offNamed('/login');
                        }
                      },
                      child: SizedBox(
                        height: 70,
                        width: 1000,
                        child: Container(
                          color: index == currentSelection
                              ? Color(0xffd9d9f3)
                              : Colors.transparent,
                          child: Center(child: Text(menu[index])),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: buildPage(),
                flex: 10,
              )
            ],
          ),
        ));
  }
}
