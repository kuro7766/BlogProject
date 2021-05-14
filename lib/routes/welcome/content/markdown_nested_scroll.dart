
import 'package:blog_project/widgets/only/markdown_web.dart';
import 'package:blog_project/widgets/reusable/white_border.dart';
import 'package:flutter/material.dart';
@Deprecated(
    'just for test'
)
class MarkDownNestedScroll extends StatefulWidget {
  final String data;

  const MarkDownNestedScroll({Key key, this.data}) : super(key: key);

  @override
  _MarkDownNestedScrollState createState() => _MarkDownNestedScrollState();
}

class _MarkDownNestedScrollState extends State<MarkDownNestedScroll> {
  @override
  Widget build(BuildContext context) {

    return WhiteBorder(
      child: Container(
        color: Colors.white,
        child: MarkDownWeb(
           widget.data
        ),
      ),
    );
  }
}
