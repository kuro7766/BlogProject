import 'package:blog_project/routes/welcome/md_page.dart';
import 'package:blog_project/tests.dart';
import 'package:blog_project/util/debug.dart';
import 'package:blog_project/util/user_config.dart';
import 'package:flutter/material.dart';
void main() {
  Debug.configuration(minimalLevel: 7);
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // UserConfig.r();
    return MaterialApp(
      title: 'My Blog',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: 'Dengxian'
      ),
      // home:MyHomePage()
      // home: Md2(),
      home: MainPage(),
    );
  }
}
