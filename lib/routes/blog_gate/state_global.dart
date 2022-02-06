import 'package:blog_project/widgets/iframe_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:blog_project/widgets/ShouldRebuild.dart';

import '../../consts.dart';

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

  RxString articleId;

  //tagList浏览页码
  RxInt tagCurrentPage;

  RxString search;


  MainContentState() {
    init();
  }

  void init() {
    viewType = 0.obs;
    currentPage = 0.obs;
    articleId = ''.obs;
    tagCurrentPage = 0.obs;
    search = ''.obs;
  }

  get observeMain => [viewType.value, currentPage.value];

  get observeSearch => [search.value];
}
