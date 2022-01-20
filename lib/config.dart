class Cfg{
  static var __isMobile=false;
  static  bool get isMobile=>__isMobile;
  // static  bool get isMobile=>true;
  // static  bool get isMobile=>false;
  static set isMobile(bool value){
    __isMobile=value;
  }

//  mobile home padding
  static const mobileHomeIconPadding=30.0;

}