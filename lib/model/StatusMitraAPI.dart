import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;


Future<List<StatusMitraAPI>> fetchStatusMitraAPI() async {
  var responseJson;
  String url = "http://simadu.id/api/api_statusmitra.php";
  final response = await http.get(url);
  if (response.statusCode == 200) {
    responseJson = json.decode(response.body);
    responseJson =
        (responseJson as List).map((p) => StatusMitraAPI.fromJson(p)).toList();
  } else {
    responseJson = null;
  }

  return responseJson;
}

class StatusMitraAPI {
  final String id_statusmitra;
  final String nama;
  final String tanggal;
  final String mitra;
  final String lainya;
  

  StatusMitraAPI({
    this.id_statusmitra,
    this.nama,
    this.tanggal,
    this.mitra,
    this.lainya,

  });

  factory StatusMitraAPI.fromJson(Map<String, dynamic> json) {
    return StatusMitraAPI(
      id_statusmitra: json['id_statusmitra'],
      nama: json['nama'],
      tanggal: json['tanggal'],
      mitra: json['mitra'],
      lainya: json['lainya'],
  
    );
  }
}