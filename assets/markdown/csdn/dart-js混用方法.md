
如果定义了下面这个函数，主函数就不会执行
```
function dartMainRunner(callMain, _unused_stupid_empty_args) {
  callMain(_dartArgs);
}
```
在这里可以放入一个js对象，通过这个对象dart可以使用js eval等功能

参考连接：

[`dartMainRunner` documentation · Issue #42915 · dart-lang/sdk · GitHub](https://github.com/dart-lang/sdk/issues/42915)