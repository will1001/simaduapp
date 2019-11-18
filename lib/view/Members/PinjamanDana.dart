import 'package:flutter/material.dart';
import 'package:simadu/model/PinjamanDanaAPI.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

class PinjamanDana extends StatefulWidget {
  PinjamanDana({Key key, this.idRegister}) : super(key: key);

  final String idRegister;
  @override
  _PinjamanDanaState createState() => _PinjamanDanaState();
}

class _PinjamanDanaState extends State<PinjamanDana> {
  int no = 1;
  String msg = '';
  Color warnapesan;
  String _judul;

  Future daftarpinjamandana() async {
    var responseJson;
    String url = "http://simadu.id/api/pinjaman_dana_api.php";
    final response = await http.post(url, body: {
      "id_register": widget.idRegister,
      "judul": _judul,
    });
    responseJson = json.decode(response.body);
    if (responseJson.length == 0) {
      setState(() {
        msg = "Maaf Laporan Gagal di Simpan";
        warnapesan = Colors.red;
      });
    } else {
      //  if(responseJson[0]['username'])
      // Navigator.of(context).push(MaterialPageRoute(
      //     builder: (c) => LandingPage(
      //           selectedIndex: 5,
      //         )));
      setState(() {
        msg = responseJson['msg'];
        warnapesan = Colors.green;
      });

      showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text('Berhasil'),
              content: Text(
                msg,
                style: TextStyle(color: Colors.green),
              ),
            );
          });

      Future.delayed(
        Duration(seconds: 3),
        () {
          Navigator.pop(context);
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Pinjaman Dana',
          style: TextStyle(fontSize: 16.0),
        ),
      ),
      body: FutureBuilder<List<PinjamanDanaAPI>>(
          future: fetchPinjamanDanaAPI(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ListView(
                  children: snapshot.data.map((f) {
                return Column(
                  children: <Widget>[
                    ListTile(
                      leading: Text((no++).toString() + '.'),
                      title: Text(f.judul),
                      trailing: RaisedButton(
                        onPressed: () async {
                          setState(() {
                            _judul = f.judul;
                          });
                          daftarpinjamandana();
                        },
                        child: Text('Daftar'),
                        textColor: Colors.white,
                        color: Colors.lightBlue,
                      ),
                      onTap: () async {
                        // setState(() {
                        //   _judul = f.judul;
                        // });
                        // daftarpinjamandana();
                        // showDialog(
                        //     context: context,
                        //     builder: (BuildContext context) {
                        //       return AlertDialog(
                        //         title: Text('Berhasil'),
                        //         content: Text(
                        //           msg,
                        //           style: TextStyle(color: Colors.green),
                        //         ),
                        //       );
                        //     });

                        // Navigator.pop(context);
                      },
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        color: Colors.black,
                        height: 1,
                      ),
                    )
                  ],
                );
              }).toList());
            }
            return CircularProgressIndicator();
          }),
    );
  }
}
