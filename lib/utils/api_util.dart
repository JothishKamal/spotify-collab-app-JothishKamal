import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:spotify_collab_app/constants/constants.dart';

class ApiUtil {
  ApiUtil._internal() {
    dio.interceptors.add(InterceptorsWrapper(
      onRequest: (options, handler) async {
        SharedPreferences prefs = await SharedPreferences.getInstance();
        String? token = prefs.getString('access_token');

        if (token != null) {
          options.headers['Authorization'] = 'Bearer $token';
        }

        return handler.next(options);
      },
      onError: (DioException e, handler) {
        return handler.next(e);
      },
    ));
  }

  static final ApiUtil _instance = ApiUtil._internal();

  factory ApiUtil() => _instance;

  Dio dio = Dio(BaseOptions(
    baseUrl: devUrl,
  ));

  Future<Response> get(String endpoint, [Map<String, dynamic>? data]) async {
    try {
      Response response = await dio.get(endpoint, data: data);
      return response;
    } catch (e) {
      throw Exception('Failed to load data: $e');
    }
  }

  Future<Response> post(String endpoint, Map<String, dynamic> data) async {
    try {
      Response response = await dio.post(endpoint, data: data);
      return response;
    } catch (e) {
      throw Exception('Failed to post data: $e');
    }
  }

  Future<Response> delete(String endpoint, Map<String, dynamic> data) async {
    try {
      Response response = await dio.post(endpoint, queryParameters: data);
      return response;
    } catch (e) {
      throw Exception('Failed to post data: $e');
    }
  }
}

ApiUtil apiUtil = ApiUtil();
