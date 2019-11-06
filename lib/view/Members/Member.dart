import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:simadu/model/APIProfil.dart';
import 'package:simadu/model/Agenda.dart';
import 'package:simadu/model/KegiatanRKB.dart';
import 'package:simadu/model/ShopAPI.dart';
import 'package:simadu/model/SliderAPI.dart';
import 'package:simadu/view/LandingPage.dart';
import 'package:simadu/view/Members/DaftarSertifikat.dart';
import 'package:simadu/view/Members/EditProfil.dart';
import 'package:simadu/view/Members/KegiatanYangDiikuti.dart';
import 'package:simadu/view/Members/LaporanBulanan.dart';
import 'package:simadu/view/Members/PinjamanDana.dart';
import 'package:simadu/view/Members/Quiz.dart';
import 'package:simadu/view/Members/RequestKelas.dart';
import 'package:simadu/view/Members/StatusMitra.dart';
import 'package:simadu/view/Members/VideoEdukasi.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

class Member extends StatefulWidget {
  Member({Key key, this.namaPemilik, this.namaUsaha, this.idRegister})
      : super(key: key);

  final String namaPemilik;
  final String namaUsaha;
  final String idRegister;
  @override
  _MemberState createState() => _MemberState();
}

class _MemberState extends State<Member> {
  _logout() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool loglogin = false;
    await prefs.setBool('loglogin', loglogin);
  }

  Future<List<APIProfil>> fetchEditProfil() async {
    print(widget.idRegister);
    var responseJson;
    String url = "http://simadu.id/api/api_register_where_id.php";
    final response = await http.post(url, body: {
      "id_register": widget.idRegister,
    });
    if (response.statusCode == 200) {
      responseJson = json.decode(response.body);
      responseJson =
          (responseJson as List).map((p) => APIProfil.fromJson(p)).toList();
    } else {
      responseJson = null;
    }

    return responseJson;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      endDrawer: Drawer(
        child: ListView(
          children: <Widget>[
            ListTile(
              leading: Icon(Icons.assignment),
              title: Text('Laporan Bulanan'),
              trailing: Icon(Icons.keyboard_arrow_right),
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (c) => LaporanBulanan(
                        // id: f['id'],
                        // title: f['title'],
                        // desc: f['desc'],
                        // gambar: f['gambar'],
                        )));
              },
            ),
            ExpansionTile(
              leading: Icon(Icons.school),
              title: Text('My Class'),
              children: <Widget>[
                // ListTile(
                //   title: Text('Jadwal Pelatihan'),
                //   trailing: Icon(Icons.keyboard_arrow_right),
                //   onTap: () {
                //     Navigator.of(context).push(MaterialPageRoute(
                //         builder: (c) => JadwalPelatihan(
                //             // id: f['id'],
                //             // title: f['title'],
                //             // desc: f['desc'],
                //             // gambar: f['gambar'],
                //             )));
                //   },
                // ),
                ListTile(
                  title: Text('Video Edukasi'),
                  trailing: Icon(Icons.keyboard_arrow_right),
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (c) => VideoEdukasi(
                            // id: f['id'],
                            // title: f['title'],
                            // desc: f['desc'],
                            // gambar: f['gambar'],
                            )));
                  },
                ),
                ListTile(
                  title: Text('Quiz'),
                  trailing: Icon(Icons.keyboard_arrow_right),
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (c) => Quiz(
                            // id: f['id'],
                            // title: f['title'],
                            // desc: f['desc'],
                            // gambar: f['gambar'],
                            )));
                  },
                ),
                ListTile(
                  title: Text('Rekues Kelas'),
                  trailing: Icon(Icons.keyboard_arrow_right),
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (c) => RequestKelas(
                            // id: f['id'],
                            // title: f['title'],
                            // desc: f['desc'],
                            // gambar: f['gambar'],
                            )));
                  },
                )
              ],
            ),
            ExpansionTile(
              leading: Icon(Icons.trending_up),
              title: Text('My Performance'),
              children: <Widget>[
                ListTile(
                  title: Text('Partisipasi'),
                  trailing: Text('91%'),
                ),
                ListTile(
                  title: Text('Perkembangan'),
                  trailing: Text('59%'),
                ),
                ListTile(
                  title: Text('Summary'),
                  trailing: Icon(Icons.keyboard_arrow_right),
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (c) => KegiatanYangDiikuti(
                            // id: f['id'],
                            // title: f['title'],
                            // desc: f['desc'],
                            // gambar: f['gambar'],
                            )));
                  },
                ),
              ],
            ),
            ExpansionTile(
              leading: Icon(Icons.book),
              title: Text('My Legal'),
              children: <Widget>[
                ListTile(
                  title: Text('Sertifikat'),
                  trailing: Icon(Icons.keyboard_arrow_right),
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (c) => DaftarSertifikat(
                              namaPemilik: widget.namaPemilik,
                              // id: f['id'],
                              // title: f['title'],
                              // desc: f['desc'],
                              // gambar: f['gambar'],
                            )));
                  },
                ),
                // ListTile(
                //   title: Text('info strategi masuk retail'),
                //   trailing: Icon(Icons.keyboard_arrow_right),
                //   onTap: () {
                //     Navigator.of(context).push(MaterialPageRoute(
                //         builder: (c) => InfoStrategi(
                //             // id: f['id'],
                //             // title: f['title'],
                //             // desc: f['desc'],
                //             // gambar: f['gambar'],
                //             )));
                //   },
                // ),
                // ListTile(
                //   title: Text('info pinjaman dana bank'),
                //   trailing: Icon(Icons.keyboard_arrow_right),
                //   onTap: () {
                //     Navigator.of(context).push(MaterialPageRoute(
                //         builder: (c) => InfoPinjaman(
                //             // id: f['id'],
                //             // title: f['title'],
                //             // desc: f['desc'],
                //             // gambar: f['gambar'],
                //             )));
                //   },
                // ),
                // ListTile(
                //   title: Text('info Status mitra binaan'),
                //   trailing: Icon(Icons.keyboard_arrow_right),
                //   onTap: () {
                //     Navigator.of(context).push(MaterialPageRoute(
                //         builder: (c) => InfoStatus(
                //             // id: f['id'],
                //             // title: f['title'],
                //             // desc: f['desc'],
                //             // gambar: f['gambar'],
                //             )));
                //   },
                // )
              ],
            ),
            ExpansionTile(
              leading: Icon(Icons.pie_chart),
              title: Text('Informasi'),
              children: <Widget>[
                ListTile(
                  title: Text('Pinjaman Dana'),
                  trailing: Icon(Icons.keyboard_arrow_right),
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (c) => PinjamanDana(
                            // id: f['id'],
                            // title: f['title'],
                            // desc: f['desc'],
                            // gambar: f['gambar'],
                            )));
                  },
                ),
                ListTile(
                  title: Text('Status mitra'),
                  trailing: Icon(Icons.keyboard_arrow_right),
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (c) => StatusMitra(
                            // id: f['id'],
                            // title: f['title'],
                            // desc: f['desc'],
                            // gambar: f['gambar'],
                            )));
                  },
                )
              ],
            ),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text('Edit Profil'),
              // trailing: Icon(Icons.lock_open),
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (c) => EditProfil(
                          idRegister: widget.idRegister,
                        )));
              },
            ),
            ListTile(
              leading: Icon(Icons.lock_open),
              title: Text('Log Out'),
              // trailing: Icon(Icons.lock_open),
              onTap: () {
                _logout();
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (c) => LandingPage(
                          selectedIndex: 5,
                        )));
              },
            ),
          ],
        ),
      ),
      appBar: AppBar(
        leading: Text('user'),
      ),
      body: ListView(
        children: <Widget>[
          SizedBox(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: GridView.count(
              // Create a grid with 2 columns. If you change the scrollDirection to
              // horizontal, this produces 2 rows.
              crossAxisCount: 3,
              // Generate 100 widgets that display their index in the List.
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: GestureDetector(
                    onTap: () {
                      print('laporan');
                    },
                    child: Card(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          side: new BorderSide(color: Colors.blue, width: 1.0)),
                      margin: EdgeInsets.only(top: 25, left: 15, right: 15),
                      elevation: 9,
                      borderOnForeground: true,
                      child: Column(
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Icon(
                              Icons.assignment,
                              size: 45,
                              color: Colors.blue,
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Container(
                            // color: Colors.blue,
                            width: MediaQuery.of(context).size.width,
                            height: 25,
                            decoration: BoxDecoration(
                              color: Colors.blue,
                              shape: BoxShape.rectangle,
                              borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(8.0),
                                bottomRight: Radius.circular(8.0),
                              ),
                            ),
                            child: Center(
                                child: Text(
                              'Laporan Bulanan',
                              style:
                                  TextStyle(fontSize: 11, color: Colors.white),
                            )),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: GestureDetector(
                    onTap: () {
                      print('vid edukasi');
                    },
                    child: Card(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          side: new BorderSide(color: Colors.blue, width: 1.0)),
                      margin: EdgeInsets.only(top: 25, left: 15, right: 15),
                      elevation: 9,
                      child: Column(
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Icon(
                              Icons.videocam,
                              size: 45,
                              color: Colors.blue,
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Container(
                            // color: Colors.blue,
                            width: MediaQuery.of(context).size.width,
                            height: 25,
                            decoration: BoxDecoration(
                              color: Colors.blue,
                              shape: BoxShape.rectangle,
                              borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(8.0),
                                bottomRight: Radius.circular(8.0),
                              ),
                            ),
                            child: Center(
                                child: Text(
                              'Video Edukasi',
                              style:
                                  TextStyle(fontSize: 11, color: Colors.white),
                            )),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: GestureDetector(
                    onTap: () {
                      print('quiz');
                    },
                    child: Card(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          side: new BorderSide(color: Colors.blue, width: 1.0)),
                      margin: EdgeInsets.only(top: 25, left: 15, right: 15),
                      elevation: 9,
                      child: Column(
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Icon(
                              Icons.question_answer,
                              size: 45,
                              color: Colors.blue,
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Container(
                            // color: Colors.blue,
                            width: MediaQuery.of(context).size.width,
                            height: 25,
                            decoration: BoxDecoration(
                              color: Colors.blue,
                              shape: BoxShape.rectangle,
                              borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(8.0),
                                bottomRight: Radius.circular(8.0),
                              ),
                            ),
                            child: Center(
                                child: Text(
                              'Quiz',
                              style:
                                  TextStyle(fontSize: 11, color: Colors.white),
                            )),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: GestureDetector(
                    onTap: () {
                      print('rekues kelas');
                    },
                    child: Card(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          side: new BorderSide(color: Colors.blue, width: 1.0)),
                      margin: EdgeInsets.only(top: 25, left: 15, right: 15),
                      elevation: 9,
                      child: Column(
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Icon(
                              Icons.school,
                              size: 45,
                              color: Colors.blue,
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Container(
                            // color: Colors.blue,
                            width: MediaQuery.of(context).size.width,
                            height: 25,
                            decoration: BoxDecoration(
                              color: Colors.blue,
                              shape: BoxShape.rectangle,
                              borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(8.0),
                                bottomRight: Radius.circular(8.0),
                              ),
                            ),
                            child: Center(
                                child: Text(
                              'Rekues Kelas',
                              style:
                                  TextStyle(fontSize: 11, color: Colors.white),
                            )),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: GestureDetector(
                    onTap: () {
                      print('sertifikat');
                    },
                    child: Card(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          side: new BorderSide(color: Colors.blue, width: 1.0)),
                      margin: EdgeInsets.only(top: 25, left: 15, right: 15),
                      elevation: 9,
                      child: Column(
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Icon(
                              Icons.book,
                              size: 45,
                              color: Colors.blue,
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Container(
                            // color: Colors.blue,
                            width: MediaQuery.of(context).size.width,
                            height: 25,
                            decoration: BoxDecoration(
                              color: Colors.blue,
                              shape: BoxShape.rectangle,
                              borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(8.0),
                                bottomRight: Radius.circular(8.0),
                              ),
                            ),
                            child: Center(
                                child: Text(
                              'Sertifikat',
                              style:
                                  TextStyle(fontSize: 11, color: Colors.white),
                            )),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: GestureDetector(
                    onTap: () {
                      print('pinjaman dana');
                    },
                    child: Card(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          side: new BorderSide(color: Colors.blue, width: 1.0)),
                      margin: EdgeInsets.only(top: 25, left: 15, right: 15),
                      elevation: 9,
                      child: Column(
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Icon(
                              Icons.attach_money,
                              size: 45,
                              color: Colors.blue,
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Container(
                            // color: Colors.blue,
                            width: MediaQuery.of(context).size.width,
                            height: 25,
                            decoration: BoxDecoration(
                              color: Colors.blue,
                              shape: BoxShape.rectangle,
                              borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(8.0),
                                bottomRight: Radius.circular(8.0),
                              ),
                            ),
                            child: Center(
                                child: Text(
                              'Pinjaman Dana',
                              style:
                                  TextStyle(fontSize: 11, color: Colors.white),
                            )),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: GestureDetector(
                    onTap: () {
                      print('mitra');
                    },
                    child: Card(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          side: new BorderSide(color: Colors.blue, width: 1.0)),
                      margin: EdgeInsets.only(top: 25, left: 15, right: 15),
                      elevation: 9,
                      child: Column(
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Icon(
                              Icons.group,
                              size: 45,
                              color: Colors.blue,
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Container(
                            // color: Colors.blue,
                            width: MediaQuery.of(context).size.width,
                            height: 25,
                            decoration: BoxDecoration(
                              color: Colors.blue,
                              shape: BoxShape.rectangle,
                              borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(8.0),
                                bottomRight: Radius.circular(8.0),
                              ),
                            ),
                            child: Center(
                                child: Text(
                              'Status Mitra',
                              style:
                                  TextStyle(fontSize: 11, color: Colors.white),
                            )),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
