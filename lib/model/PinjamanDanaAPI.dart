import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;


Future<List<PinjamanDanaAPI>> fetchPinjamanDanaAPI() async {
  var responseJson;
  String url = "http://simadu.id/api/api_pinjaman.php";
  final response = await http.post(url);
  if (response.statusCode == 200) {
    responseJson = json.decode(response.body);
    responseJson =
        (responseJson as List).map((p) => PinjamanDanaAPI.fromJson(p)).toList();
  } else {
    responseJson = null;
  }

  return responseJson;
}

class PinjamanDanaAPI {
  final String id_pinjaman;
  final String img;
  final String judul;
  final String pesan;
  

  PinjamanDanaAPI({
    this.id_pinjaman,
    this.img,
    this.judul,
    this.pesan,

  });

  factory PinjamanDanaAPI.fromJson(Map<String, dynamic> json) {
    return PinjamanDanaAPI(
      id_pinjaman: json['id_pinjaman'],
      img: json['img'],
      judul: json['judul'],
      pesan: json['pesan'],
  
    );
  }
}