import 'package:dio/dio.dart';

import 'api_client.dart';

class ApiClientService {
  factory ApiClientService() {
    _instance ??= ApiClientService._internal();
    return _instance!;
  }

  ApiClientService._internal();

  static ApiClientService? _instance;

  void sayHello() {
    print("Hello, Singleton!");
  }

  static ApiClient client() {
    final dio = Dio();
    final client = ApiClient(dio);
    return client;
  }
}
