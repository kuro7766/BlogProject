
class Debug {
  static int minimalLevel=7;
  static int only=5;
  static void log(int level, s) {
    if(only>0){
      if(level==only){
        print('$s');
        return;
      }
    }
    if (level >= minimalLevel) print('$s');
  }

  static void configuration({minimalLevel}) {
    Debug.minimalLevel = minimalLevel;
  }
}
