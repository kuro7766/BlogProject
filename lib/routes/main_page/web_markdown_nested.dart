import 'package:blog_project/entity/article_content_entity.dart';
import 'package:blog_project/routes/article/comment.dart';
import 'package:blog_project/vars/django_function.dart';
import 'package:blog_project/widgets/only/app_bar.dart';
import 'package:blog_project/widgets/only/markdown_web.dart';
import 'package:blog_project/widgets/reusable/http_builder.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'main_content/logic.dart';
import 'main_content/state.dart';

class WebMarkdownNested extends StatelessWidget {

  final MainContentLogic logic = Get.put(MainContentLogic());
  final MainContentState state = Get.find<MainContentLogic>().state;

  @override
  Widget build(BuildContext context) {
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
