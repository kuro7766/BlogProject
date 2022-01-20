import 'package:blog_project/entity/user_state_info.dart';
import 'package:blog_project/init_web_markdown.dart';
import 'package:blog_project/routes/404.dart';
import 'package:blog_project/routes/blog_list_main_content/logic.dart';
import 'package:blog_project/routes/login/login_page.dart';
import 'package:blog_project/routes/login/user_manage.dart';
import 'package:blog_project/routes/welcome/entrance_page_initializer.dart';
import 'package:blog_project/vars/consts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
void main() {
  init();
  runApp(getApp());

  // (() async{
  //   var x= await http.get(Uri.parse(Const.weather));
  //   print(x.body);
  // })();
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

Widget getApp() {
  return WillPopScope(
    onWillPop: () async {
      // if (Get.isCurrent<LoginPage>()) {
      //   return false;
      // }
      if(Get.find<MainContentLogic>().state.viewType.value==0){
        return true;
      }
      Get.find<MainContentLogic>().toArticleList(home: true);
      return false;
    },
    child: GetMaterialApp(
      title: 'kuroの小站',
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
      debugShowCheckedModeBanner: false,
      navigatorObservers: [FlutterSmartDialog.observer],
      builder: (BuildContext context, Widget child) {
        return FlutterSmartDialog(child: child);
      },
      // builder: FlutterSmartDialog.init(),
      // showPerformanceOverlay: true,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        // textTheme: TextTheme(bodyText1: TextStyle(backgroundColor: Colors.red)),
        // fontFamily: 'MyFont',
      ),
      // home:MyHomePage()
      // home: Md2(),
      // home: MainPage(),
    ),
  );
}
