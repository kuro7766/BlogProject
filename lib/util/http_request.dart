import 'dart:convert';

import 'package:blog_project/generated/json/base/json_convert_content.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import 'debug.dart';

typedef Response<T> = void Function(T json);

Future<T> simpleHttpRequest<T>(url, {Response<T> callback}) async {
  assert(T.toString() != 'dynamic');
  var r = await http.get(Uri.parse(url));
  T j = JsonConvert.fromJsonAsT(jsonDecode(r.body));

  callback?.call(j);
  return j;
}
