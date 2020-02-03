import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;


Future<List<QuizAPInmr>> fetchQuizAPInmr() async {
  var responseJson;
  String url = "http://simadu.id/api/api_quiz_nmr.php";
  final response = await http.post(url);
  if (response.statusCode == 200) {
    responseJson = json.decode(response.body);
    responseJson =
        (responseJson as List).map((p) => QuizAPInmr.fromJson(p)).toList();
  } else {
    responseJson = null;
  }

  return responseJson;
}

class QuizAPInmr {
  final String no;
  

  QuizAPInmr({
    this.no,

  });

  factory QuizAPInmr.fromJson(Map<String, dynamic> json) {
    return QuizAPInmr(
      no: json['no'],
    );
  }
}