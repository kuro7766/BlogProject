import 'package:flutter/material.dart';

class DateTitleItem extends StatelessWidget {
  final Widget date;
  final Widget title;

  const DateTitleItem({Key key, this.date, this.title}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Row(children: [date,title],);
  }
}
