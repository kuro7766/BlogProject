import 'package:blog_project/routes/article/unified.dart';
import 'package:blog_project/util/my_code_style.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

///
///   快速博客编写工具说明文档。
//
// 　　如果是无状态的组件，一切都将正常工作。
//
// 　　如果是在有状态的组件，则需要在状态和组件上面都mix这个类，其中组件的编写都在state里面，而对外展示的一些数据，比如描述的内容，必须在从外层的创建状态上面编写代码。
///
abstract class UnifiedWritingImpl {
  MarkdownBody md(String data) => MarkdownBody(
        data: data,
        selectable: false,
        syntaxHighlighter: HighLight(),
        onTapLink: (String text, String href, String title) async {
          var fail = !await launch(href);
          if (fail) {
            Get.snackbar('Error', 'Could not open link',
                snackPosition: SnackPosition.BOTTOM);
          }
        },
      );

  Column c(List<Widget> children) {
    return Column(
      children: children,
    );
  }

  List<Widget> get widgets => null;

  int get widgetDescriptionSlices => 1;

  Widget get descriptionWidgetContent => () {
        if (this is State) {
          return ((this as State).widget as UnifiedWritingImpl)
              .descriptionWidgetContent;
        } else {
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

  double h(context) => MediaQuery.of(context).size.height;

  double w(context) => MediaQuery.of(context).size.width;
}
