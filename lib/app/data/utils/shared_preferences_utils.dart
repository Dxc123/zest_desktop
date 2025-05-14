import 'package:shared_preferences/shared_preferences.dart';

// 在 main.dart 的 main() 方法中进行初始化：
// await SharedPreferences.getInstance(); // 初始化 SharedPreferences
class SharedPreferencesUtils {
  // 获取 SharedPreferences 实例
  static Future<SharedPreferences> _getPrefs() async {
    return await SharedPreferences.getInstance();
  }

  // =======================
  // 存储数据
  // =======================

  /// 存储字符串
  static Future<void> saveString(String key, String value) async {
    final SharedPreferences prefs = await _getPrefs();
    prefs.setString(key, value);
  }

  /// 存储整数
  static Future<void> saveInt(String key, int value) async {
    final SharedPreferences prefs = await _getPrefs();
    prefs.setInt(key, value);
  }

  /// 存储布尔值
  static Future<void> saveBool(String key, bool value) async {
    final SharedPreferences prefs = await _getPrefs();
    prefs.setBool(key, value);
  }

  /// 存储双精度浮点数
  static Future<void> saveDouble(String key, double value) async {
    final SharedPreferences prefs = await _getPrefs();
    prefs.setDouble(key, value);
  }

  /// 存储列表
  static Future<void> saveStringList(String key, List<String> value) async {
    final SharedPreferences prefs = await _getPrefs();
    prefs.setStringList(key, value);
  }

  // =======================
  // 获取数据
  // =======================

  /// 获取字符串
  static Future<String?> getString(String key) async {
    final SharedPreferences prefs = await _getPrefs();
    return prefs.getString(key);
  }

  /// 获取整数
  static Future<int?> getInt(String key) async {
    final SharedPreferences prefs = await _getPrefs();
    return prefs.getInt(key);
  }

  /// 获取布尔值
  static Future<bool?> getBool(String key) async {
    final SharedPreferences prefs = await _getPrefs();
    return prefs.getBool(key);
  }

  /// 获取双精度浮点数
  static Future<double?> getDouble(String key) async {
    final SharedPreferences prefs = await _getPrefs();
    return prefs.getDouble(key);
  }

  /// 获取列表
  static Future<List<String>?> getStringList(String key) async {
    final SharedPreferences prefs = await _getPrefs();
    return prefs.getStringList(key);
  }

  // =======================
  // 删除数据
  // =======================

  /// 删除指定的存储项
  static Future<void> delete(String key) async {
    final SharedPreferences prefs = await _getPrefs();
    prefs.remove(key);
  }

  /// 清空所有存储项
  static Future<void> clear() async {
    final SharedPreferences prefs = await _getPrefs();
    prefs.clear();
  }
}
