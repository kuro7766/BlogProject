# 第二次迭代内容
项目地址: http://kuroweb.cf/ci/blog/web/#/entrance?user=a

## 完全支持markdown，使用iframe展示markdown
iframe捕获mousescroll事件，然后发送给flutter手动滚动列表
**仍然存在一些bug**
```HtmlElementView()``` 旧iframe未完全销毁，虽然过滤了，但是消息仍然能接收到。

## 引入GetX和EventBus，开发效率飞起🚀
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

## CI 地址
https://github.com/kuro7766/BlogProject/actions