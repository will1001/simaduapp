import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;


Future<List<Agenda>> fetchAgenda() async {
  var responseJson;
  String url = "http://simadu.id/api/api_agenda.php";
  final response = await http.get(url);
  if (response.statusCode == 200) {
    responseJson = json.decode(response.body);
    responseJson =
        (responseJson as List).map((p) => Agenda.fromJson(p)).toList();
  } else {
    responseJson = null;
  }

  return responseJson;
}

class Agenda {
  final String id_agenda;
  final String tanggal;
  final String judul;
  final String img;
  final String agenda;

  

  Agenda({
    this.id_agenda,
    this.tanggal,
    this.judul,
    this.img,
    this.agenda,

  });

  factory Agenda.fromJson(Map<String, dynamic> json) {
    return Agenda(
      id_agenda: json['id_agenda'],
      tanggal: json['tanggal'],
      judul: json['judul'],
      img: json['img'],
      agenda: json['agenda'],

    );
  }
}