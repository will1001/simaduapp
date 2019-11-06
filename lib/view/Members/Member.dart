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
   Member({Key key, this.namaPemilik,this.namaUsaha,this.idRegister}) : super(key: key);

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
      drawer: Drawer(
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
                  title: Text(
                      'Sertifikat'),
                  trailing: Icon(Icons.keyboard_arrow_right),
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (c) => DaftarSertifikat(
                            namaPemilik:widget.namaPemilik,
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
      appBar: AppBar(),
      body: ListView(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: FutureBuilder<List<APIProfil>>(
              future: fetchEditProfil(),
              builder: (context,snapshot){
                if(snapshot.hasData){
                  return Card(
              semanticContainer: true,
              clipBehavior: Clip.antiAliasWithSaveLayer,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              elevation: 9,
              margin: EdgeInsets.all(10),
              child: Stack(
                children: <Widget>[
                  Image.network(
                    'https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcRseNNjsbmeUto_yfs6tzbsexF__8H1n6w6w3ICd-0LStJ81c6v',
                    fit: BoxFit.fill,
                  ),
                  Container(
                    height: 170,
                    color: Colors.black38,
                  ),
                  Center(
                    child: Column(
                      children: <Widget>[
                        Container(
                          child: Container(
                              margin: EdgeInsets.all(5),
                              width: 100.0,
                              height: 90.0,
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  image: DecorationImage(
                                      fit: BoxFit.fill,
                                      image: NetworkImage(
                                          "https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcTIihs7JByHn1IfB6lMXE6-aQOUkkD4UzIIEGzReTuLPguIcHx1")))),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Text(snapshot.data[0].nama_pemilik,
                                  style: TextStyle(color: Colors.white)),
                              Opacity(opacity: 0, child: Text('Iv')),
                              Container(
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                        width: 1.0,
                                        color: const Color(0xFFFFFFFF)),
                                  ),
                                  child: GestureDetector(
                                    child: Icon(
                                      Icons.mode_edit,
                                      color: Colors.white,
                                      size: 17,
                                    ),
                                    onTap: () {
                                      Navigator.of(context)
                                          .push(MaterialPageRoute(
                                              builder: (c) => EditProfil(
                                                  idRegister:widget.idRegister,
                                                  )));
                                    },
                                  ))
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Text(snapshot.data[0].nama_usaha,
                                  style: TextStyle(color: Colors.white)),
                              Opacity(opacity: 0, child: Text('Iv')),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
                }
                return CircularProgressIndicator();
              },
            ),
          ),
          FutureBuilder<List<SliderAPI>>(
              future: fetchSliderAPI(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return CarouselSlider(
                    autoPlay: true,
                    autoPlayInterval: Duration(seconds: 3),
                    autoPlayAnimationDuration: Duration(milliseconds: 800),
                    autoPlayCurve: Curves.fastOutSlowIn,
                    height: 200.0,
                    items: snapshot.data
                        .map((f) {
                          return Builder(
                            builder: (BuildContext context) {
                              return Padding(
                                padding: const EdgeInsets.all(12.0),
                                child: Stack(
                                  children: <Widget>[
                                    Image.network(
                                      'http://simadu.id/images/slider/' + f.img,
                                      fit: BoxFit.cover,
                                      width: 300,
                                      height: 200,
                                    ),
                                    Column(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: <Widget>[
                                        // Container(
                                        //   width: 300,
                                        //   color: Colors.black38,
                                        //   child: Column(
                                        //     mainAxisAlignment:
                                        //         MainAxisAlignment.end,
                                        //     children: <Widget>[
                                        //       Padding(
                                        //         padding:
                                        //             const EdgeInsets.all(8.0),
                                        //         child: Text(
                                        //           f.kalimat3,
                                        //           style: TextStyle(
                                        //               color: Colors.white),
                                        //         ),
                                        //       ),
                                        //     ],
                                        //   ),
                                        // )
                                      ],
                                    )
                                  ],
                                ),
                              );
                            },
                          );
                        })
                        .cast<Widget>()
                        .toList(),
                  );
                }
                return CircularProgressIndicator();
              }),
          FutureBuilder<List<Agenda>>(
              future: fetchAgenda(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return Card(
                    elevation: 9,
                    child: Column(
                      children: <Widget>[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                'Agenda',
                                style: TextStyle(
                                    fontWeight: FontWeight.w500, fontSize: 17),
                              ),
                            )
                          ],
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width,
                          height: 200,
                          child: ListView(
                            scrollDirection: Axis.horizontal,
                            children: snapshot.data
                                .map((f) {
                                  return Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Stack(
                                      children: <Widget>[
                                        Image.network(
                                          'http://simadu.id/images/agenda/' +
                                              f.img,
                                          width: 200,
                                          height: 200,
                                          fit: BoxFit.cover,
                                        ),
                                        Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.end,
                                          children: <Widget>[
                                            Container(
                                                width: 200,
                                                color: Colors.black38,
                                                child: Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.end,
                                                  children: <Widget>[
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.all(
                                                              8.0),
                                                      child: Text(
                                                        f.judul,
                                                        style: TextStyle(
                                                            color:
                                                                Colors.white),
                                                      ),
                                                    ),
                                                  ],
                                                )),
                                          ],
                                        ),
                                      ],
                                    ),
                                  );
                                })
                                .cast<Widget>()
                                .toList(),
                          ),
                        )
                      ],
                    ),
                  );
                }
                return CircularProgressIndicator();
              }),
          FutureBuilder<List<KegiatanRKB>>(
              future: fetchKegiatanRKB(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return Card(
                    elevation: 9,
                    child: Column(
                      children: <Widget>[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                'Kegiatan RKB',
                                style: TextStyle(
                                    fontWeight: FontWeight.w500, fontSize: 17),
                              ),
                            )
                          ],
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width,
                          height: 200,
                          child: ListView(
                            scrollDirection: Axis.horizontal,
                            children: snapshot.data
                                .map((f) {
                                  return Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Stack(
                                      children: <Widget>[
                                        Image.network(
                                          'http://simadu.id/images/kegiatan/' +
                                              f.img,
                                          width: 200,
                                          height: 200,
                                          fit: BoxFit.cover,
                                        ),
                                        Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.end,
                                          children: <Widget>[
                                            Container(
                                                width: 200,
                                                color: Colors.black38,
                                                child: Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.end,
                                                  children: <Widget>[
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.all(
                                                              8.0),
                                                      child: Text(
                                                        f.keterangan,
                                                        style: TextStyle(
                                                            color:
                                                                Colors.white),
                                                      ),
                                                    ),
                                                  ],
                                                )),
                                          ],
                                        ),
                                      ],
                                    ),
                                  );
                                })
                                .cast<Widget>()
                                .toList(),
                          ),
                        )
                      ],
                    ),
                  );
                }
                return CircularProgressIndicator();
              }),
          FutureBuilder<List<ShopAPI>>(
              future: fetchShopAPI(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return Card(
                    elevation: 9,
                    child: Column(
                      children: <Widget>[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                'Belanja',
                                style: TextStyle(
                                    fontWeight: FontWeight.w500, fontSize: 17),
                              ),
                            )
                          ],
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width,
                          height: 200,
                          child: ListView(
                            scrollDirection: Axis.horizontal,
                            children: snapshot.data
                                .map((f) {
                                  return Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Stack(
                                      children: <Widget>[
                                        Image.network(
                                          'http://simadu.id/images/shop/' +
                                              f.img,
                                          width: 200,
                                          height: 200,
                                          fit: BoxFit.cover,
                                        ),
                                        Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.end,
                                          children: <Widget>[
                                            Container(
                                                width: 200,
                                                color: Colors.black38,
                                                child: Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.end,
                                                  children: <Widget>[
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.all(
                                                              8.0),
                                                      child: Text(
                                                        f.keterangan.substring(0,70)+'. . .',
                                                        style: TextStyle(
                                                            color:
                                                                Colors.white),
                                                      ),
                                                    ),
                                                  ],
                                                )),
                                          ],
                                        ),
                                      ],
                                    ),
                                  );
                                })
                                .cast<Widget>()
                                .toList(),
                          ),
                        )
                      ],
                    ),
                  );
                }
                return CircularProgressIndicator();
              }),
        ],
      ),
    );
  }
}