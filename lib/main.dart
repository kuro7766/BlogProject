import 'package:blog_project/md_page.dart';
import 'package:blog_project/tests.dart';
import 'package:blog_project/util/debug.dart';
import 'package:flutter/material.dart';
void main() {
  Debug.configuration(minimalLevel: 4);
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      // home:MyHomePage()
      // home: Md2(),
      home: MarkdownPage(Tests.s2),
    );
  }
}
