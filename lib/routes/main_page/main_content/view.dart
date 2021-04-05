import 'dart:math';

import 'package:blog_project/entity/article_content_entity.dart';
import 'package:blog_project/entity/article_id_entity.dart';
import 'package:blog_project/entity/article_item_entity.dart';
import 'package:blog_project/routes/article/comment.dart';
import 'package:blog_project/routes/main_page/tag_list.dart';
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
  final MainContentLogic logic = Get.put(MainContentLogic());
  final MainContentState state = Get.find<MainContentLogic>().state;

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      state.observeMain;
      log2(0, 'rebuild');
      switch (state.viewType.value) {
        case 0:
          return HttpBuilder<List<ArticleIdEntity>>(
            url: DjangoUrl.selectArticleIdByUserName(Config.user),
            builder: (c, j) {
              //多少元素分页
              var pageSplit = 3;
              // 实际页码个数
              int pageCount =
                  (j.length ~/ pageSplit) + (j.length % pageSplit == 0 ? 0 : 1);
              //下方角标的数量包括《 和 》
              int rowIndexCount =
                  (min<int>(state.currentPage.value + 3, pageCount)) -
                      (max<int>(state.currentPage.value - 3, 1)) +
                      1 +
                      2;
              if (rowIndexCount == 2) rowIndexCount = 0;
              log(93, j.length - pageCount * (state.currentPage.value - 1));
              return Column(
                children: [
                  ListView.builder(
                      shrinkWrap: true,
                      itemCount: (() {
                        var thought = j.length -
                            pageSplit * (state.currentPage.value - 1);
                        thought = thought > pageSplit ? pageSplit : thought;
                        if (thought < 0) {
                          thought = 0;
                          logic.toArticleList(home: true);
                        }
                        return thought;
                      })(),
                      itemBuilder: (c, i) {
                        // return FloatBoxWidget(child: ImgItem());
                        return HttpBuilder<ArticleItemEntity>(
                          url: DjangoUrl.selectArticleIdPictureDescription(
                              j[i + pageCount * (state.currentPage.value - 1)]
                                  .articleId),
                          builder: (c1, j1) {
                            return GestureDetector(
                              onTap: () {
                                logic.toArticle(j[i +
                                        pageCount *
                                            (state.currentPage.value - 1)]
                                    .articleId);
                              },
                              child: ImgItem(
                                imageUrl: j1.pictureUrl,
                                text: j1.articleDescription,
                              ),
                            );
                          },
                        );
                      }),
                ]..add(rowIndexCount == 3
                    //
                    ? Container()
                    : Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: List.generate(rowIndexCount, (index) {
                          if (index == rowIndexCount - 1) {
                            return PageIndexWidget(
                                onTap: () => logic.switchPage(1),
                                child: Icon(Icons.arrow_forward_ios_outlined));
                          } else if (index == 0) {
                            return PageIndexWidget(
                                onTap: () => logic.switchPage(-1),
                                child: Icon(Icons.arrow_back_ios_outlined));
                          }
                          return PageIndexButton(
                            index,
                            highlight: index == state.currentPage.value,
                            onTap: () {
                              log(99, '$index');
                              logic.toPage(index);
                            },
                          );
                        }),
                      )),
              );
            },
          );
        case 1:
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
        // child: MarkDownWeb(Tests.s2));
        // break;
        case 2:
          return TagList();
        case 3:
          break;
        case 4:
          break;
        case 5:
          break;
      }
      return Container(
        child: Text('请添加${state.viewType.value}类型'),
      );
    });
  }
}
