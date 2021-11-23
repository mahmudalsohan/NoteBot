import 'package:butex_notebot/models/notice_model.dart';
import 'package:butex_notebot/models/subject_model.dart';
import 'package:butex_notebot/models/topic_content_model.dart';
import 'package:butex_notebot/models/topic_model.dart';
import 'package:dio/dio.dart';

class HttpService {
  late Dio _dio;

  HttpService() {
    _dio = Dio(
      BaseOptions(
        baseUrl: "https://notebot-engine-v1.herokuapp.com/",
      ),
    );
    initializeInterceptors();
  }

  //to monitor request, response and error
  initializeInterceptors() {
    _dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) {
          return handler.next(options);
        },
        onResponse: (response, handler) {
          print("onResponse: ${response.data}");
          return handler.next(response);
        },
        onError: (DioError e, handler) {
          print(e.message);
          return handler.next(e);
        },
      ),
    );
  }

  //get a response providing the endpoint (baseURL excluded)
  Future<Response> _getResponse(String endPoint) async {
    Response response;

    try {
      response = await _dio.get(endPoint);
    } on DioError catch (e) {
      print(e.toString());
      throw Exception(e.message);
    }

    return response;
  }

  //get all the subjects of a level
  Future<List<Subject>> getSubjects({required int level}) async {
    List<Subject> data = <Subject>[];
    var response = await _getResponse("app/notes/$level");

    data = (response.data as List).map((e) => Subject.fromJson(e)).toList();

    return data;
  }

  //get all the topics of a subject
  Future<List<Topic>> getTopics({required String subjectRoute}) async {
    List<Topic> data = <Topic>[];

    var response = await _getResponse(subjectRoute);

    data = (response.data as List)
        .map(
          (e) => Topic.fromJson(e),
        )
        .toList();

    return data;
  }

  //get all the content links of a topic
  Future<List<TopicContent>> getTopicContent(String topicRoute) async {
    List<TopicContent> data = <TopicContent>[];

    var response = await _getResponse(topicRoute);

    data = (response.data as List)
        .map(
          (e) => TopicContent.fromJson(e),
        )
        .toList();

    return data;
  }

  //get all the Notices from Butex Website
  Future<List<Notice>> getNotices({required String noticeRoute}) async {
    List<Notice> data = <Notice>[];

    var response = await _getResponse(noticeRoute);

    data = (response.data as List)
        .map(
          (e) => Notice.fromJson(e),
        )
        .toList();

    return data;
  }
}
