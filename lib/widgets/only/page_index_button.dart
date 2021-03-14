import 'package:flutter/material.dart';
typedef OnTapDelegate=void Function();
class PageIndexButton extends StatelessWidget {
  final int index;
  final OnTapDelegate onTap;
  PageIndexButton(this.index,{this.onTap});
  @override
  Widget build(BuildContext context) {
    return PageIndexWidget(child:Text('$index'));
  }
}

class PageIndexWidget extends StatelessWidget {
  final Widget child;
  final OnTapDelegate onTap;
  PageIndexWidget({this.child,this.onTap});
  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: onTap??(){

        },
        child: Container(
          alignment: Alignment.center,
          width: 30,
          height: 30,
          child:child,
        ));
  }
}
