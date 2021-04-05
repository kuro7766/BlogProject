import 'package:get/get.dart';

class MainContentState {
  /// | 序号 | 内容 |
  /// | --- | --- |
  /// 0|列表
  /// 1|markdown
  /// 2|
  /// 3|
  /// 4|
  /// 5|
  /// 6|
  /// 7|
  ///
  RxInt viewType;

  //浏览页码，从1开始
  RxInt currentPage;
  RxInt articleId;

  MainContentState() {
    viewType = 0.obs;
    currentPage = 1.obs;
    articleId=0.obs;
  }

  get observe => [viewType.value, currentPage.value];
}
