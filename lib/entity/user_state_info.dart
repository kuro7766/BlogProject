class UserStateInfo {
  String userToken;
  dynamic other;
  String url;
  bool get login => (() {
        if (other != null &&
            other.containsKey('token') &&
            other['token'] != null) {
          return true;
        }
        return false;
      })();
}
