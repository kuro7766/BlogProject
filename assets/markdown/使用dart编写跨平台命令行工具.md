
最近对dart的好感度飙升，一方面觉得生态越来越完善。想要找一些APP轮子，基本上都能找到。

另外今天才找到了一个dart的api。发现dart可以编写跨平台的命令行工具。想到前两天使用pyinstaller遇到的大坑，瞬间又感到了新的希望。在命令行调用这些基本操作的方面，dart的能力不亚于Python。

　　

接下来就是开发环节。





首先我们需要创建一个大的工程。因为需要一些配置文件来管理。所需要使用的命令如下。
-t 是template的意思，cli是自己命名的文件

```dart
dart create -t console-full cli
```

或者适合用类似的`flutter create myapp`

接下来需要编译运行

dart compile exe .\example\main.dart -o dart_runnable.exe

接下来我们就可以并运行对应的文件，会自动找到程序的main入口，exe是executable的意思在不同平台上别一会生成不同平台上的可执行文件。
























































