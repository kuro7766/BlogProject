import 'package:blog_project/entity/artile_title_item_entity.dart';
import 'package:blog_project/routes/main_page/main_base_widget.dart';
import 'package:blog_project/util/debug.dart';
import 'package:blog_project/vars/configuration.dart';
import 'package:blog_project/vars/django_function.dart';
import 'package:blog_project/widgets/only/data_titile_item.dart';
import 'package:blog_project/widgets/reusable/http_builder.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SearchList extends MainContentBaseStatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (state.search.value?.isEmpty ?? false) {
        return Text('请输入想要搜索的内容');
      }
      return HttpBuilder<List<ArtileTitleItemEntity>>(
        url: DjangoUrl.selectArticleByText(state.search(), Config.user),
        builder2: (j) {
          return Column(
            children: List.generate(
                j.length,
                (index) => DateTitleItem(
                      date: Text('${j[index].time13}'),
                      title: Text('${j[index].articleTitle}'),
                    )),
          );
        },
      );
    });
  }
}
