import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;


Future<List<BeritaAPI>> fetchBeritaAPI() async {
  var responseJson;
  String url = "http://simadu.id/api/api_berita.php";
  final response = await http.post(url);
  if (response.statusCode == 200) {
    responseJson = json.decode(response.body);
    responseJson =
        (responseJson as List).map((p) => BeritaAPI.fromJson(p)).toList();
  } else {
    responseJson = null;
  }

  return responseJson;
}

class BeritaAPI {
  final String id_berita;
  final String judul;
  final String penulis;
  final String tanggal;
  final String img;
  final String kategori;
  final String link;
  final String isi;
  

  BeritaAPI({
    this.id_berita,
    this.judul,
    this.penulis,
    this.tanggal,
    this.img,
    this.kategori,
    this.link,
    this.isi,
  });

  factory BeritaAPI.fromJson(Map<String, dynamic> json) {
    return BeritaAPI(
      id_berita: json['id_berita'],
      judul: json['judul'],
      penulis: json['penulis'],
      tanggal: json['tanggal'],
      img: json['img'],
      kategori: json['kategori'],
      link: json['link'],
      isi: json['isi'],
    );
  }
}