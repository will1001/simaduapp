import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;


Future<List<KategoriAPI>> fetchKategoriAPI() async {
  var responseJson;
  String url = "http://simadu.id/api/api_kategori.php";
  final response = await http.post(url);
  if (response.statusCode == 200) {
    responseJson = json.decode(response.body);
    responseJson =
        (responseJson as List).map((p) => KategoriAPI.fromJson(p)).toList();
  } else {
    responseJson = null;
  }

  return responseJson;
}

class KategoriAPI {
  final String id_kategori;
  final String kategori_usaha;
  

  KategoriAPI({
    this.id_kategori,
    this.kategori_usaha,
  });

  factory KategoriAPI.fromJson(Map<String, dynamic> json) {
    return KategoriAPI(
      id_kategori: json['id_kategori'],
      kategori_usaha: json['kategori_usaha'],
    );
  }
}