import 'dart:convert';

class LoginAPI{

  Future<List<Data>> getDatalogin() async {
  var dataku=[{
      'username':'admin',
      'password':'admin',
      'loged':true,
    }];
    var responseJson = json.decode(json.encode(dataku));
    responseJson =
        dataku.map((p) => Data.fromJson(p)).toList();

  return responseJson;
}

}



class Data {
  final String username;
  final String password;
  final bool loged;

  Data({this.username, this.password, this.loged});

  factory Data.fromJson(Map<String, dynamic> json) {
    return Data(
      username: json['username'],
      password: json['password'],
      loged: json['loged'],
    );
  }
}