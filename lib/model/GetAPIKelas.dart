import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;


Future<List<GetAPIKelas>> fetchGetAPIKelas() async {
  var responseJson;
  String url = "http://simadu.id/api/get_kelas_api.php";
  final response = await http.post(url);
  if (response.statusCode == 200) {
    responseJson = json.decode(response.body);
    responseJson =
        (responseJson as List).map((p) => GetAPIKelas.fromJson(p)).toList();
  } else {
    responseJson = null;
  }

  return responseJson;
}

class GetAPIKelas {
  final String id_kelas;
  final String kelas;

  

  GetAPIKelas({
    this.id_kelas,
    this.kelas,

  });

  factory GetAPIKelas.fromJson(Map<String, dynamic> json) {
    return GetAPIKelas(
      id_kelas: json['id_kelas'],
      kelas: json['kelas'],

    );
  }
}