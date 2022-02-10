import 'package:blog_project/routes/article/unified_impl.dart';
import 'package:blog_project/util/annotation/widget_article_meta_data.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_markdown/src/widget.dart';

@ArticleMetaData(
    {"title": "asf", "tag": "asdfa", "date": "2022-02-06 00:04:45"})
class FirstAr extends StatelessWidget with UnifiedWritingImpl {
  const FirstAr({Key key}) : super(key: key);
  @override
  get widgets => [md('A'), md('B')];
}
