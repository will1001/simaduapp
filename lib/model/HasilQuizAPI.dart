import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;


Future<List<HasilQuizAPI>> fetchHasilQuizAPI() async {
  var responseJson;
  String url = "http://simadu.id/api/api_hasilquiz.php";
  final response = await http.post(url);
  if (response.statusCode == 200) {
    responseJson = json.decode(response.body);
    responseJson =
        (responseJson as List).map((p) => HasilQuizAPI.fromJson(p)).toList();
  } else {
    responseJson = null;
  }

  return responseJson;
}

class HasilQuizAPI {
  final String id;
  final String id_soal;
  final String id_register;
  final String benar;
  final String salah;
  final String score;

  

  HasilQuizAPI({
    this.id,
    this.id_soal,
    this.id_register,
    this.benar,
    this.salah,
    this.score,

  });

  factory HasilQuizAPI.fromJson(Map<String, dynamic> json) {
    return HasilQuizAPI(
      id: json['id'],
      id_soal: json['id_soal'],
      id_register: json['id_register'],
      benar: json['benar'],
      salah: json['salah'],
      score: json['score'],

    );
  }
}