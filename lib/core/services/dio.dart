import 'package:dio/dio.dart';
import 'package:garagewa/core/utils/constant.dart';
import 'package:shared_preferences/shared_preferences.dart';

Dio createBaseDio() {
  final BaseOptions baseOptions = BaseOptions(
    baseUrl: Constant.baseUrl, // Your API base URL
    connectTimeout: const Duration(
        milliseconds:
            15000), // Timeout for connecting to the server (milliseconds)
    receiveTimeout: const Duration(
        milliseconds: 15000), // Timeout for receiving data (milliseconds)
  );
  final Dio dio = Dio(baseOptions);
  dio.interceptors.addAll([
    LogInterceptor(responseBody: true),
  ]);
  return dio;
}

class HTTP {
  final _dioClient = createBaseDio();

  Future<Response> get({
    required String url,
    Map<String, dynamic>? queryParameters,
    ProgressCallback? onReceiveProgress,
  }) async {
    final options = await _getRequestOptions();

    return await _dioClient.get(
      url,
      queryParameters: queryParameters,
      options: options,
      onReceiveProgress: onReceiveProgress,
    );
  }

  Future<Response> delete({
    required String url,
    Map<String, dynamic>? queryParameters,
    ProgressCallback? onReceiveProgress,
  }) async {
    final options = await _getRequestOptions();
    return await _dioClient.delete(
      url,
      queryParameters: queryParameters,
      options: options,
    );
  }

  Future<Response> post({
    required String url,
    data,
    Map<String, dynamic>? queryParameters,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    final options = await _getRequestOptions();
    if (url == '/ga-auth/signIn') {
      options.headers!.addAll({
        "Authorization": Constant.clientIdSecret,
      });
    }

    return await _dioClient.post(
      url,
      data: data,
      queryParameters: queryParameters,
      options: options,
      onSendProgress: onSendProgress,
      onReceiveProgress: onReceiveProgress,
    );
  }

  Future<Response> patch({
    required String url,
    data,
    Map<String, dynamic>? queryParameters,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    final options = await _getRequestOptions();

    return await _dioClient.patch(
      url,
      data: data,
      queryParameters: queryParameters,
      options: options,
      onSendProgress: onSendProgress,
      onReceiveProgress: onReceiveProgress,
    );
  }

  Future<Response> put({
    required String url,
    data,
    Map<String, dynamic>? queryParameters,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    final options = await _getRequestOptions();
    return await _dioClient.put(
      url,
      data: data,
      queryParameters: queryParameters,
      options: options,
      onSendProgress: onSendProgress,
      onReceiveProgress: onReceiveProgress,
    );
  }

  Future<Options> _getRequestOptions() async {
    final headers = <String, dynamic>{
      "Content-Type": "application/json",
    };
    final sharedPreferences = await SharedPreferences.getInstance();
    final token = sharedPreferences.getString('cookie');
    if (token != null) {
      headers["Cookie"] = token;
    }
    return Options(
      headers: headers,
    );
  }
}
