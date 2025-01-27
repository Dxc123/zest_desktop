import 'package:get_storage/get_storage.dart';

//在使用 get_storage 前需要先进行初始化。通常可以在 main.dart 中的 main() 方法内初始化一次。
//  await GetStorage.init(); // 初始化 GetStorage
class StorageUtils {
  // 获取存储实例
  static final GetStorage _storage = GetStorage();

  // =======================
  // 存储数据
  // =======================

  /// 存储字符串
  static Future<void> saveString(String key, String value) async {
    await _storage.write(key, value);
  }

  /// 存储整数
  static Future<void> saveInt(String key, int value) async {
    await _storage.write(key, value);
  }

  /// 存储布尔值
  static Future<void> saveBool(String key, bool value) async {
    await _storage.write(key, value);
  }

  /// 存储列表（支持泛型类型）
  /// await StorageUtils.saveList<int>('userScores', [100, 90, 85]);
  static Future<void> saveList<T>(String key, List<T> value) async {
    await _storage.write(key, value);
  }

  // =======================
  // 获取数据
  // =======================

  /// 获取字符串
  static String? getString(String key) {
    return _storage.read<String>(key);
  }

  /// 获取整数
  static int? getInt(String key) {
    return _storage.read<int>(key);
  }

  /// 获取布尔值
  static bool? getBool(String key) {
    return _storage.read<bool>(key);
  }

  /// 获取列表
  /// List<int>? userScores = StorageUtils.getList<int>('userScores');
  static List<T>? getList<T>(String key) {
    return _storage.read<List<T>>(key);
  }

  // =======================
  // 删除数据
  // =======================

  /// 删除指定key的数据
  static Future<void> delete(String key) async {
    await _storage.remove(key);
  }

  /// 清空所有存储数据
  static Future<void> clear() async {
    await _storage.erase();
  }
}
