import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BaseScaffold extends StatelessWidget {
  final Widget child;
  final AppBar appBar;
  const BaseScaffold({Key key, this.child, this.appBar}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar,
      body: GestureDetector(onTap: (){
        FocusScope.of(context).requestFocus(new FocusNode());
      },child: child),
    );
  }
}
