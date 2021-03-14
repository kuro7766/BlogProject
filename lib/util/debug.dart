
class Debug {
  static int _minimalLevel=10;
  static int _only=0;
  static void log(int level, s) {
    if(_only>0){
      if(level==_only){
        print('$s');
        return;
      }
    }
    if (level >= _minimalLevel) print('$s');
  }

  static void configuration({minimalLevel}) {
    Debug._minimalLevel = minimalLevel;
  }
}
