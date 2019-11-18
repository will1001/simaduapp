import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;


Future<List<PartisipasiAPI>> fetchPartisipasiAPI() async {
  var responseJson;
  String url = "http://simadu.id/api/api_berita.php";
  final response = await http.get(url);
  if (response.statusCode == 200) {
    responseJson = json.decode(response.body);
    responseJson =
        (responseJson as List).map((p) => PartisipasiAPI.fromJson(p)).toList();
  } else {
    responseJson = null;
  }

  return responseJson;
}

class PartisipasiAPI {
  final String id_level;
  final String id_register;
  final String no;
  final String tanggal;
  final String kehadiran;
  final String judul;
  

  PartisipasiAPI({
    this.id_level,
    this.id_register,
    this.no,
    this.tanggal,
    this.kehadiran,
    this.judul,
  });

  factory PartisipasiAPI.fromJson(Map<String, dynamic> json) {
    return PartisipasiAPI(
      id_level: json['id_level'],
      id_register: json['id_register'],
      no: json['no'],
      tanggal: json['tanggal'],
      kehadiran: json['kehadiran'],
      judul: json['judul'],
    );
  }
} 