//一种快速构建NetworkWidget的方法

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

typedef Builder<T> = Widget Function(T json);
class ResponseContent<T> {
  bool success;
  T data;

  ResponseContent({this.success, this.data});

  ResponseContent.success(T responseData) {
    success = true;
    data=responseData;
  }

  ResponseContent.fail(){
    success=false;
  }
}
class SimpleHttpBuilder<T> extends StatelessWidget {
  // 组件回调，两者任选其一
  final Builder<T> builder;

  final Widget loadingWidget;

  //initial data 设置成上次请求的数据，这样用户就不会看到加载动画，后续会完成
  final String cacheKey;

  final Future<ResponseContent<T>> httpFuture;

  //debug用
  static Future<ResponseContent<T>> fakeFuture<T>({T testData}) async {
    return ResponseContent(success: true, data: testData ?? {});
  }

  const SimpleHttpBuilder({
    Key key,
    this.builder,
    this.loadingWidget,
    this.cacheKey,  //同一key下次快速加载
    this.httpFuture,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<ResponseContent<T>>(
        initialData: null,
        future: httpFuture,
        builder: (c, snap) {
          // 错误加载处理
          if (snap.data == null || snap.data.success == false) {
            return loadingWidget ??
                const Center(
                    child: Padding(
                        padding: EdgeInsets.all(10),
                        child: SizedBox(
                            width: 30,
                            height: 30,
                            child: CircularProgressIndicator())));
          }
          return builder?.call(snap.data.data) ?? Container();
        });
  }
}
