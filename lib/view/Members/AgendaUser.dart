import 'package:flutter/material.dart';
import 'package:simadu/model/Agenda.dart';
import 'package:simadu/model/Agenda.dart' as prefix0;
import 'package:simadu/view/Members/DetailAgendaUser.dart';
import 'package:simadu/view/Visitor/DetailGaleri.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

import '../LandingPage.dart';

class AgendaUser extends StatefulWidget {
  AgendaUser({Key key, this.idRegister}) : super(key: key);

  final String idRegister;
  @override
  _AgendaUserState createState() => _AgendaUserState();
}

class _AgendaUserState extends State<AgendaUser> {
  int no = 1;
  int start = 0;
  int finish = 8;
  String _judul;
  String msg = '';
  Color warnapesan;

  Future daftaragenda() async {
    var responseJson;
    String url = "http://simadu.id/api/daftar_agenda_api.php";
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

  void loadMore(var originalItems) async {
    setState(() {
      if (finish >= originalItems.length) {
        start = start;
        finish = originalItems.length;
      } else {
        start = start;
        finish = finish + 8;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Agenda',
          style: TextStyle(fontSize: 16.0),
        ),
      ),
      body: FutureBuilder<List<Agenda>>(
          future: fetchAgenda(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ListView(
                children: snapshot.data
                    .map((f) {
                      return Padding(
                          padding: const EdgeInsets.all(1.0),
                          child: Hero(
                            tag: f.id_agenda,
                            child: Material(
                              child: InkWell(
                                onTap: () {
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (c) => DetailAgendaUser(
                                            idRegister: widget.idRegister,
                                            id: f.id_agenda,
                                            title: f.judul,
                                            desc: f.agenda,
                                            tanggal: f.tanggal,
                                            gambar:
                                                'http://simadu.id/images/agenda/' +
                                                    f.img,
                                          )));
                                },
                                child: Padding(
                                  padding: const EdgeInsets.all(0.0),
                                  child: Center(
                                    child: Card(
                                      elevation: 9,
                                      child: Padding(
                                        padding: const EdgeInsets.only(
                                            top: 8.0, bottom: 8),
                                        child: Row(
                                          children: <Widget>[
                                            Container(
                                              // width: 145,
                                              height: 100,
                                              child: Image.network(
                                                  'http://simadu.id/images/agenda/' +
                                                      f.img),
                                            ),
                                            Expanded(
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.all(8.0),
                                                child: Container(
                                                  height: 110,
                                                  child: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: <Widget>[
                                                      Text(f.judul),
                                                      Text(
                                                        f.agenda.substring(
                                                                0, 70) +
                                                            '. . .',
                                                        style: TextStyle(
                                                            color: Colors.grey,
                                                            fontSize: 12),
                                                      ),
                                                      Column(
                                                        children: <Widget>[
                                                          RaisedButton(
                                                            child:
                                                                Text('Detail'),
                                                            textColor:
                                                                Colors.black,
                                                            color: Colors
                                                                .lightBlue,
                                                            onPressed: () {
                                                              // setState(() {
                                                              //   _judul =
                                                              //       f.judul;
                                                              // });
                                                              // daftaragenda();
                                                              Navigator.of(context).push(
                                                                  MaterialPageRoute(
                                                                      builder: (c) =>
                                                                          DetailAgendaUser(
                                                                            idRegister:
                                                                                widget.idRegister,
                                                                            id: f.id_agenda,
                                                                            title:
                                                                                f.judul,
                                                                            desc:
                                                                                f.agenda,
                                                                            tanggal:
                                                                                f.tanggal,
                                                                            gambar:
                                                                                'http://simadu.id/images/agenda/' + f.img,
                                                                          )));
                                                            },
                                                          ),
                                                        ],
                                                      )
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ));
                    })
                    .cast<Widget>()
                    .toList()
                    .getRange(
                        start,
                        snapshot.data.length != 0
                            ? (snapshot.data.length < finish
                                ? snapshot.data.length
                                : start + finish)
                            : 0)
                    .toList(),
              );
            }
            return CircularProgressIndicator();
          }),
    );
  }
}
