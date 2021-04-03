// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:blog_project/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';

void main() {
  testWidgets('MainPageTest', (WidgetTester tester) async {
    await tester.runAsync(() async {
      await tester.pumpWidget(getApp());

      // Get.offNamed('/');
      await Future.delayed(const Duration(seconds: 1), () => '');
      print(Get.currentRoute);
      expect(find.text('0'), findsOneWidget);
      // await tester.pumpAndSettle();
      //
      // expect(find.byType(FirstScreen), findsOneWidget);

      // Build our app and trigger a frame.
      // print('start');
      // await tester.pumpWidget(MyApp());
      // var i=0;
      // // for(int i=0;i<60;i++){
      // //   await Future.delayed(const Duration(seconds: 1),
      // //           () => '');
      // //   print('delay $i');
      // // }
      // // print('delay end');
      // print(Get.parameters);
      // print(Get.currentRoute);
      // // expect(find.text('0'), findsOneWidget);
      // debugDumpApp();
    });

    // expect(find.text('您要找的资源不存在'), findsOneWidget);
    // Verify that our counter starts at 0.
    // expect(find.text('0'), findsOneWidget);
    // expect(find.text('1'), findsNothing);
    //
    // // Tap the '+' icon and trigger a frame.
    // await tester.tap(find.byIcon(Icons.add));
    // await tester.pump();
    //
    // // Verify that our counter has incremented.
    // expect(find.text('0'), findsNothing);
    // expect(find.text('1'), findsOneWidget);
  });
}
