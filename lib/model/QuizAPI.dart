import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;


Future<List<QuizAPI>> fetchQuizAPI() async {
  var responseJson;
  String url = "http://simadu.id/api/api_quiz.php";
  final response = await http.get(url);
  if (response.statusCode == 200) {
    responseJson = json.decode(response.body);
    responseJson =
        (responseJson as List).map((p) => QuizAPI.fromJson(p)).toList();
  } else {
    responseJson = null;
  }

  return responseJson;
}

class QuizAPI {
  final String id_soal;
  final String no;
  final String soal;
  final String a;
  final String b;
  final String c;
  final String d;
  final String e;
  final String knc_jawaban;
  final String aktif;
  

  QuizAPI({
    this.id_soal,
    this.no,
    this.soal,
    this.a,
    this.b,
    this.c,
    this.d,
    this.e,
    this.knc_jawaban,
    this.aktif,

  });

  factory QuizAPI.fromJson(Map<String, dynamic> json) {
    return QuizAPI(
      id_soal: json['id_soal'],
      no: json['no'],
      soal: json['soal'],
      a: json['a'],
      b: json['b'],
      c: json['c'],
      d: json['d'],
      e: json['e'],
      knc_jawaban: json['knc_jawaban'],
      aktif: json['aktif'],
    );
  }
}