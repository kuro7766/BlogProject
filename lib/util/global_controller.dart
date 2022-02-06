import 'package:blog_project/routes/blog_gate/logic.dart';
import 'package:get/get.dart';

class GlobalController {
//  singleton
  static GlobalController _singleton;

  factory GlobalController() => instance;

  GlobalController._internal();

  static GlobalController get instance =>
      _singleton ??= GlobalController._internal();

  int get currentStartIndex =>
      Get.find<GlobalLogic>().state.currentPage.value * 10;

  set currentStartIndex(int index) {
    Get.find<GlobalLogic>().state.currentPage.value = index ~/ 10;
  }
}
