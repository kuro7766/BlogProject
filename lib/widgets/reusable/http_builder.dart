import 'dart:convert';

import 'package:blog_project/util/debug.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

typedef Builder = Widget Function(BuildContext context, dynamic json);

class HttpBuilder extends StatelessWidget {
  final Builder builder;

  HttpBuilder({this.builder});

  Future<String> request() async {
    var r = await http.get(Uri.parse('http://127.0.0.1:8000/blog'));
    Debug.log(9, r.body);
    return r.body;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<String>(
        future: request(),
        builder: (c, snap) {
          Debug.log(10, snap.data);
          if (snap.data == null) {
            return Container();
          }
          return builder(c, jsonDecode(snap.data));
        });
  }
}
