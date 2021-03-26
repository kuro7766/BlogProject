import 'package:flutter/material.dart';
typedef OnTapDelegate=void Function();
class PageIndexButton extends StatelessWidget {
  final int index;
  final OnTapDelegate onTap;
  final bool highlight;

  PageIndexButton(this.index,{this.onTap, this.highlight=false});
  @override
  Widget build(BuildContext context) {
    return PageIndexWidget(highlight: highlight,child:Text('$index'));
  }
}

class PageIndexWidget extends StatelessWidget {
  final Widget child;
  final OnTapDelegate onTap;
  final bool highlight;
  PageIndexWidget({this.child,this.onTap, this.highlight=false});
  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: onTap??(){

        },
        child: Container(
          alignment: Alignment.center,
          color: highlight?Colors.lightBlueAccent:Colors.transparent,
          width: 30,
          height: 30,
          child:child,
        ));
  }
}
