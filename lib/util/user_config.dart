import 'package:http/http.dart' as http;

import 'debug.dart';
class UserConfig{
  static r() async{
    var r=await http.get(Uri.parse("http://kuroweb.cf/index.html"));
    // Debug.log(8, r.body);
    Debug.log(8, Uri.base);
  }
}