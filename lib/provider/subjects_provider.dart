import 'package:butex_notebot/models/subject_model.dart';
import 'package:butex_notebot/networking/http_service.dart';
import 'package:dio/dio.dart';

class SubjectsProvider {
  late HttpService _http;

  SubjectsProvider() {
    _http = HttpService();
  }

  getSubjects(int level) async {
    Response response;

    response = await _http.getResponse("/app/notes/$level");
    return response.data.map((data) => Subject.fromJson(data)).toList();
  }
}
