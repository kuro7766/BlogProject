import 'dart:js';

import 'package:blog_project/entity/show_banner_event.dart';
import 'package:blog_project/util/debug.dart';
import 'package:event_bus/event_bus.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'state.dart';

class MainContentLogic extends GetxController {
  final state = MainContentState();
  EventBus _eventBus;

  MainContentLogic() {
    _eventBus = Get.find();
  }

  void _loseTextFieldFocus() {
    FocusScope.of(Get.context).requestFocus(new FocusNode());
  }

  void _showBanner() {
    _eventBus.fire(ShowBannerEvent());
  }

  void changeSearchBarFocus(bool focus) {
    if (focus) {
      toSearch();
    }
  }

  void toFriendList() {
    Future.microtask(() {
      _loseTextFieldFocus();
      state.viewType(3);
    });
  }

  void toSearch() {
    state.viewType(4);
  }

  void toArticle(String articleId) {
    // state.viewType.value = 1;
    // state.articleId.value = articleId;
    state.viewType(5);
    state.articleAssetResource(articleId);
    _showBanner();
  }

  void toArticleList({home = false}) {
    Future.microtask(() {
      state.viewType.value = 0;
      if (home) state.currentPage.value = 1;
      _showBanner();
      _loseTextFieldFocus();
    });
  }

  toTagList({home = false}) {
    state.viewType.value = 2;
    if (home) state.tagCurrentPage.value = 1;
    _showBanner();
  }

  void switchPage(int offset) {
    var target = state.currentPage.value + offset;
    if (target < 1) {
      target = 1;
    }
    log(95, '${target},${state.currentPage.value}');
    if (target != state.currentPage.value) {
      _showBanner();
    }
    state.currentPage.value = (target);
  }

  void toPage(int page) {
    state.currentPage.value = page;
    _showBanner();
  }

  set _viewType(int view) {
    state.viewType.value = view;
  }
}
