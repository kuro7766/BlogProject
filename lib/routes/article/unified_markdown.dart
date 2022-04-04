import 'dart:math';

import 'package:blog_project/routes/article/unified.dart';
import 'package:blog_project/routes/article/unified_impl.dart';
import 'package:blog_project/util/annotation/widget_article_meta_data.dart';
import 'package:blog_project/util/getx_debug_tool.dart';
import 'package:blog_project/util/simple_http_builder.dart';
import 'package:blog_project/widgets/asset_markdown.dart';
import 'package:blog_project/widgets/cover_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:flutter_markdown/src/widget.dart';
import 'package:path/path.dart' as p;

class UniMd extends StatelessWidget with UnifiedWritingImpl {
  final num time;
  final String path;
  final String tag;
  final String id;

  UniMd({Key key, this.time, this.path, this.tag, this.id}) : super(key: key);

  @override
  Widget get DESCRIPTION => UnifiedItem(
        title: p.basename(path).replaceAll('\.md', ''),
        child: contentWidget(false),
      );

  Widget contentWidget(var preview) {
    return SimpleHttpBuilder(
      httpFuture: (() async {
        // Dbg.log(path);
        var s = await rootBundle.loadString((path));
        // Dbg.log(s,'sp');
        return ResponseContent.success([(p.basename(path)), s]);
      })(),
      builder: (tuple) {
        // return Text('fdslaj');
        String mdContent = tuple[1];
        var title = tuple[0].replaceFirst('\.md', '');
        mdContent = mdContent.replaceAll(RegExp(r'(^"""|"""$)'), '');

        return MaskWidget(
            useMask: !preview,
            child: md(mdContent
                .substring(
                    0, !preview ? min(mdContent.length, 200) : mdContent.length)
                ));
      },
    );
  }

  @override
  List<Widget> get widgets => [contentWidget(true)];

  @override
  get metaInfo => {
        'time': time,
        'tag': tag,
        'id': id,
        'path': path,
        'title': p.basename(path).replaceAll('\.md', '')
      };
}
