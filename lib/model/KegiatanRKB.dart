import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;


Future<List<KegiatanRKB>> fetchKegiatanRKB() async {
  var responseJson;
  String url = "http://simadu.id/api/api_kegiatanrkb.php";
  final response = await http.get(url);
  if (response.statusCode == 200) {
    responseJson = json.decode(response.body);
    responseJson =
        (responseJson as List).map((p) => KegiatanRKB.fromJson(p)).toList();
  } else {
    responseJson = null;
  }

  return responseJson;
}

class KegiatanRKB {
  final String idKegiatan;
  final String img;
  final String keterangan;
  

  KegiatanRKB({
    this.idKegiatan,
    this.img,
    this.keterangan,
  });

  factory KegiatanRKB.fromJson(Map<String, dynamic> json) {
    return KegiatanRKB(
      idKegiatan: json['id_kegiatan'],
      img: json['img'],
      keterangan: json['keterangan'],
    );
  }
}