import 'package:butex_notebot/constants/controller.dart';
import 'package:butex_notebot/models/departments.dart';
import 'package:butex_notebot/models/lab_subject_model.dart';
import 'package:butex_notebot/models/lab_topic_content.dart';
import 'package:butex_notebot/models/lab_topics.dart';
import 'package:butex_notebot/models/level_and_term.dart';
import 'package:butex_notebot/models/log_error_model.dart';
import 'package:butex_notebot/models/notebird_game_model.dart';
import 'package:butex_notebot/models/notebird_hof.dart';
import 'package:butex_notebot/models/notice_model.dart';
import 'package:butex_notebot/models/subject_model.dart';
import 'package:butex_notebot/models/syllabus_batch.dart';
import 'package:butex_notebot/models/topic_content_model.dart';
import 'package:butex_notebot/models/topic_model.dart';
import 'package:butex_notebot/models/user_model.dart';
import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_config/flutter_config.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

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
          EasyLoading.dismiss();
          return handler.next(response);
        },
        onError: (DioError e, handler) async {
          await logErr(e.message);
          EasyLoading.dismiss();
          EasyLoading.showError('Not Available');
          print("onError: ${e.response!.statusCode}");
          print("onError: ${e.message}");

          return handler.next(e);
        },
      ),
    );
  }

  //get a response providing the endpoint (baseURL excluded)
  Future<Response> get(String endPoint) async {
    Response response;
    print("BASE_URL: ${networkController.BASE_URL.value}");
    try {
      response = await _dio.get(endPoint);
    } on DioError catch (e) {
      await logErr(e.message);
      throw Exception(e.message);
    }
    return response;
  }

  //get all the subjects of a level
  Future<List<Subject>> getSubjects({required int level}) async {
    List<Subject> data = <Subject>[];
    var response = await get("app/notes/$level");

    data = (response.data as List).map((e) => Subject.fromJson(e)).toList();
    return data;
  }

  //get all the topics of a subject
  Future<List<Topic>> getTopics({required String subjectRoute}) async {
    print("getTopics: $subjectRoute");
    List<Topic> data = <Topic>[];

    var response = await get(subjectRoute);

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

    var response = await get(topicRoute);

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

    var response = await get(noticeRoute);

    data = (response.data as List)
        .map(
          (e) => Notice.fromJson(e),
        )
        .toList();

    return data;
  }

  //get subjects for lab reports
  Future<List<LabSubject>> getLabSubjects(int level) async {
    List<LabSubject> data = <LabSubject>[];
    var response = await get("app/labs/$level");

    data = (response.data as List).map((e) => LabSubject.fromJson(e)).toList();

    return data;
  }

  //get Topics for lab reports
  Future<List<LabTopics>> getLabTopics(String route) async {
    List<LabTopics> data = <LabTopics>[];
    var response = await get(route);

    data = (response.data as List).map((e) => LabTopics.fromJson(e)).toList();

    return data;
  }

  //get subjects for lab reports
  Future<List<LabTopicContent>> getLabTopicContent(String route) async {
    List<LabTopicContent> data = <LabTopicContent>[];
    var response = await get(route);

    data = (response.data as List)
        .map((e) => LabTopicContent.fromJson(e))
        .toList();

    return data;
  }

  //get Batches for Syllabus
  Future<List<SyllabusBatch>> getSyllabusBatches(String route) async {
    List<SyllabusBatch> data = <SyllabusBatch>[];
    var response = await get(route);

    data =
        (response.data as List).map((e) => SyllabusBatch.fromJson(e)).toList();

    return data;
  }

  //get departments for Syllabus
  Future<List<Departments>> getDepartments(String route) async {
    List<Departments> data = <Departments>[];
    var response = await get(route);

    data = (response.data as List).map((e) => Departments.fromJson(e)).toList();

    return data;
  }

  //get syllabus for Syllabus
  Future<List<LevelAndTerm>> getSyllabus(String route) async {
    List<LevelAndTerm> data = <LevelAndTerm>[];
    var response = await get(route);

    data =
        (response.data as List).map((e) => LevelAndTerm.fromJson(e)).toList();

    return data;
  }

  //create user
  Future<UserModel?> sendUserData({
    required String? dept,
    required String? id,
    required String? batch,
    required String? email,
  }) async {
    final String postUrl = FlutterConfig.get('SEND_USER_DATA_URL');
    var response = await Dio().post(
      postUrl,
      data: {
        "email": email,
        "uni_id": id,
        "batch": batch,
        "dept": dept,
        "role": "user",
      },
      queryParameters: {
        "adminKey": FlutterConfig.get('ADMIN_KEY'),
      },
    );

    if (response.statusCode == 200) {
      return UserModel.fromJson(response.data);
    } else {
      return null;
    }
  }

  Future<LogErrorModel?> logErr(String err) async {
    final String postUrl = FlutterConfig.get('LOG_ERR_URL');
    String date =
        "${DateTime.now().day}-${DateTime.now().month}-${DateTime.now().year}";
    String? email = FirebaseAuth.instance.currentUser?.email;
    String os = appController.osVersion.value;

    var res = await Dio().post(
      postUrl,
      data: {
        "date": date,
        "email": "$email",
        "os": os,
        "log": err,
      },
      queryParameters: {
        "adminKey": FlutterConfig.get('ADMIN_KEY'),
      },
    );
    if (res.statusCode == 200) {
      return LogErrorModel.fromJson(res.data);
    } else {
      return null;
    }
  }

  Future<NoteBirdModel?> postHighScore(int highScore) async {
    final String postUrl = FlutterConfig.get('GAME_SCORE_URL');

    String dateTime =
        "${DateTime.now().day}-${DateTime.now().month}-${DateTime.now().year} : ${DateTime.now().hour}-${DateTime.now().minute}-${DateTime.now().second}";
    String? email = FirebaseAuth.instance.currentUser!.email;
    String? name = FirebaseAuth.instance.currentUser!.displayName;

    var response = await Dio().post(
      postUrl,
      data: {
        "date": dateTime,
        "score": highScore,
        "email": "$email",
        "user_name": "$name",
      },
      queryParameters: {
        "adminKey": FlutterConfig.get('ADMIN_KEY'),
      },
    );
    if (response.statusCode == 200) {
      return NoteBirdModel.fromJson(response.data);
    } else {
      return null;
    }
  }

  //get Hall of Fame
  Future<NoteBirdHof> getHOF() async {
    NoteBirdHof noteBirdHof;
    var response = await Dio().get("https://api.triptex.me/games/notebird");

    noteBirdHof = NoteBirdHof.fromJson(response.data);

    return noteBirdHof;
  }
}
