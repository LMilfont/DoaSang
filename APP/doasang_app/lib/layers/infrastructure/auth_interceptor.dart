import 'package:dio/dio.dart';

class AuthInterceptor extends Interceptor {
  final String? authToken;

  AuthInterceptor(this.authToken);

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    if (authToken != null) {
      options.headers["Authorization"] = "Bearer $authToken";
    }
    super.onRequest(options, handler);
  }

  @override
  void onError(DioError err, ErrorInterceptorHandler handler) {
    // Erros de autenticação ou expiração do token podem ser tratados aqui.
    super.onError(err, handler);
  }
}
