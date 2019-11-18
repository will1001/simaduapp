import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;


Future<List<PerkembanganAPI>> fetchPerkembanganAPI() async {
  var responseJson;
  String url = "http://simadu.id/api/hasil_api.php";
  final response = await http.get(url);
  if (response.statusCode == 200) {
    responseJson = json.decode(response.body);
    responseJson =
        (responseJson as List).map((p) => PerkembanganAPI.fromJson(p)).toList();
  } else {
    responseJson = null;
  }

  return responseJson;
}

class PerkembanganAPI {
  final String id;
  final String id_register;
  final String id_soal;
  final String benar;
  final String salah;
  final String skor;
  
  

  PerkembanganAPI({
    this.id,
    this.id_register,
    this.id_soal,
    this.benar,
    this.salah,
    this.skor,
  });

  factory PerkembanganAPI.fromJson(Map<String, dynamic> json) {
    return PerkembanganAPI(
      id: json['id'],
      id_register: json['id_register'],
      id_soal: json['id_soal'],
      benar: json['benar'],
      salah: json['salah'],
      skor: json['score'],
    );
  }
} 