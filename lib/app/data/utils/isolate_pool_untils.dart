import 'dart:async';
import 'dart:collection';
import 'dart:isolate';

/*
使用示例
import 'isolate_pool.dart'; // 假设上面的类保存在此文件中

void main() async {
  // 创建一个最大并发为 2 的 Isolate 池
  final isolatePool = IsolatePool(2);

  // 定义一个耗时任务
  String longRunningTask(int index) {
    final duration = Duration(seconds: index % 3 + 1);
    print('Task $index started (duration: ${duration.inSeconds}s)');
    // 模拟耗时任务
    Future.delayed(duration).then((_) {
      print('Task $index completed');
    });
    return 'Task $index result';
  }

  // 提交多个任务
  final futures = List.generate(5, (index) {
    return isolatePool.run(longRunningTask, index);
  });

  // 等待所有任务完成
  final results = await Future.wait(futures);

  // 输出结果
  for (var result in results) {
    print(result);
  }


Task 0 started (duration: 1s)
Task 1 started (duration: 2s)
Task 2 started (duration: 3s)
Task 0 completed
Task 1 completed
Task 2 completed
...
}

 */
class IsolatePool {
  final int maxConcurrent;
  int _runningCount = 0;
  final Queue<_IsolateTask> _taskQueue = Queue();

  IsolatePool(this.maxConcurrent);

  Future<R> run<T, R>(R Function(T args) task, T args) async {
    final completer = Completer<R>();
    final isolateTask = _IsolateTask<T, R>(
      task: task,
      args: args,
      completer: completer,
    );

    if (_runningCount < maxConcurrent) {
      _executeTask(isolateTask);
    } else {
      _taskQueue.add(isolateTask);
    }

    return completer.future;
  }

  void _executeTask<T, R>(_IsolateTask<T, R> isolateTask) async {
    _runningCount++;
    try {
      final result = await _spawnIsolate(isolateTask.task, isolateTask.args);
      isolateTask.completer.complete(result);
    } catch (error, stack) {
      isolateTask.completer.completeError(error, stack);
    } finally {
      _runningCount--;
      if (_taskQueue.isNotEmpty) {
        _executeTask(_taskQueue.removeFirst());
      }
    }
  }

  Future<R> _spawnIsolate<T, R>(R Function(T args) task, T args) async {
    final receivePort = ReceivePort();
    final isolate = await Isolate.spawn(
      _isolateEntryPoint,
      _IsolateMessage<T, R>(
        task: task,
        args: args,
        sendPort: receivePort.sendPort,
      ),
    );

    final result = await receivePort.first as R;
    receivePort.close();
    isolate.kill(priority: Isolate.immediate);
    return result;
  }

  static void _isolateEntryPoint<T, R>(_IsolateMessage<T, R> message) {
    final result = message.task(message.args);
    message.sendPort.send(result);
  }
}

class _IsolateTask<T, R> {
  final R Function(T args) task;
  final T args;
  final Completer<R> completer;

  _IsolateTask({
    required this.task,
    required this.args,
    required this.completer,
  });
}

class _IsolateMessage<T, R> {
  final R Function(T args) task;
  final T args;
  final SendPort sendPort;

  _IsolateMessage({
    required this.task,
    required this.args,
    required this.sendPort,
  });
}
