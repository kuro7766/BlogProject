import 'dart:math';

import 'package:blog_project/entity/article_id_entity.dart';
import 'package:blog_project/entity/article_item_entity.dart';
import 'package:blog_project/routes/main_page/main_base_widget.dart';
import 'package:blog_project/vars/configuration.dart';
import 'package:blog_project/vars/django_function.dart';
import 'package:blog_project/widgets/only/image_item.dart';
import 'package:blog_project/widgets/only/page_index_button.dart';
import 'package:blog_project/widgets/reusable/http_builder.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'main_content/logic.dart';
import 'main_content/state.dart';

class HomeList extends MainContentBaseStatelessWidget {
  @override
  Widget build(BuildContext context) {
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
                  logic.toPage(index);
                },
              );
            }),
          )),
        );
      },
    );
  }
}
