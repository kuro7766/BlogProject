import 'dart:math';

import 'package:blog_project/entity/article_id_entity.dart';
import 'package:blog_project/entity/article_item_entity.dart';
import 'package:blog_project/vars/configuration.dart';
import 'package:blog_project/vars/django_function.dart';
import 'package:blog_project/widgets/only/image_item.dart';
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
      return HttpBuilder<List<ArticleIdEntity>>(
        // url: DjangoUrl.selectArticleIdByUserName(Config.user),
        url: DjangoUrl.selectArticleIdByUserName(state.showing.value),
        builder: (c, j) {
          var pageSplit = 3;
          int pageCount =
              (j.length ~/ pageSplit) + (j.length % pageSplit == 0 ? 0 : 1);
          int rowIndexCount = (min<int>(Config.currentPage + 3, pageCount)) -
              (max<int>(Config.currentPage - 3, 1)) +
              1 +
              2;
          if (rowIndexCount == 2) rowIndexCount = 0;

          return Column(
            children: [
              ListView.builder(
                  shrinkWrap: true,
                  itemCount: j.length,
                  itemBuilder: (c, i) {
                    // return FloatBoxWidget(child: ImgItem());
                    return HttpBuilder<ArticleItemEntity>(
                      url: DjangoUrl.selectArticleIdPictureDescription(
                          j[i].articleId),
                      builder: (c1, j1) {
                        return ImgItem(
                          imageUrl: j1.pictureUrl,
                          text: j1.articleDescription,
                        );
                      },
                    );
                  }),
            ]..add(rowIndexCount == 3
                ? Container()
                : Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(rowIndexCount, (index) {
                      // return PageIndexWidget(
                      //     child: Icon(Icons.arrow_forward_ios_outlined))
                      // PageIndexWidget(child: Icon(Icons.arrow_forward_ios_outlined))
                      if (index == rowIndexCount - 1) {
                        return PageIndexWidget(
                            child: Icon(Icons.arrow_forward_ios_outlined));
                      } else if (index == 0) {
                        return PageIndexWidget(
                            child: Icon(Icons.arrow_back_ios_outlined));
                      }
                      return PageIndexButton(
                        index,
                        highlight: index == Config.currentPage,
                        onTap: () {},
                      );
                    }),
                  )),
          );
        },
      );
    });
  }
}
