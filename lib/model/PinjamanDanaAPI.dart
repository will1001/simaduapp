import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;


Future<List<PinjamanDanaAPI>> fetchPinjamanDanaAPI() async {
  var responseJson;
  String url = "http://simadu.id/api/api_pinjaman.php";
  final response = await http.get(url);
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
  final String judul;
  final String pesan;
  final String link;
  

  PinjamanDanaAPI({
    this.id_pinjaman,
    this.judul,
    this.pesan,
    this.link,

  });

  factory PinjamanDanaAPI.fromJson(Map<String, dynamic> json) {
    return PinjamanDanaAPI(
      id_pinjaman: json['id_pinjaman'],
      judul: json['judul'],
      pesan: json['pesan'],
      link: json['link'],
  
    );
  }
}