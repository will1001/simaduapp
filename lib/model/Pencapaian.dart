import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;


Future<List<Pencapaian>> fetchPencapaian() async {
  var responseJson;
  String url = "http://simadu.id/api/api_pencapaian.php";
  final response = await http.get(url);
  if (response.statusCode == 200) {
    responseJson = json.decode(response.body);
    responseJson =
        (responseJson as List).map((p) => Pencapaian.fromJson(p)).toList();
  } else {
    responseJson = null;
  }

  return responseJson;
}

class Pencapaian {
  final String id_pencapaian;
  final String pelatihan;
  final String produk_umkm;
  final String peserta;
  final String umkm_binaan;
  

  Pencapaian({
    this.id_pencapaian,
    this.pelatihan,
    this.produk_umkm,
    this.peserta,
    this.umkm_binaan,
  });

  factory Pencapaian.fromJson(Map<String, dynamic> json) {
    return Pencapaian(
      id_pencapaian: json['id_pencapaian'],
      pelatihan: json['pelatihan'],
      produk_umkm: json['produk_umkm'],
      peserta: json['peserta'],
      umkm_binaan: json['umkm_binaan'],
    );
  }
}