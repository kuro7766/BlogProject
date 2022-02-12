import 'package:blog_project/routes/article/unified.dart';
import 'package:blog_project/util/my_code_style.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

abstract class UnifiedWritingImpl {
  MarkdownBody md(data) => MarkdownBody(
        data: data,
        selectable: true,
    syntaxHighlighter: HighLight(),
    onTapLink: (String text, String href, String title) async {
      var fail = !await launch(href);
      if (fail) {
        Get.snackbar('Error', 'Could not open link',
            snackPosition: SnackPosition.BOTTOM);
      }
    },
      );

  List<Widget> get widgets => null;

  dynamic get metaInfo => {'time': 0, 'tag': '', 'id': '', 'title': '无标题'};

  Widget build(BuildContext context) {
    return Column(
      children: widgets,
    );
  }

  int get widgetDescriptionSlices => 1;

  Widget get thisWidget => this as Widget;
  Widget get descriptionWidgetContent => widgets==null?Container():Column(
    children: [...widgets?.sublist(0, widgetDescriptionSlices)],
  );
  Widget get descriptionWidget => UnifiedItem(
    title: metaInfo['title'],
    child: descriptionWidgetContent,
  );
}
