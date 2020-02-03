import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;


Future<List<SertifikatAPI>> fetchSertifikatAPI() async {
  var responseJson;
  String url = "http://simadu.id/api/api_sertifikat.php";
  final response = await http.post(url);
  // print(response.body); 
  if (response.statusCode == 200) {
    responseJson = json.decode(response.body);
    responseJson =
        (responseJson as List).map((p) => SertifikatAPI.fromJson(p)).toList();
  } else {
    responseJson = null;
  }

  return responseJson;
}

class SertifikatAPI {
  final String id_sertifikat;
  final String id_register;
  final String keterangan;
  final String file;

  

  SertifikatAPI({
    this.id_sertifikat,
    this.id_register,
    this.keterangan,
    this.file,
  });

  factory SertifikatAPI.fromJson(Map<String, dynamic> json) {
    return SertifikatAPI(
      id_sertifikat: json['id_sertifikat'],
      id_register: json['id_register'],
      keterangan: json['keterangan'],
      file: json['file'],

    );
  }
}