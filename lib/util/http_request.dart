import 'dart:convert';

import 'package:blog_project/generated/json/base/json_convert_content.dart';
import 'package:http/http.dart' as http;

typedef Response<T> = void Function(T json);

Future<T> simpleHttpRequest<T>(url, {Response<T> callback}) async {
  // assert(T.toString() != 'dynamic');

  var r = await http.get(Uri.parse(url));
  if(T.toString()=='dynamic'){
    print('warning : you are using dynamic HttpRequest!');
    print(r.body);
  }
  T j = JsonConvert.fromJsonAsT(jsonDecode(r.body));

  callback?.call(j);
  return j;
}
