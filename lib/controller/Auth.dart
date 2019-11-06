import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:simadu/view/Members/Member.dart';
import 'package:simadu/view/Visitor/Users.dart';

class Auth extends StatefulWidget {
   Auth({Key key, this.namaPemilik,this.namaUsaha,this.idRegister}) : super(key: key);

  final String namaPemilik;
  final String namaUsaha;
  final String idRegister;
  @override
  _AuthState createState() => _AuthState();
}

class _AuthState extends State<Auth> {
  String namaPemilikcache;
  String namaUsahacache;
  String idRegistercache;
  _datacache() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool loglogin = (prefs.getBool('loglogin') ?? false);
    namaPemilikcache = (prefs.getString('namaPemilikcache') ?? widget.namaPemilik);
    namaUsahacache = (prefs.getString('namaUsahacache') ?? widget.namaUsaha);
    idRegistercache = (prefs.getString('idRegistercache') ?? widget.idRegister);
    await prefs.setBool('loglogin', loglogin);
    await prefs.setString('namaPemilikcache', namaPemilikcache);
    await prefs.setString('namaUsahacache', namaUsahacache);
    await prefs.setString('idRegistercache', idRegistercache);
    return ('$loglogin');
  }

  @override
  void initState() {
    super.initState();
    _datacache();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: _datacache(),
        builder: (context, snapshot) {

          if (snapshot.data == 'true') {
            return Member(
              namaPemilik:widget.namaPemilik==null?namaPemilikcache:widget.namaPemilik,
              namaUsaha:widget.namaUsaha==null?namaUsahacache:widget.namaUsaha,
              idRegister:widget.idRegister==null?idRegistercache:widget.idRegister,
            );
          } if (snapshot.data == 'false') {
            return Users();
          }

          return CircularProgressIndicator();
        },
      ),
    );
  }
}
