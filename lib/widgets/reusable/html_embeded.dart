// import 'dart:html';

import 'package:flutter/cupertino.dart';
import 'dart:ui' as ui;

// wait to be implemented
class HtmlEmbedView extends StatelessWidget {
  static int _id=0;
  final String url;
  // it seems only wrapped in a sizebox will work
  final int width;
  final int height;
  HtmlEmbedView({this.url, this.width, this.height});

  void register(mId) {
    // ui.platformViewRegistry.registerViewFactory(
    //     '$mId',
    //     (int viewId) => EmbedElement()
    //       ..height="$height"
    //       ..width="$width"
    //       ..src = url
    //       ..style.border = 'none');
  }

  @override
  Widget build(BuildContext context) {
    var mId=_id;
    register(mId);
    return HtmlElementView(viewType: '$mId');
  }
}
