import 'dart:async';

/// flutter中的synchronize，
/// 用future形成链表的方式
/// sqlite数据库需要使用到

class AsyncMutex {
  Future _next = new Future.value(null);

  /// Request [operation] to be run exclusively.
  ///
  /// Waits for all previously requested operations to complete,
  /// then runs the operation and completes the returned future with the
  /// result.
  Future<T> run<T>(Future<T> operation()) {
    var completer = new Completer<T>();
    _next.whenComplete(() {
      completer.complete(new Future<T>.sync(operation));
    });
    return _next = completer.future;
  }
}
