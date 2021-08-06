import 'package:butex_notebot/models/topic_content_model.dart';
import 'package:butex_notebot/networking/http_service.dart';
import 'package:dio/dio.dart';

class TopicContentProvider {
  late HttpService _http;

  TopicContentProvider() {
    _http = HttpService();
  }

  Future<List<dynamic>> getTopicContent(String topicRoute) async {
    Response response;

    response = await _http.getResponse(topicRoute);

    return response.data.map((data) => TopicContent.fromJson(data)).toList();
  }
}
