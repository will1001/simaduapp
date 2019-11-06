import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;


Future<List<ShopAPI>> fetchShopAPI() async {
  var responseJson;
  String url = "http://simadu.id/api/api_shop.php";
  final response = await http.get(url);
  if (response.statusCode == 200) {
    responseJson = json.decode(response.body);
    responseJson =
        (responseJson as List).map((p) => ShopAPI.fromJson(p)).toList();
  } else {
    responseJson = null;
  }

  return responseJson;
}

class ShopAPI {
  final String id_shop;
  final String img;
  final String keterangan;
  final String link;
  
  

  ShopAPI({
    this.id_shop,
    this.img,
    this.keterangan,
    this.link,
    
  });

  factory ShopAPI.fromJson(Map<String, dynamic> json) {
    return ShopAPI(
      id_shop: json['id_shop'],
      img: json['img'],
      keterangan: json['keterangan'],
      link: json['link'],
      
    );
  }
}