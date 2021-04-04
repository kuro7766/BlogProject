import 'package:blog_project/entity/user_state_info.dart';
import 'package:blog_project/init_web_markdown.dart';
import 'package:blog_project/routes/404.dart';
import 'package:blog_project/routes/login/login_page.dart';
import 'package:blog_project/routes/login/user_manage.dart';
import 'package:blog_project/routes/welcome/part/welcome/entrance_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

void main() {
  init();
  Get.put(UserStateInfo()..url, permanent: true);
  runApp(getApp());
}

class CheckLoginMiddleWare extends GetMiddleware {
  @override
  RouteSettings redirect(String route) {
    if(route=='/'){
      return RouteSettings(name: '/entrance?user=a');
    }
    if (route == '/login') {
      if (GetStorage().hasData('token')) {
        return RouteSettings(name: '/manage');
      }
    }
    if (route == '/manage') {
      if (!GetStorage().hasData('token')) {
        return RouteSettings(name: '/login');
      }
    }
    return null;
  }
}

StatelessWidget getApp() {
  return GetMaterialApp(
    title: 'My Blog',
    initialRoute: '/',
    getPages: [
      GetPage(
          name: '/login',
          page: () {
            return LoginPage();
          },
          middlewares: [CheckLoginMiddleWare()]),
      GetPage(
          name: '/manage',
          page: () {
            return UserManage('');
          },
          middlewares: [CheckLoginMiddleWare()]),

      GetPage(name: '/404', page: () => Route404()),
      // this is default page
      GetPage(
          name: '/',
          page: () => Route404(),
          middlewares: [CheckLoginMiddleWare()]),
      // GetPage(name: '/', page: () => Route404()),
      GetPage(name: '/entrance', page: () => MainPage())
    ],
    debugShowCheckedModeBanner: true,
    // showPerformanceOverlay: true,
    theme: ThemeData(
      primarySwatch: Colors.blue,
    ),
    // home:MyHomePage()
    // home: Md2(),
    // home: MainPage(),
  );
}
