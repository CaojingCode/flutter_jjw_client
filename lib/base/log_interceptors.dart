import 'package:dio/dio.dart';

class LogInterceptors extends InterceptorsWrapper{
  @override
  Future onRequest(RequestOptions options) {
    print(
        "\n================================= 请求数据 =================================");
    print("method = ${options.method.toString()}");
    print("url = ${options.uri.toString()}");
    print("headers = ${options.headers}");
    print("params = ${options.queryParameters}");
    return super.onRequest(options);
  }

  @override
  Future onResponse(Response response) {
    print(
        "\n================================= 响应数据开始 =================================");
    print(response.request.path);
    print("code = ${response.statusCode}");
    print("data = ${response.data}");
    print(
        "================================= 响应数据结束 =================================\n");
    return super.onResponse(response);
  }

  @override
  Future onError(DioError err) {
    print(
        "\n=================================错误响应数据 =================================");
    print("path = ${err.request.path}");
    print("code = ${err.response.statusCode}");
    print("message = ${err.message}");
    print("\n");
    return super.onError(err);
  }
}