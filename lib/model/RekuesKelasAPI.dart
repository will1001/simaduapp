import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;


Future<List<RekuesKelasAPI>> fetchRekuesKelasAPI() async {
  var responseJson;
  String url = "http://simadu.id/api/get_api_rekueskelas.php";
  final response = await http.get(url);
  if (response.statusCode == 200) {
    responseJson = json.decode(response.body);
    responseJson =
        (responseJson as List).map((p) => RekuesKelasAPI.fromJson(p)).toList();
  } else {
    responseJson = null;
  }

  return responseJson;
}

class RekuesKelasAPI {
  final String id_rekues;
  final String id_register;
  final String tanggal;
  final String kelas;
  final String lainya;
  
  

  RekuesKelasAPI({
    this.id_rekues,
    this.id_register,
    this.tanggal,
    this.kelas,
    this.lainya,
    
  });

  factory RekuesKelasAPI.fromJson(Map<String, dynamic> json) {
    return RekuesKelasAPI(
      id_rekues: json['id_rekues'],
      id_register: json['id_register'],
      tanggal: json['tanggal'],
      kelas: json['kelas'],
      lainya: json['lainya'],
      
    );
  }
}