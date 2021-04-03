import 'package:blog_project/entity/user_state_info.dart';
import 'package:blog_project/init_web_markdown.dart';
import 'package:blog_project/routes/404.dart';
import 'package:blog_project/routes/login/login_page.dart';
import 'package:blog_project/routes/login/user_manage.dart';
import 'package:blog_project/routes/welcome/part/welcome/entrance_page.dart';
import 'package:blog_project/widgets/only/proxy_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

void main() {
  init();
  Get.put(UserStateInfo()..url, permanent: true);
  runApp(getApp());
}

StatelessWidget getApp() {
  return GetMaterialApp(
    title: 'My Blog',
    initialRoute: '/entrance',
    getPages: [
      GetPage(
          name: '/login',
          page: () {
            return GetStorage().hasData('token')
                ? ProxyPage('/manage')
                : LoginPage();
          }),
      GetPage(name: '/manage', page: () => UserManage('')),
      GetPage(
        name: '/users',
        page: () => UserManage(Get.parameters.toString()),
      ),
      GetPage(name: '/404', page: () => Route404()),
      // this is default page
      GetPage(name: '/', page: () => ProxyPage('/entrance?user=a')),
      // GetPage(name: '/', page: () => Route404()),
      GetPage(name: '/entrance', page: () => MainPage())
    ],
    debugShowCheckedModeBanner: false,
    // showPerformanceOverlay: true,
    theme: ThemeData(
      primarySwatch: Colors.blue,
    ),
    // home:MyHomePage()
    // home: Md2(),
    // home: MainPage(),
  );
}
