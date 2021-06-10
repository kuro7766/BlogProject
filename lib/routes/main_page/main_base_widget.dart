import 'package:blog_project/routes/main_page/main_content/logic.dart';
import 'package:blog_project/routes/main_page/main_content/state.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class MainContentBaseStatelessWidget extends StatelessWidget {
  final MainContentLogic logic = Get.put(MainContentLogic());
  final MainContentState state = Get.find<MainContentLogic>().state;
}