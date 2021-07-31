import 'package:dio/dio.dart';
import 'package:cookie_jar/cookie_jar.dart';
import 'package:dio_cookie_manager/dio_cookie_manager.dart';
import 'package:shared_preferences/shared_preferences.dart';

var cookieJar = CookieJar();

Dio dio() {
  Dio dio = new Dio();

  dio.interceptors.add(CookieManager(cookieJar));
  dio.options.baseUrl = 'http://167.71.196.236/api/';

  dio.interceptors.add(
    InterceptorsWrapper(
      onRequest: (RequestOptions options, RequestInterceptorHandler handler) async {
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      String? token = prefs.getString('token');
      if(token.toString().isNotEmpty){
        options.headers['Authorization'] = 'Bearer $token';
      }
      options.headers['Accept'] = 'application/json';
      return handler.next(options);
    }
    )
  );
  return dio;
}