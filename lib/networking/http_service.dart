import 'package:butex_notebot/constants/controller.dart';
import 'package:butex_notebot/models/lab_subject_model.dart';
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
        baseUrl: networkController.BASE_URL.value,
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
          print("onError: ${e.response!.statusCode}");
          print("onError: ${e.message}");
          return handler.next(e);
        },
      ),
    );
  }

  //get a response providing the endpoint (baseURL excluded)
  Future<Response> _getResponse(String endPoint) async {
    Response response;
    print("BASE_URL: ${networkController.BASE_URL.value}");
    try {
      response = await _dio.get(endPoint);
    } on DioError catch (e) {
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
    print("getTopics: $subjectRoute");
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

  //get levels for lab reports
  Future<List<LabSubject>> getLabSubjects(int level) async {
    List<LabSubject> data = <LabSubject>[];
    var response = await _getResponse("app/labs/$level");

    data = (response.data as List).map((e) => LabSubject.fromJson(e)).toList();

    return data;
  }
}
