import 'package:get/get.dart';

class MainContentState {
  /// | 序号 | 内容 |
  /// | --- | --- |
  /// 0|列表
  /// 1|markdown(禁用)
  /// 2|tagList
  /// 3|友链
  /// 4|searchList
  /// 5|markdown(普通markdown)
  /// 6|
  /// 7|
  ///
  RxInt viewType;

  //主页浏览页码，从1开始
  RxInt currentPage;

  RxInt articleId;
  RxString articleAssetResource;

  //tagList浏览页码
  RxInt tagCurrentPage;

  RxString search;

  RxInt musicIframeUrlIndex;

  MainContentState() {
    init();
  }

  void init(){
    viewType = 0.obs;
    currentPage = 1.obs;
    articleId = 0.obs;
    tagCurrentPage = 1.obs;
    search = ''.obs;
    articleAssetResource=''.obs;
    musicIframeUrlIndex = 0.obs;
  }

  get observeMain => [viewType.value, currentPage.value];

  get observeSearch => [search.value];
}
