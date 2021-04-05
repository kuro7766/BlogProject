# 第二次迭代说明和文档记录
项目地址: http://kuroweb.cf/ci/blog/web/#/entrance?user=a

## 完全支持markdown，使用iframe展示markdown
由于flutter对Markdown支持实在是太差了，只能用iframe了

* 嵌套滚动办法

iframe捕获mousescroll事件，然后发送给flutter手动滚动列表
* 仍然存在一些bug

```HtmlElementView()``` 
旧iframe的onMessage未完全销毁，虽然过滤了，但是消息仍然能接收到。

* iframe点击后焦点混乱的问题解决

https://github.com/flutter/flutter/issues/70173

* iframe会抢其他控件焦点（暂未解决❌）

由于flutter是个canvas，iframe是个html组件，而且在canvas上方
只能在其他控件需要点击的时候把它隐藏，尽量不重叠

firefox可能有些安全原因或者函数不同，无法捕获滚动事件
## 引入GetX和EventBus，开发效率飞起🚀
### 对于非组件构建类消息
```dart
//在初始化main函数中
EventBus eventBus = Get.put(EventBus());

//需要调用的地方
EventBus eventBus = Get.find();
_scrollStreamSubscription = eventBus.on<WebScrollEvent>().listen((event) {
//...do your function
});
_scrollStreamSubscription.cancel();
```
### 组件构建类消息
使用getX插件生成mvc文件，然后用
```Obx(() {})```来构建

例如：

```dart
RxInt viewType;
RxInt currentPage;
MainContentState() {
viewType = 0.obs;
currentPage = 1.obs;
}
//这个Obx要求必须在最外层调用需要观察的对象，简直就是魔法！
//除了Get.find()之外唯二感觉厉害的地方
get observe => [viewType.value,currentPage.value];
Obx(() {
      //这里放上需要观察的数组即可
      state.observe;
      switch (state.viewType.value) {
        case 0:
        return Container();      
      }
});
```

## GetxController
中间的markdown和列表展示页面逻辑复杂，因此我用了GetxController，使代码整洁一些


## CI 地址
https://github.com/kuro7766/BlogProject/actions
## Getx学习记录
### 测试用例的写法见getx
https://github.com/jonataslaw/getx/tree/master/test

### 一些需要注意的地方
testcase中，调用Get.to()等跳转方法时需要调用```await tester.pumpAndSettle();```
### Getx重定向，用于登录检查
https://github.com/jonataslaw/getx/pull/954

## intellij 技巧
shift+alt 多光标选择
## 自动化测试相关
### flutter analyze 的问题
flutter web 目前对代码缺陷识别有错误，能编译但是会有红波浪线，目前只能默认无视
创建```analysis_options.yaml```并写入以下代码
```yaml
analyzer:
  errors:
    undefined_prefixed_name: ignore
```
官方修复进度 : https://github.com/flutter/flutter/issues/41563
### flutter test
由于本项目是web，需要加web参数

```flutter test --platform chrome```