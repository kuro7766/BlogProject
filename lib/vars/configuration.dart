class Config {
  static String user = 'a';
  static int currentPage = 1;

  static String get currentHomePageRoute =>
      '/entrance' + (user.isEmpty ? '' : '?user=$user');
}
