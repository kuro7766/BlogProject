import 'dart:math';

import 'package:blog_project/config.dart';
import 'package:blog_project/entity/article_content_entity.dart';
import 'package:blog_project/entity/article_id_entity.dart';
import 'package:blog_project/entity/article_item_entity.dart';
import 'package:blog_project/routes/article/comment.dart';
import 'package:blog_project/routes/login_unused/frind_link_page.dart';
import 'package:blog_project/routes/main_page/home_list.dart';
import 'package:blog_project/routes/main_page/search_page.dart';
import 'package:blog_project/routes/main_page/tag_list.dart';
import 'package:blog_project/routes/main_page/web_markdown_nested.dart';
import 'package:blog_project/routes/markdown_viewer/view.dart';
import 'package:blog_project/routes/writting_test/view.dart';
import 'package:blog_project/tests.dart';
import 'package:blog_project/util/debug.dart';
import 'package:blog_project/unused/configuration.dart';
import 'package:blog_project/unused/django_function.dart';
import 'package:blog_project/util/getx_debug_tool.dart';
import 'package:blog_project/widgets/only/app_bar.dart';
import 'package:blog_project/widgets/only/image_item.dart';
import 'package:blog_project/widgets/only/markdown_web.dart';
import 'package:blog_project/widgets/only/page_index_button.dart';
import 'package:blog_project/widgets/reusable/http_builder.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'logic.dart';
import 'state_global.dart';

class MainContentPage extends StatelessWidget {
  final GlobalLogic logic = Get.put(GlobalLogic());
  final MainContentState state = Get.find<GlobalLogic>().state;

  @override
  Widget build(BuildContext context) {
    // DynamicConfig.blogContentWidth=MediaQuery.of(context).size.width*(5/7);
    DynamicConfig.blogContentWidth=MediaQuery.of(context).size.width*(1);

    Dbg.log('DynamicConfig.blogContentWidth initialized ... ','important');
    // Dbg.log(,'kl');
    return Obx(() {https://github.com/pytorch/text/pull/624
      state.observeMain;
      // log2(0, 'outer2build');
      // log2(0, '${state.observeMain[0]}${state.observeMain[1]}');
      switch (WritingTestComponent.previewMarkdown?6:state.viewType.value) {
      // switch (6) {
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
          return UnifiedViewerComponent();
        case 6:
          return WritingTestComponent();
          // break;
      }
      return Container(
        child: Text('请添加${state.viewType.value}类型'),
      );
    });
  }
}
