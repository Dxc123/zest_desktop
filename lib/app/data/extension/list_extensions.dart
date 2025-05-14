// List<T> 扩展 — 集合实用程序

extension ListExtensions<T> on List<T> {

  bool get isNullOrEmpty => this == null || this.isEmpty;

  List<T> removeNulls() => this.where((e) => e != null).toList();

  T? get firstOrNull => this.isNotEmpty ? this.first : null;
}

/**

    final list = [1, null, 2, null, 3];
    print(list.removeNulls()); // [1, 2, 3]

    final empty = <int>[];
    print(empty.firstOrNull); // null

 */