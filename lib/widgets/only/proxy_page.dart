import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProxyPage extends StatelessWidget {
  final String route;

  const ProxyPage(this.route,{Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Future.microtask(() => Get.offNamed(this.route));
    return Container();
  }
}
