import 'package:blog_project/entity/article_content_entity.dart';
import 'package:blog_project/routes/article/comment.dart';
import 'package:blog_project/util/debug.dart';
import 'package:blog_project/unused/django_function.dart';
import 'package:blog_project/widgets/only/app_bar.dart';
import 'package:blog_project/widgets/only/markdown_web.dart';
import 'package:blog_project/widgets/reusable/http_builder.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../blog_gate/logic.dart';
import '../blog_gate/state_global.dart';

class WebMarkdownNested extends StatelessWidget {
  final GlobalLogic logic = Get.put(GlobalLogic());
  final MainContentState state = Get.find<GlobalLogic>().state;

  @override
  Widget build(BuildContext context) {
    log2(4, 'outerbuild');
    return HttpBuilder<ArticleContentEntity>(
      url: DjangoUrl.getArticleContent(state.articleId.value),
      builder: (c, j) {
        return Column(
          children: [
            SimpleAppBar(
              j.articleTitle,
              textColor: Colors.black,
              onTap: () {
                logic.toArticleList();
              },
            ),
            MarkDownWeb(j.articleContent),
            CommentArea()
          ],
        );
      },
    );
  }
}
