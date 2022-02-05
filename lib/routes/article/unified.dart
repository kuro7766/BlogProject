
import 'package:blog_project/routes/article/unified_impl.dart';
import 'package:blog_project/widgets/only/titile_widget.dart';
import 'package:flutter/cupertino.dart';

class UnifiedItem extends StatelessWidget {
  final Widget child;
  final String title;

  const UnifiedItem({Key key, this.child, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TitleCard(
      title: '$title',
      child: Align(
        alignment: Alignment.centerLeft,
        child: Container(
          // color: Colors.orangeAccent,
          child: Padding(
            padding: const EdgeInsets.only(top: 10.0),
            child: child,
          ),
        ),
      ),
    );
  }
}