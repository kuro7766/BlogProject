
import 'package:blog_project/util/http_request.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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
            return Center(child: Padding(padding: EdgeInsets.all(10),child: SizedBox(width: 30,height: 30,child: CircularProgressIndicator())));
          }
          return builder(c, snap.data);
        });
  }
}
