import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:simadu/view/Members/DaftarPinjaman.dart';

import '../LandingPage.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

class DetailPinjamanDana extends StatefulWidget {
  DetailPinjamanDana(
      {Key key, this.id, this.title, this.desc, this.gambar, this.idRegister})
      : super(key: key);

  final String id;
  final String title;
  final String desc;
  final String gambar;
  final String idRegister;

  @override
  _DetailPinjamanDanaState createState() => _DetailPinjamanDanaState();
}

class _DetailPinjamanDanaState extends State<DetailPinjamanDana> {
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
    timeDilation = 3.0;
    return Scaffold(
        appBar: AppBar(
        
      ),
      body: ListView(
        children: <Widget>[
          Card(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(left: 19.0, right: 19),
                  child: Text(
                    widget.title,
                    style: TextStyle(fontWeight: FontWeight.w400, fontSize: 21),
                  ),
                ),
                // Row(
                //     children: <Widget>[

                //       Padding(
                //         padding: const EdgeInsets.only(right :5.0,left: 5.0),
                //         child: Icon(Icons.calendar_today,color: Colors.lightBlue,size: 15,),
                //       ),
                //       Text(widget.tanggal.toString())
                //     ],
                //   ),
                Padding(
                  padding: const EdgeInsets.only(left: 19.0, right: 19),
                  child: Container(
                    height: 200,
                    color: Colors.white,
                    child: Hero(
                        tag: widget.id,
                        child: Material(
                          child: InkWell(
                            child: Image.network(widget.gambar),
                          ),
                        )),
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.only(left: 19.0, right: 19),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        widget.desc,
                        style: TextStyle(color: Colors.grey),
                      ),
                    ],
                  ),
                ),
                Column(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(left: 19.0),
                      child: RaisedButton(
                        child: Text('Daftar Sekarang'),
                        textColor: Colors.white,
                        color: Colors.lightBlue,
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (c) => DaftarPinjaman(
                                    idRegister: widget.idRegister,
                                    // id: f.id_pinjaman,
                                    title: widget.title,
                                    // desc: f.pesan,
                                    // // tanggal: f.tanggal,
                                    // gambar:
                                    //     'http://simadu.id/images/pinjaman/' +
                                    //         f.img,
                                  )));
                        },
                      ),
                    )
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
