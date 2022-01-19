
import 'package:flutter/cupertino.dart';
import 'package:uuid/uuid.dart';
import 'dart:html' as html;
import 'dart:ui' as ui;
class IframeWidget extends StatefulWidget {
  final String url;
  final String uuid = Uuid().v4();
  final double width;
  final double height;
  IframeWidget(this.url, {this.width, this.height});

  @override
  _MarkDownWebState createState() => _MarkDownWebState();
}

class _MarkDownWebState extends State<IframeWidget> {
  double mdHeight;

  @override
  void initState() {
    super.initState();


  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // ignore: undefined_prefixed_name
    ui.platformViewRegistry.registerViewFactory(widget.uuid, (int viewId) {
      html.IFrameElement iFrameElement = html.IFrameElement()
        ..src = widget.url
        ..id = widget.uuid
        ..style.width = '100%'
        ..style.height = '100%'
        ..style.border = 'none';
      return iFrameElement;
    });

    return SizedBox(
      width: widget.width,

      height: widget.height,
      child: HtmlElementView(
        viewType: widget.uuid,
      ),
    );
  }
}