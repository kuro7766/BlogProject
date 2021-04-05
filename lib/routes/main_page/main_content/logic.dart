import 'package:blog_project/entity/show_banner_event.dart';
import 'package:blog_project/util/debug.dart';
import 'package:event_bus/event_bus.dart';
import 'package:get/get.dart';

import 'state.dart';


class MainContentLogic extends GetxController {
  final state = MainContentState();
  EventBus _eventBus;

  MainContentLogic() {
    _eventBus = Get.find();
  }

  void _showBanner() {
    _eventBus.fire(ShowBannerEvent());
  }

  void toArticle(int articleId) {
    state.viewType.value = 1;
    state.articleId.value = articleId;
    _showBanner();
  }

  void toArticleList({home = false}) {
    Future.microtask(() {
      state.viewType.value = 0;
      if (home) state.currentPage.value = 1;
      _showBanner();
    });
  }

  toTagList({home=false}){
    state.viewType.value=2;
    if(home)
    state.tagCurrentPage.value=1;
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
