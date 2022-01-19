import 'dart:convert';
import 'dart:html';
import 'dart:math';

import 'package:blog_project/entity/article_id_entity.dart';
import 'package:blog_project/entity/article_item_entity.dart';
import 'package:blog_project/routes/main_page/main_base_widget.dart';
import 'package:blog_project/util/debug.dart';
import 'package:blog_project/util/getx_debug_tool.dart';
import 'package:blog_project/util/simple_http_builder.dart';
import 'package:blog_project/vars/configuration.dart';
import 'package:blog_project/vars/django_function.dart';
import 'package:blog_project/widgets/only/image_item.dart';
import 'package:blog_project/widgets/only/page_index_button.dart';
import 'package:blog_project/widgets/only/titile_widget.dart';
import 'package:blog_project/widgets/reusable/http_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:url_encoder/url_encoder.dart';
import 'package:url_launcher/url_launcher.dart';

import '../blog_list_main_content/logic.dart';
import '../blog_list_main_content/state.dart';
import 'package:path/path.dart' as p;

class HomeList extends MainContentBaseStatelessWidget {
  Future<ResponseContent> getAssets() async {
    // >> To get paths you need these 2 lines
    final manifestContent = await rootBundle.loadString('AssetManifest.json');

    final Map<String, dynamic> manifestMap = json.decode(manifestContent);
    // >> To get paths you need these 2 lines

    final imagePaths = manifestMap.keys.toList();
    Dbg.log(imagePaths.where((element) => element.endsWith('md')), 'kk');
    // var s=await rootBundle.loadString(imagePaths[0].replaceFirst('assets/', ''));
    // Dbg.log(s,'kkk');
    return ResponseContent.success(imagePaths
        .where((element) => element.startsWith('assets/markdown/'))
        .toList());
  }

  @override
  Widget build(BuildContext context) {
    // getAssets();
    // return Text('hi');
    return SimpleHttpBuilder(
      httpFuture: getAssets(),
      builder: (data) {
        // for (var c in data) {
        //   Dbg.log(p.basename(c));
        //   Dbg.log(Uri.decodeFull(c), 's');
        //   (() async {
        //     var s = await rootBundle.loadString(Uri.decodeFull(c));
        //     Dbg.log(s);
        //   })();
        // }
        // return Column(
        //   children: List.generate(data.length, (index) => Text('${
        //       // urlEncode(text:
        //       // p.basename(data[index]))
        //       Uri.decodeFull(p.basename(data[index]))}')),
        // );
        return Column(children: List.generate( data.length, ( index) {
          return SimpleHttpBuilder(
            httpFuture: (() async {
              var s =
              await rootBundle.loadString(Uri.decodeFull(data[index]));
              // Dbg.log(s);
              return ResponseContent.success(
                  [Uri.decodeFull(p.basename(data[index])), s]);
            })(),
            builder: (tuple) {
              var mdContent = tuple[1];
              var title = tuple[0].replaceFirst('\.md', '');
              return GestureDetector(
                onTap: (){
                  logic.toArticle(data[index]);

                },
                child: TitleCard(
                  title: '$title',
                  child: Container(
                    // color: Colors.orangeAccent,
                    child: Stack(
                      children: [
                        MarkdownBody(
                          data: '$mdContent'
                              .substring(0, min(200, '$mdContent'.length))
                              .replaceFirst(title, ''),
                          selectable: true,
                          onTapLink:
                              (String text, String href, String title) async {
                            var fail=!await launch(href);
                            if(fail){
                              Get.snackbar('Error', 'Could not open link',snackPosition: SnackPosition.BOTTOM);
                            }
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              );
              // return Markdown(
              //   shrinkWrap: true,
              //   selectable: true,
              //   data: dd,
              // );
            },
          );
        },
        ),);

        // return Text('$data');
      },
    );
    // return HttpBuilder<List<ArticleIdEntity>>(
    //   url: DjangoUrl.selectArticleIdByUserName(Config.user),
    //   builder: (c, j) {
    //     //多少元素分页
    //     var pageSplit = 3;
    //     // 实际页码个数
    //     int pageCount =
    //         (j.length ~/ pageSplit) + (j.length % pageSplit == 0 ? 0 : 1);
    //     log2(3, pageCount);
    //     //下方角标的数量包括《 和 》
    //     int rowIndexCount =
    //         (min<int>(state.currentPage.value + 3, pageCount)) -
    //             (max<int>(state.currentPage.value - 3, 1)) +
    //             1 +
    //             2;
    //     if (rowIndexCount == 2) rowIndexCount = 0;
    //     return Column(
    //       children: [
    //         ListView.builder(
    //             shrinkWrap: true,
    //             itemCount: (() {
    //               var thought = j.length -
    //                   pageSplit * (state.currentPage.value - 1);
    //               thought = thought > pageSplit ? pageSplit : thought;
    //               if (thought < 0) {
    //                 thought = 0;
    //                 logic.toArticleList(home: true);
    //               }
    //               return thought;
    //             })(),
    //             itemBuilder: (c, i) {
    //               // return FloatBoxWidget(child: ImgItem());
    //               return HttpBuilder<ArticleItemEntity>(
    //                 url: DjangoUrl.selectArticleIdPictureDescription(
    //                     j[i + pageCount * (state.currentPage.value - 1)]
    //                         .articleId),
    //                 builder: (c1, j1) {
    //                   return GestureDetector(
    //                     onTap: () {
    //                       logic.toArticle(j[i +
    //                           pageCount *
    //                               (state.currentPage.value - 1)]
    //                           .articleId);
    //                     },
    //                     child: ArticleItemWidget(
    //                       imageUrl: j1.pictureUrl,
    //                       text: j1.articleDescription,
    //                     ),
    //                   );
    //                 },
    //               );
    //             }),
    //       ]..add(rowIndexCount == 3
    //           ? Container()
    //           : Row(
    //         mainAxisAlignment: MainAxisAlignment.center,
    //         children: List.generate(rowIndexCount, (index) {
    //           if (index == rowIndexCount - 1) {
    //             return PageIndexWidget(
    //                 onTap: () => logic.switchPage(1),
    //                 child: Icon(Icons.arrow_forward_ios_outlined));
    //           } else if (index == 0) {
    //             return PageIndexWidget(
    //                 onTap: () => logic.switchPage(-1),
    //                 child: Icon(Icons.arrow_back_ios_outlined));
    //           }
    //           return PageIndexButton(
    //             index,
    //             highlight: index == state.currentPage.value,
    //             onTap: () {
    //               logic.toPage(index);
    //             },
    //           );
    //         }),
    //       )),
    //     );
    //   },
    // );
  }
}
