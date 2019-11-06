import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;


Future<List<JenisProdukAPI>> fetchJenisProdukAPI() async {
  var responseJson;
  String url = "http://simadu.id/api/api_jenisproduk.php";
  final response = await http.get(url);
  if (response.statusCode == 200) {
    responseJson = json.decode(response.body);
    responseJson =
        (responseJson as List).map((p) => JenisProdukAPI.fromJson(p)).toList();
  } else {
    responseJson = null;
  }

  return responseJson;
}

class JenisProdukAPI {
  final String id_produk;
  final String jenis_produk;
  

  JenisProdukAPI({
    this.id_produk,
    this.jenis_produk,
  });

  factory JenisProdukAPI.fromJson(Map<String, dynamic> json) {
    return JenisProdukAPI(
      id_produk: json['id_produk'],
      jenis_produk: json['jenis_produk'],
    );
  }
}