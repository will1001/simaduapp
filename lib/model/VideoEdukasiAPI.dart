import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;


Future<List<VideoEdukasiAPI>> fetchVideoEdukasiAPI() async {
  var responseJson;
  String url = "http://simadu.id/api/api_videoedukasi.php";
  final response = await http.get(url);
  if (response.statusCode == 200) {
    responseJson = json.decode(response.body);
    responseJson =
        (responseJson as List).map((p) => VideoEdukasiAPI.fromJson(p)).toList();
  } else {
    responseJson = null;
  }

  return responseJson;
}

class VideoEdukasiAPI {
  final String id_edukasi;
  final String judul;
  final String link;

  

  VideoEdukasiAPI({
    this.id_edukasi,
    this.judul,
    this.link,
  });

  factory VideoEdukasiAPI.fromJson(Map<String, dynamic> json) {
    return VideoEdukasiAPI(
      id_edukasi: json['id_edukasi'],
      judul: json['judul'],
      link: json['link'],
    );
  }
}