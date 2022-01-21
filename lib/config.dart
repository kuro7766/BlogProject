import 'package:blog_project/util/js_util.dart';

class Cfg {
  // static var __isMobile=false;
  // static var __isMobileInitialized=false;
  // static var __isMobile= false;
  static var __isMobile = (() {
    var userAgent1 = JSUtil.call(function: 'getUA', params: []);

    RegExp regExp = new RegExp(
      r"\(.*?\)",
      // r"^WS{1,2}:\/\/\d{1,3}\.\d{1,3}\.\d{1,3}\.\d{1,3}:56789",
      caseSensitive: false,
      multiLine: true,
    );

    var s1 = (regExp.stringMatch(userAgent1));

    var isMobile = false;
    if (s1.contains('iPhone')) {
      isMobile = true;
    } else if (s1.contains('Android')) {
      isMobile = true;
    } else if (s1.contains('Win')) {
      isMobile = false;
    } else {
      isMobile = false;
    }

    // UserAgentParser parser = UserAgentParser();
    // // String userAgent1 = 'Mozilla/5.0 (iPhone; CPU iPhone OS 14_3 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) CriOS/87.0.4280.77 Mobile/15E148 Safari/604.1';
    // Result result = parser.parseResult(userAgent1);
    //
    // print(result.browser.name); // Chrome
    // print(result.browser.unformattedName); // CriOS
    //
    // print(result.browser.version); // 87.0.4280.77
    // print(result.browser
    //     .parsedWithRegex); // r'(?<unformattedName>crmo|crios)\/(?<version>[\w\.]+)'
    return isMobile;
  }());

  static bool get isMobile => __isMobile;

  // static  bool get isMobile=>true;
  // static  bool get isMobile=>false;
  // static set isMobile(bool value){
  //   __isMobile=value;
  // }

//  mobile home padding
  static const mobileHomeIconPadding = 30.0;
}
