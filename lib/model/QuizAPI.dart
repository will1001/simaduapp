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
  final String id_QuizAPI;
  final String tanggal;
  final String keterangan;
  final String nama_file;

  

  QuizAPI({
    this.id_QuizAPI,
    this.tanggal,
    this.keterangan,
    this.nama_file,
  });

  factory QuizAPI.fromJson(Map<String, dynamic> json) {
    return QuizAPI(
      id_QuizAPI: json['id_QuizAPI'],
      tanggal: json['tanggal'],
      keterangan: json['keterangan'],
      nama_file: json['nama_file'],
    );
  }
}