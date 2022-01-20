import 'dart:math';

import 'package:blog_project/util/simple_http_builder.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

import 'only/titile_widget.dart';
import 'package:path/path.dart' as p;

class AssetMarkdown extends StatelessWidget {

  final String resource;

  const AssetMarkdown({Key key, this.resource}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SimpleHttpBuilder(
      httpFuture: (() async {
        var s =
        await rootBundle.loadString(Uri.decodeFull(resource));
        // Dbg.log(s);
        return ResponseContent.success(
            [Uri.decodeFull(p.basename(resource)), s]);
      })(),
      builder: (tuple) {
        var mdContent = tuple[1];
        var title = tuple[0].replaceFirst('\.md', '');
        return TitleCard(
          title: '$title',
          child: Align(
            alignment: Alignment.centerLeft,
            child: Container(
              // color: Colors.orangeAccent,
              child: Padding(
                padding: const EdgeInsets.only(top: 10.0),
                child: MarkdownBody(
                  data: '$mdContent'
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
  }
}
