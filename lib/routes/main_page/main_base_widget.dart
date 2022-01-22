import 'package:blog_project/routes/blog_gate/logic.dart';
import 'package:blog_project/routes/blog_gate/state_global.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class MainContentBaseStatelessWidget extends StatelessWidget {
  final GlobalLogic logic = Get.put(GlobalLogic());
  final MainContentState state = Get.find<GlobalLogic>().state;
}