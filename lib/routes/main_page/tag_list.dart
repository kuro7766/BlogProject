import 'package:blog_project/entity/artile_title_item_entity.dart';
import 'package:blog_project/routes/main_page/main_content/logic.dart';
import 'package:blog_project/util/debug.dart';
import 'package:blog_project/vars/configuration.dart';
import 'package:blog_project/vars/django_function.dart';
import 'package:blog_project/widgets/reusable/clickable.dart';
import 'package:blog_project/widgets/reusable/http_builder.dart';
import 'package:blog_project/widgets/reusable/smooth_list_widget.dart';
import 'package:blog_project/widgets/reusable/white_border.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TagList extends StatefulWidget {
  @override
  _TagListState createState() => _TagListState();
}

class _TagListState extends State<TagList> {
  int page = 0;
  MainContentLogic logic = Get.put(MainContentLogic());

  @override
  Widget build(BuildContext context) {
    return HttpBuilder<List<ArtileTitleItemEntity>>(
      url: DjangoUrl.selectArticleInfoByUserNameAndPage(Config.user, page),
      builder: (c, j) {
        return SmoothListWidget(
            children: List.generate(
                j.length,
                (index) => Align(
                      alignment: Alignment.centerLeft,
                      child: Clickable(
                        child: Wrap(
                          children: [
                            Container(
                                color: Colors.grey,
                                child:
                                    WhiteBorder(child: Text(j[index].time13))),
                            SizedBox(
                              width: 10,
                            ),
                            Text(j[index].articleTitle)
                          ],
                        ),
                      ),
                    )));
      },
    );
  }
}
