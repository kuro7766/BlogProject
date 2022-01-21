import 'package:blog_project/entity/user_state_info.dart';
import 'package:blog_project/init_web_markdown.dart';
import 'package:blog_project/routes/404.dart';
import 'package:blog_project/routes/blog_list_main_content/logic.dart';
import 'package:blog_project/routes/login/login_page.dart';
import 'package:blog_project/routes/login/user_manage.dart';
import 'package:blog_project/routes/welcome/entrance_page_initializer.dart';
import 'package:blog_project/consts.dart';
import 'package:blog_project/util/getx_debug_tool.dart';
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

class MiddleWare extends GetMiddleware {
  @override
  RouteSettings redirect(String route) {
    Dbg.log(route, 'CheckLoginMiddleWare');
    if(route=='/'){
      return RouteSettings(name: '/entrance');
    }
    if(route=='/entrance'){
      return null;
    }
    if(route.startsWith('/entrance')){
      return RouteSettings(name: '/entrance',arguments: Get.parameters);
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
      Get.snackbar('back', 'message ${Get.find<MainContentLogic>().state.viewType.value}');
      if(Get.find<MainContentLogic>().state.viewType.value==0){
        return true;
      }
      Get.find<MainContentLogic>().toArticleList(home: true);
      return false;
    },
    child: GetMaterialApp(
      title: 'kuroの小站',
      initialRoute: '/entrance',
      // onGenerateRoute: ,
      getPages: [
        GetPage(
            name: '/login',
            page: () {
              return LoginPage();
            },
            middlewares: [MiddleWare()]),
        GetPage(
            name: '/manage',
            page: () {
              return UserManage('');
            },
            middlewares: [MiddleWare()]),

        GetPage(name: '/404', page: () => Route404(),middlewares:[MiddleWare()]),
        // this is default page
        GetPage(
            name: '/',
            page: () => Route404(),
            middlewares: [MiddleWare()]),
        // GetPage(name: '/', page: () => Route404()),
        GetPage(name: '/entrance', page: () => EntrancePage(),middlewares: [MiddleWare()]),
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
