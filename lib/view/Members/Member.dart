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
import 'package:simadu/view/Members/Gallery.dart';
import 'package:simadu/view/Members/InformasiMenu.dart';
import 'package:simadu/view/Members/KegiatanYangDiikuti.dart';
import 'package:simadu/view/Members/LaporanBulanan.dart';
import 'package:simadu/view/Members/MyLegal.dart';
import 'package:simadu/view/Members/MyPerformance.dart';
import 'package:simadu/view/Members/Myclass.dart';
import 'package:simadu/view/Members/PinjamanDana.dart';
import 'package:simadu/view/Members/Quiz.dart';
import 'package:simadu/view/Members/RequestKelas.dart';
import 'package:simadu/view/Members/StatusMitra.dart';
import 'package:simadu/view/Members/Summary.dart';
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
            // ListTile(
            //   leading: Icon(Icons.assignment),
            //   title: Text('Laporan Bulanan'),
            //   trailing: Icon(Icons.keyboard_arrow_right),
            //   onTap: () {
            //     Navigator.of(context).push(MaterialPageRoute(
            //         builder: (c) => LaporanBulanan(
            //             // id: f['id'],
            //             // title: f['title'],
            //             // desc: f['desc'],
            //             // gambar: f['gambar'],
            //             )));
            //   },
            // ),
            // ExpansionTile(
            //   leading: Icon(Icons.school),
            //   title: Text('My Class'),
            //   children: <Widget>[
            //     // ListTile(
            //     //   title: Text('Jadwal Pelatihan'),
            //     //   trailing: Icon(Icons.keyboard_arrow_right),
            //     //   onTap: () {
            //     //     Navigator.of(context).push(MaterialPageRoute(
            //     //         builder: (c) => JadwalPelatihan(
            //     //             // id: f['id'],
            //     //             // title: f['title'],
            //     //             // desc: f['desc'],
            //     //             // gambar: f['gambar'],
            //     //             )));
            //     //   },
            //     // ),
            //     ListTile(
            //       title: Text('Video Edukasi'),
            //       trailing: Icon(Icons.keyboard_arrow_right),
            //       onTap: () {
            //         Navigator.of(context).push(MaterialPageRoute(
            //             builder: (c) => VideoEdukasi(
            //                 // id: f['id'],
            //                 // title: f['title'],
            //                 // desc: f['desc'],
            //                 // gambar: f['gambar'],
            //                 )));
            //       },
            //     ),
            //     ListTile(
            //       title: Text('Quiz'),
            //       trailing: Icon(Icons.keyboard_arrow_right),
            //       onTap: () {
            //         Navigator.of(context).push(MaterialPageRoute(
            //             builder: (c) => Quiz(
            //                 // id: f['id'],
            //                 // title: f['title'],
            //                 // desc: f['desc'],
            //                 // gambar: f['gambar'],
            //                 )));
            //       },
            //     ),
            //     ListTile(
            //       title: Text('Rekues Kelas'),
            //       trailing: Icon(Icons.keyboard_arrow_right),
            //       onTap: () {
            //         Navigator.of(context).push(MaterialPageRoute(
            //             builder: (c) => RequestKelas(
            //                 // id: f['id'],
            //                 // title: f['title'],
            //                 // desc: f['desc'],
            //                 // gambar: f['gambar'],
            //                 )));
            //       },
            //     )
            //   ],
            // ),
            // ExpansionTile(
            //   leading: Icon(Icons.trending_up),
            //   title: Text('My Performance'),
            //   children: <Widget>[
            //     ListTile(
            //       title: Text('Partisipasi'),
            //       trailing: Text('91%'),
            //     ),
            //     ListTile(
            //       title: Text('Perkembangan'),
            //       trailing: Text('59%'),
            //     ),
            //     ListTile(
            //       title: Text('Summary'),
            //       trailing: Icon(Icons.keyboard_arrow_right),
            //       onTap: () {
            //         Navigator.of(context).push(MaterialPageRoute(
            //             builder: (c) => KegiatanYangDiikuti(
            //                 // id: f['id'],
            //                 // title: f['title'],
            //                 // desc: f['desc'],
            //                 // gambar: f['gambar'],
            //                 )));
            //       },
            //     ),
            //   ],
            // ),
            // ExpansionTile(
            //   leading: Icon(Icons.book),
            //   title: Text('My Legal'),
            //   children: <Widget>[
            //     ListTile(
            //       title: Text('Sertifikat'),
            //       trailing: Icon(Icons.keyboard_arrow_right),
            //       onTap: () {
            //         Navigator.of(context).push(MaterialPageRoute(
            //             builder: (c) => DaftarSertifikat(
            //                   namaPemilik: widget.namaPemilik,
            //                   // id: f['id'],
            //                   // title: f['title'],
            //                   // desc: f['desc'],
            //                   // gambar: f['gambar'],
            //                 )));
            //       },
            //     ),
            //     // ListTile(
            //     //   title: Text('info strategi masuk retail'),
            //     //   trailing: Icon(Icons.keyboard_arrow_right),
            //     //   onTap: () {
            //     //     Navigator.of(context).push(MaterialPageRoute(
            //     //         builder: (c) => InfoStrategi(
            //     //             // id: f['id'],
            //     //             // title: f['title'],
            //     //             // desc: f['desc'],
            //     //             // gambar: f['gambar'],
            //     //             )));
            //     //   },
            //     // ),
            //     // ListTile(
            //     //   title: Text('info pinjaman dana bank'),
            //     //   trailing: Icon(Icons.keyboard_arrow_right),
            //     //   onTap: () {
            //     //     Navigator.of(context).push(MaterialPageRoute(
            //     //         builder: (c) => InfoPinjaman(
            //     //             // id: f['id'],
            //     //             // title: f['title'],
            //     //             // desc: f['desc'],
            //     //             // gambar: f['gambar'],
            //     //             )));
            //     //   },
            //     // ),
            //     // ListTile(
            //     //   title: Text('info Status mitra binaan'),
            //     //   trailing: Icon(Icons.keyboard_arrow_right),
            //     //   onTap: () {
            //     //     Navigator.of(context).push(MaterialPageRoute(
            //     //         builder: (c) => InfoStatus(
            //     //             // id: f['id'],
            //     //             // title: f['title'],
            //     //             // desc: f['desc'],
            //     //             // gambar: f['gambar'],
            //     //             )));
            //     //   },
            //     // )
            //   ],
            // ),
            // ExpansionTile(
            //   leading: Icon(Icons.pie_chart),
            //   title: Text('Informasi'),
            //   children: <Widget>[
            //     ListTile(
            //       title: Text('Pinjaman Dana'),
            //       trailing: Icon(Icons.keyboard_arrow_right),
            //       onTap: () {
            //         Navigator.of(context).push(MaterialPageRoute(
            //             builder: (c) => PinjamanDana(
            //                 // id: f['id'],
            //                 // title: f['title'],
            //                 // desc: f['desc'],
            //                 // gambar: f['gambar'],
            //                 )));
            //       },
            //     ),
            //     ListTile(
            //       title: Text('Status mitra'),
            //       trailing: Icon(Icons.keyboard_arrow_right),
            //       onTap: () {
            //         Navigator.of(context).push(MaterialPageRoute(
            //             builder: (c) => StatusMitra(
            //                 // id: f['id'],
            //                 // title: f['title'],
            //                 // desc: f['desc'],
            //                 // gambar: f['gambar'],
            //                 )));
            //       },
            //     )
            //   ],
            // ),
            ListTile(
              leading: Icon(Icons.person),
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
        leading: Padding(
          padding: const EdgeInsets.only(left: 20.0, top: 19.0, bottom: 4.0),
          child: Text(
            'RKB',
            style: TextStyle(
                fontWeight: FontWeight.bold, fontSize: 17, color: Colors.white),
          ),
        ),
        title: Padding(
          padding: const EdgeInsets.only(right: 12),
          child: Text(
            '-    LOMBOK BARAT',
            style: TextStyle(fontSize: 17, color: Colors.white),
          ),
        ),
      ),
      body: ListView(
        children: <Widget>[
          SizedBox(
            width: MediaQuery.of(context).size.width,
            height: 250,
            child: GridView.count(
              crossAxisCount: 3,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (c) => LaporanBulanan(
                                idRegister: widget.idRegister,
                                // namaPemilik: widget.namaPemilik,
                                // id: f['id'],
                                // title: f['title'],
                                // desc: f['desc'],
                                // gambar: f['gambar'],
                              )));
                    },
                    child: Card(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          side: new BorderSide(
                              color: Colors.lightBlue, width: 1.0)),
                      margin: EdgeInsets.only(top: 15, left: 10, right: 10),
                      elevation: 9,
                      child: Column(
                        children: <Widget>[
                          Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Image.asset(
                                'assets/images/037-document.png',
                                width: 55,
                              )),
                          SizedBox(
                            height: 0,
                          ),
                          Container(
                            // color: Colors.lightBlue,
                            width: MediaQuery.of(context).size.width,
                            height: 18,
                            decoration: BoxDecoration(
                              color: Colors.lightBlue,
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
                                  TextStyle(fontSize: 10, color: Colors.white),
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
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (c) => Myclass(idRegister: widget.idRegister
                              // id: f['id'],
                              // title: f['title'],
                              // desc: f['desc'],
                              // gambar: f['gambar'],
                              )));
                    },
                    child: Card(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          side: new BorderSide(
                              color: Colors.lightBlue, width: 1.0)),
                      margin: EdgeInsets.only(top: 15, left: 10, right: 10),
                      elevation: 9,
                      borderOnForeground: true,
                      child: Column(
                        children: <Widget>[
                          Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Image.asset(
                                'assets/images/iconfinder_Education_3069198.png',
                                width: 55,
                              )),
                          SizedBox(
                            height: 0,
                          ),
                          Container(
                            // color: Colors.lightBlue,
                            width: MediaQuery.of(context).size.width,
                            height: 18,
                            decoration: BoxDecoration(
                              color: Colors.lightBlue,
                              shape: BoxShape.rectangle,
                              borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(8.0),
                                bottomRight: Radius.circular(8.0),
                              ),
                            ),
                            child: Center(
                                child: Text(
                              'Kelas',
                              style:
                                  TextStyle(fontSize: 10, color: Colors.white),
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
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (c) => MyPerformance(
                                idRegister: widget.idRegister,
                                // id: f['id'],
                                // title: f['title'],
                                // desc: f['desc'],
                                // gambar: f['gambar'],
                              )));
                    },
                    child: Card(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          side: new BorderSide(
                              color: Colors.lightBlue, width: 1.0)),
                      margin: EdgeInsets.only(top: 15, left: 10, right: 10),
                      elevation: 9,
                      child: Column(
                        children: <Widget>[
                          Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Image.asset(
                                'assets/images/049-presentation.png',
                                width: 55,
                              )),
                          SizedBox(
                            height: 0,
                          ),
                          Container(
                            // color: Colors.lightBlue,
                            width: MediaQuery.of(context).size.width,
                            height: 18,
                            decoration: BoxDecoration(
                              color: Colors.lightBlue,
                              shape: BoxShape.rectangle,
                              borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(8.0),
                                bottomRight: Radius.circular(8.0),
                              ),
                            ),
                            child: Center(
                                child: Text(
                              'Performa',
                              style:
                                  TextStyle(fontSize: 10, color: Colors.white),
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
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (c) => MyLegal(
                                idRegister: widget.idRegister,
                                // id: f['id'],
                                // title: f['title'],
                                // desc: f['desc'],
                                // gambar: f['gambar'],
                              )));
                    },
                    child: Card(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          side: new BorderSide(
                              color: Colors.lightBlue, width: 1.0)),
                      margin: EdgeInsets.only(top: 15, left: 10, right: 10),
                      elevation: 9,
                      child: Column(
                        children: <Widget>[
                          Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Image.asset(
                                'assets/images/031-certificate.png',
                                width: 55,
                              )),
                          SizedBox(
                            height: 0,
                          ),
                          Container(
                            // color: Colors.lightBlue,
                            width: MediaQuery.of(context).size.width,
                            height: 18,
                            decoration: BoxDecoration(
                              color: Colors.lightBlue,
                              shape: BoxShape.rectangle,
                              borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(8.0),
                                bottomRight: Radius.circular(8.0),
                              ),
                            ),
                            child: Center(
                                child: Text(
                              'Legalitas',
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
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (c) => InformasiMenu(
                                idRegister: widget.idRegister,
                                // id: f['id'],
                                // title: f['title'],
                                // desc: f['desc'],
                                // gambar: f['gambar'],
                              )));
                    },
                    child: Card(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          side: new BorderSide(
                              color: Colors.lightBlue, width: 1.0)),
                      margin: EdgeInsets.only(top: 15, left: 10, right: 10),
                      elevation: 9,
                      child: Column(
                        children: <Widget>[
                          Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Image.asset(
                                'assets/images/026-analysis.png',
                                width: 55,
                              )),
                          SizedBox(
                            height: 0,
                          ),
                          Container(
                            // color: Colors.lightBlue,
                            width: MediaQuery.of(context).size.width,
                            height: 18,
                            decoration: BoxDecoration(
                              color: Colors.lightBlue,
                              shape: BoxShape.rectangle,
                              borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(8.0),
                                bottomRight: Radius.circular(8.0),
                              ),
                            ),
                            child: Center(
                                child: Text(
                              'Informasi',
                              style:
                                  TextStyle(fontSize: 11, color: Colors.white),
                            )),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                // Padding(
                //   padding: const EdgeInsets.all(8.0),
                //   child: GestureDetector(
                //     onTap: () {
                //        Navigator.of(context).push(MaterialPageRoute(
                //         builder: (c) => Gallery(
                //               // namaPemilik: widget.namaPemilik,
                //               // id: f['id'],
                //               // title: f['title'],
                //               // desc: f['desc'],
                //               // gambar: f['gambar'],
                //             )));
                //     },
                //     child: Card(
                //       shape: RoundedRectangleBorder(
                //           borderRadius: BorderRadius.circular(10.0),
                //           side: new BorderSide(color: Colors.lightBlue, width: 1.0)),
                //       margin: EdgeInsets.only(top: 15, left: 10, right: 10),
                //       elevation: 9,
                //       child: Column(
                //         children: <Widget>[
                //           Padding(
                //             padding: const EdgeInsets.all(8.0),
                //             child: Image.asset('assets/images/gallery.png',width: 55,)
                //           ),
                //           SizedBox(
                //             height: 0,
                //           ),
                //           Container(
                //             // color: Colors.lightBlue,
                //             width: MediaQuery.of(context).size.width,
                //             height: 18,
                //             decoration: BoxDecoration(
                //               color: Colors.lightBlue,
                //               shape: BoxShape.rectangle,
                //               borderRadius: BorderRadius.only(
                //                 bottomLeft: Radius.circular(8.0),
                //                 bottomRight: Radius.circular(8.0),
                //               ),
                //             ),
                //             child: Center(
                //                 child: Text(
                //               'Galeri',
                //               style:
                //                   TextStyle(fontSize: 11, color: Colors.white),
                //             )),
                //           )
                //         ],
                //       ),
                //     ),
                //   ),
                // ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top:91.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Card(
                                elevation: 9,
                  child: Image.asset(
                    'assets/images/logo.png',
                    width: 50,
                    height: 50,
                  ),
                ),
               Card(
                                elevation: 9,
                  child: Image.asset(
                    'assets/images/BUMN.jpeg',
                    width: 50,
                    height: 50,
                  ),
                ),
                Card(
                                elevation: 9,
                  child: Image.asset(
                    'assets/images/PLN.jpg',
                    width: 50,
                    height: 50,
                  ),
                ),
                Card(
                                elevation: 9,
                  child: Image.asset(
                    'assets/images/YBP.jpg',
                    width: 50,
                    height: 50,
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
