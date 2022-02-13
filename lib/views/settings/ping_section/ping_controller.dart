import 'package:butex_notebot/constants/controller.dart';
import 'package:dio/dio.dart' as DIO;
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';

class PingController extends GetxController {
  String server1 = networkController.primaryBaseURL.value;
  RxInt pingS1 = 0.obs;
  String server2 = networkController.secondaryBaseURL.value;
  RxInt pingS2 = 0.obs;
  List<String> servers = ['Server 1', 'Server 2'];

  getPing(String server) async {
    Rx<DateTime> reqTime = DateTime(0).obs;
    Rx<DateTime> resTime = DateTime(0).obs;
    DIO.Dio dio = DIO.Dio(
      DIO.BaseOptions(
        baseUrl: server,
      ),
    );
    Rx<Duration> duration = Duration().obs;

    dio.interceptors.add(
      DIO.InterceptorsWrapper(
        onRequest: (options, handler) {
          EasyLoading.show();
          reqTime.value = DateTime.now();
          return handler.next(options);
        },
        onResponse: (response, handler) {
          print("onResponse: ${response.data}");
          EasyLoading.dismiss();
          resTime.value = DateTime.now();
          duration.value = resTime.value.difference(reqTime.value);
          //print(duration.value.inMilliseconds);
          return handler.next(response);
        },
        onError: (DIO.DioError e, handler) async {
          EasyLoading.dismiss();
          print("onError: ${e.response!.statusCode}");
          print("onError: ${e.message}");

          return handler.next(e);
        },
      ),
    );
    DIO.Response response = await dio.get('app/notes/1');

    if (server == server1) {
      pingS1.value = duration.value.inMilliseconds;
    } else if (server == server2) {
      pingS2.value = duration.value.inMilliseconds;
    }
  }
}
