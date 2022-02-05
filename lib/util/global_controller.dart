class GlobalController {
//  singleton
  static GlobalController _singleton;

  factory GlobalController() => instance;

  GlobalController._internal();

  static GlobalController get instance => _singleton ??= GlobalController._internal();

  var currentStartIndex=0;
}
