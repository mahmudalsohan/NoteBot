import 'package:butex_notebot/models/topic_model.dart';
import 'package:butex_notebot/networking/http_service.dart';
import 'package:dio/dio.dart';

class TopicsProvider {
  late HttpService _http;

  TopicsProvider() {
    _http = HttpService();
  }

  getTopics(String subjectRoute) async {
    Response response;

    response = await _http.getResponse(subjectRoute);

    return response.data.map((data) => Topic.fromJson(data)).toList();
  }
}
