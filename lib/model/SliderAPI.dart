import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;


Future<List<SliderAPI>> fetchSliderAPI() async {
  var responseJson;
  String url = "http://simadu.id/api/api_slider.php";
  final response = await http.get(url);
  if (response.statusCode == 200) {
    responseJson = json.decode(response.body);
    responseJson =
        (responseJson as List).map((p) => SliderAPI.fromJson(p)).toList();
  } else {
    responseJson = null;
  }

  return responseJson;
}

class SliderAPI {
  final String id_slider;
  final String img;
  final String kalimat1;
  final String kalimat2;
  final String kalimat3;
  

  SliderAPI({
    this.id_slider,
    this.img,
    this.kalimat1,
    this.kalimat2,
    this.kalimat3,
  });

  factory SliderAPI.fromJson(Map<String, dynamic> json) {
    return SliderAPI(
      id_slider: json['id_slider'],
      img: json['img'],
      kalimat1: json['kalimat1'],
      kalimat2: json['kalimat2'],
      kalimat3: json['kalimat3'],
    );
  }
}