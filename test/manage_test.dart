// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:blog_project/entity/user_state_info.dart';
import 'package:blog_project/init_web_markdown.dart';
import 'package:blog_project/main.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';

void main() {
  testWidgets('test manage page', (WidgetTester tester) async {
    await tester.runAsync(() async {
      Get.testMode = true;
      init();
      Get.put(UserStateInfo()..url, permanent: true);
      await tester.pumpWidget(getApp());
      Get.toNamed('/manage');
      print(Get.currentRoute);
      await tester.pumpAndSettle();
      print(Get.currentRoute);
      //检查用户token，应重定向到login
      expect(find.text('博客登录系统'), findsOneWidget);
    });

  });
}
