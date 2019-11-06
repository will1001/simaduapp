import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;


Future<List<APIRegisterAll>> fetchAPIRegisterAll() async {
  var responseJson;
  String url = "http://simadu.id/api/api_register_all.php";
  final response = await http.get(url);
  if (response.statusCode == 200) {
    responseJson = json.decode(response.body);
    responseJson =
        (responseJson as List).map((p) => APIRegisterAll.fromJson(p)).toList();
  } else {
    responseJson = null;
  }

  return responseJson;
}

class APIRegisterAll {
  final String id_register;
  final String nama_pemilik;
  

  APIRegisterAll({
    this.id_register,
    this.nama_pemilik,
  });

  factory APIRegisterAll.fromJson(Map<String, dynamic> json) {
    return APIRegisterAll(
      id_register: json['id_register'],
      nama_pemilik: json['nama_pemilik'],
    );
  }
}