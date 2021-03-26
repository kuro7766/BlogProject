import 'dart:convert';

import 'package:blog_project/generated/json/base/json_convert_content.dart';
import 'package:blog_project/util/debug.dart';
import 'package:blog_project/util/http_request.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

typedef Builder<T> = Widget Function(BuildContext context, T json);

class HttpBuilder<T> extends StatelessWidget {
  final Builder<T> builder;
  final String url;

  HttpBuilder({this.builder, this.url});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<T>(
        initialData: null,
        // future: request(),
        future: simpleHttpRequest<T>(url),
        builder: (c, snap) {
          if (snap.data == null) {
            return Container();
          }
          return builder(c, snap.data);
        });
  }
}
