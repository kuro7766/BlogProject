import 'dart:math';

import 'package:blog_project/entity/article_content_entity.dart';
import 'package:blog_project/entity/article_id_entity.dart';
import 'package:blog_project/entity/article_item_entity.dart';
import 'package:blog_project/routes/article/comment.dart';
import 'package:blog_project/routes/login/friend_link_related/frind_link_page.dart';
import 'package:blog_project/routes/main_page/home_list.dart';
import 'package:blog_project/routes/main_page/search_page.dart';
import 'package:blog_project/routes/main_page/tag_list.dart';
import 'package:blog_project/routes/main_page/web_markdown_nested.dart';
import 'package:blog_project/tests.dart';
import 'package:blog_project/util/debug.dart';
import 'package:blog_project/vars/configuration.dart';
import 'package:blog_project/vars/django_function.dart';
import 'package:blog_project/widgets/only/app_bar.dart';
import 'package:blog_project/widgets/only/image_item.dart';
import 'package:blog_project/widgets/only/markdown_web.dart';
import 'package:blog_project/widgets/only/page_index_button.dart';
import 'package:blog_project/widgets/reusable/http_builder.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'logic.dart';
import 'state.dart';

class MainContentPage extends StatelessWidget {
  final MainContentLogic logic = Get.put(new MainContentLogic());
  final MainContentState state = Get.find<MainContentLogic>().state;

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      state.observeMain;
      log2(0, 'rebuild');
      switch (state.viewType.value) {
        case 0:
          return HomeList();
        case 1:
          return WebMarkdownNested();
        case 2:
          return TagList();
        case 3:
          return FriendLinkPage();
        case 4:
          return SearchList();
        case 5:
          break;
      }
      return Container(
        child: Text('请添加${state.viewType.value}类型'),
      );
    });
  }
}
