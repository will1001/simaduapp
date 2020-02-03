import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;


Future<List<TimAPI>> fetchTimAPI() async {
  var responseJson;
  String url = "http://simadu.id/api/api_tim.php";
  final response = await http.post(url);
  if (response.statusCode == 200) {
    responseJson = json.decode(response.body);
    responseJson =
        (responseJson as List).map((p) => TimAPI.fromJson(p)).toList();
  } else {
    responseJson = null;
  }

  return responseJson;
}

class TimAPI {
  final String id_tim;
  final String img;
  final String nama;
  final String jabatan;
  

  TimAPI({
    this.id_tim,
    this.img,
    this.nama,
    this.jabatan,
  });

  factory TimAPI.fromJson(Map<String, dynamic> json) {
    return TimAPI(
      id_tim: json['id_tim'],
      img: json['img'],
      nama: json['nama'],
      jabatan: json['jabatan'],
    );
  }
}