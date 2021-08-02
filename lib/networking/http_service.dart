import 'package:dio/dio.dart';

class HttpService {
  late Dio _dio;

  HttpService() {
    _dio = Dio(
      BaseOptions(
        baseUrl: "https://notebot-engine-v1.herokuapp.com",
      ),
    );
    initializeInterceptors();
  }
  initializeInterceptors() {
    _dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) {
          print("Request sent");
          print(options.path);
          print(options.method);
          return handler.next(options);
        },
        onResponse: (response, handler) {
          print("Got this response: ");
          print(response.data.toString());
          return handler.next(response);
        },
        onError: (DioError e, handler) {
          print(e.message);
          return handler.next(e);
        },
      ),
    );
  }

  Future<Response> getResponse(String endPoint) async {
    Response response;

    try {
      response = await _dio.get(endPoint);
    } on DioError catch (e) {
      print(e.toString());
      throw Exception(e.message);
    }

    return response;
  }
}
