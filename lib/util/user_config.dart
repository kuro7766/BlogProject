import 'package:http/http.dart' as http;

import 'debug.dart';
class UserConfig{
  static r() async{
    var r=await http.get(Uri.parse("http://kuroweb.cf/index.html"));
    //

  }
}