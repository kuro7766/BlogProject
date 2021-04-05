class Debug {
  static int _minimalLevel = 0;
  static int _only = 0;

  static set only(int a) {
    _only = a;
  }

  static set minLv(int a) {
    _minimalLevel = a;
  }

  static void log(int level, s) {
    if (_only > 0) {
      if (level == _only) {
        print('$level : $s');
        return;
      }
    } else {
      if (level >= _minimalLevel) print('$level : $s');
    }
  }
}

log(level, s) {
  Debug.only=0;
  Debug.minLv=100;
  Debug.log(level, s);
}
log2(level, s) {
  Debug.only=0;
  Debug.minLv=0;
  Debug.log(level, s);
}
