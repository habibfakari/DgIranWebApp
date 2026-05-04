import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../config.dart';

class ApiClient {
  final Dio dio;

  ApiClient(String baseUrl)
      : dio = Dio(BaseOptions(
    baseUrl: baseUrl,
    connectTimeout: const Duration(seconds: 15),
    receiveTimeout: const Duration(seconds: 15),
    headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
    },
  ));

  void setToken(String? token) {
    if (token != null) {
      dio.options.headers['Authorization'] = 'Bearer $token';
    }
  }
}

class TokenManager {
  static Future<String?> getToken() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString('token');
  }

  static Future<void> save(String token) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('token', token);
    Conf.token = token;
  }

  static Future<void> clear() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('token');
    Conf.token = null;
  }
}

class NetworkException implements Exception {
  final String message;
  final int? code;

  NetworkException(this.message, [this.code]);
}

class NetworkService {
  final ApiClient api;

  NetworkService(this.api);

  Future get(String url, {Map<String, dynamic>? query}) async {
    try {
      final res = await api.dio.get(url, queryParameters: query);
      return res.data;
    } on DioException catch (e) {
      throw _handleError(e);
    }
  }

  Future post(String url, Map data) async {
    try {
      final res = await api.dio.post(url, data: data);
      return res.data;
    } on DioException catch (e) {
      throw _handleError(e);
    }
  }

  Future put(String url, Map data) async {
    try {
      final res = await api.dio.put(url, data: data);
      return res.data;
    } on DioException catch (e) {
      throw _handleError(e);
    }
  }

  Future delete(String url) async {
    try {
      final res = await api.dio.delete(url);
      return res.data;
    } on DioException catch (e) {
      throw _handleError(e);
    }
  }

  Future upload(
      String url,
      FormData formData,
      Function(int, int)? onProgress,
      ) async {
    try {
      final res = await api.dio.post(
        url,
        data: formData,
        onSendProgress: onProgress,
        options: Options(contentType: 'multipart/form-data'),
      );
      return res.data;
    } on DioException catch (e) {
      throw _handleError(e);
    }
  }

  Future download(String url, String path) async {
    try {
      final res = await api.dio.download(url, path);
      return res.data;
    } on DioException catch (e) {
      throw _handleError(e);
    }
  }

  Exception _handleError(DioException e) {
    final code = e.response?.statusCode;
    final msg = e.response?.data?['message'] ?? 'Server Error';

    return NetworkException(msg, code);
  }
}