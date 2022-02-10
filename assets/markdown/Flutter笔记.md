Get.args 是GetX内部的参数，不可见，是Get.toNamed(url,arg:args)的一个参数

Get.params 是 浏览器里的params，url?key=value&key2=value2，是可见的，用于用户观察；跳转时需要使用Get.toName(url)完整url才可以









# flutter get position of widget in listview

```
extension GlobalKeyEx on GlobalKey {
  Rect get globalPaintBounds {
    final renderObject = currentContext?.findRenderObject();
    var translation = renderObject?.getTransformTo(null)?.getTranslation();
    if (translation != null && renderObject.paintBounds != null) {
      return renderObject.paintBounds
          .shift(Offset(translation.x, translation.y));
    } else {
      return null;
    }
  }
}
```



# flutter State 封装

https://stackoverflow.com/questions/50612237/why-are-stateful-widgets-defined-as-two-classes-in-flutter

https://stackoverflow.com/questions/53019294/what-is-the-usefulness-of-immutable-statefulwidget-and-state-in-flutter-but-ca



## state

https://stackoverflow.com/questions/52249578/how-to-deal-with-unwanted-widget-build















































































































