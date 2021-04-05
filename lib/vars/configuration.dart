class Config {
  static String user = 'a';

  static String get currentHomePageRoute =>
      '/entrance' + (user.isEmpty ? '' : '?user=$user');
}
