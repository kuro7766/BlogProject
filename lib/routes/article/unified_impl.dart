import 'package:blog_project/routes/article/unified.dart';
import 'package:blog_project/util/my_code_style.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';
///
///
///
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

  Column c(List<Widget> children){
    return Column(children: children,);
  }

  List<Widget> get widgets => null;

  int get widgetDescriptionSlices => 1;

  Widget get descriptionWidgetContent =>(){
    if(this is State){
      return ((this as State).widget as UnifiedWritingImpl)
          .descriptionWidgetContent;
    }else{
      return widgets == null
          ? Container()
          : Column(
        children: [...widgets?.sublist(0, widgetDescriptionSlices)],
      );
    }
  }();

  dynamic get metaInfo => {'time': 0, 'tag': '', 'id': '', 'title': '无标题'};

  Widget build(BuildContext context) {
    return Column(
      children: widgets,
    );
  }

  Widget get thisWidget => this as Widget;

  // Widget get thisWidget => build(context);

  Widget get DESCRIPTION => () {
        Widget content = null;
        if (this is State) {
          content = ((this as State).widget as UnifiedWritingImpl)
              .descriptionWidgetContent;
        } else {
          content = descriptionWidgetContent;
        }
        return UnifiedItem(
          title: metaInfo['title'],
          child: content,
        );
      }();
}
