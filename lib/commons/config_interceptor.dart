import 'package:dio/dio.dart';
import 'package:omega_evaluation_project/commons/constant.dart';

class ConfigInterceptor implements InterceptorsWrapper {
  @override
  Future onError(DioError err) async {
    return err;
  }

  @override
  Future onRequest(RequestOptions options) async {
    if (!options.headers.containsKey(IS_HAVE_BASE_URL)) {
      var baseUrl = BASE_URL;
      if (baseUrl != null) {
        baseUrl = "$baseUrl";
      }
      options.baseUrl = baseUrl;
    } else {
      options.headers.remove(IS_HAVE_BASE_URL);
    }
    options.headers.addAll({'Accept-Charset': 'utf-8'});
    return options;
  }

  @override
  Future onResponse(Response response) async {
    return response;
  }
}
