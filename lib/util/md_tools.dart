import 'package:flutter/cupertino.dart';
import 'package:flutter_markdown/flutter_markdown.dart';

mixin  BaseArticle {
  static List articles=[
    ()=>m('dflksjal'),
    ()=>m('dflksjal'),
  ];

  static m(data) => MarkdownBody(
        data: data,
        selectable: true,
      );

  static c(widgets) => Column(
        children: widgets,
      );

  static r(widgets) => Row(
        children: widgets,
      );
}
