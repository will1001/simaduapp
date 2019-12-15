import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:simadu/model/BeritaAPI.dart';
import 'package:simadu/model/ProviderAgenda.dart';
import 'package:simadu/model/ProviderArtikel.dart';
import 'package:simadu/model/ProviderBerita.dart';
import 'package:simadu/view/Visitor/ArtikelLainnya.dart';
import 'package:simadu/view/Visitor/BeritaLainnya.dart';
import 'package:url_launcher/url_launcher.dart';

import 'DetailAgenda.dart';
import 'DetailArtikel.dart';
import 'DetailBerita.dart';

class Berita extends StatefulWidget {
  @override
  _BeritaState createState() => _BeritaState();
}

class _BeritaState extends State<Berita> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: <Widget>[
          // Column(
          //   children: <Widget>[
          //     Padding(
          //       padding: const EdgeInsets.all(11),
          //       child: GestureDetector(
          //         child: Row(
          //           mainAxisAlignment: MainAxisAlignment.end,
          //           children: <Widget>[
          //             Icon(
          //               FontAwesomeIcons.list,
          //               color: Colors.black,
          //               size: 12,
          //             ),
          //             Text(
          //               ' Lihat Lainnya',
          //               style: TextStyle(fontSize: 17),
          //             ),
          //           ],
          //         ),
          //         onTap: () {
          //           Navigator.of(context).push(
          //               MaterialPageRoute(builder: (c) => BeritaLainnya()));
          //         },
          //       ),
          //     ),
          //   ],
          // ),
          Card(
            elevation: 9,
            child: Column(
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        'BERITA',
                        style: TextStyle(
                            fontWeight: FontWeight.w500, fontSize: 17),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 145.0),
                      child: GestureDetector(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: <Widget>[
                            Icon(
                              FontAwesomeIcons.list,
                              color: Colors.black,
                              size: 12,
                            ),
                            Text(
                              ' Lihat Lainnya',
                              style: TextStyle(fontSize: 17),
                            ),
                          ],
                        ),
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (c) => BeritaLainnya()));
                        },
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ChangeNotifierProvider<ProviderBerita>(
                      builder: (context) => ProviderBerita(),
                      child: Consumer<ProviderBerita>(
                          builder: (context, providerberita, _) =>
                              WidgetGridview(
                                data: fetchBeritaAPI(),
                                kategori: 'Berita',
                              ))),
                ),
              ],
            ),
          ),
          // Column(
          //   children: <Widget>[
          //     Padding(
          //       padding: const EdgeInsets.all(11),
          //       child: GestureDetector(
          //         child: Row(
          //           mainAxisAlignment: MainAxisAlignment.end,
          //           children: <Widget>[
          //             Icon(
          //               FontAwesomeIcons.list,
          //               color: Colors.black,
          //               size: 12,
          //             ),
          //             Text(
          //               ' Lihat Lainnya',
          //               style: TextStyle(fontSize: 17),
          //             ),
          //           ],
          //         ),
          //         onTap: () {
          //           Navigator.of(context).push(
          //               MaterialPageRoute(builder: (c) => ArtikelLainnya()));
          //         },
          //       ),
          //     ),
          //   ],
          // ),
          Padding(
            padding: const EdgeInsets.only(top: 11),
            child: Card(
              elevation: 9,
              child: Column(
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          'ARTIKEL',
                          style: TextStyle(
                              fontWeight: FontWeight.w500, fontSize: 17),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 135.0),
                        child: GestureDetector(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: <Widget>[
                              Icon(
                                FontAwesomeIcons.list,
                                color: Colors.black,
                                size: 12,
                              ),
                              Text(
                                ' Lihat Lainnya',
                                style: TextStyle(fontSize: 17),
                              ),
                            ],
                          ),
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (c) => ArtikelLainnya()));
                          },
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ChangeNotifierProvider<ProviderArtikel>(
                        builder: (context) => ProviderArtikel(),
                        child: Consumer<ProviderArtikel>(
                            builder: (context, providerartikel, _) =>
                                WidgetGridview(
                                  data: fetchBeritaAPI(),
                                  kategori: 'Artikel',
                                ))),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class WidgetGridview extends StatelessWidget {
  WidgetGridview({this.data, this.kategori});
  final data;
  final String kategori;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      // height: MediaQuery.of(context).size.height / 3,
      height: 290,
      width: MediaQuery.of(context).size.width,
      child: FutureBuilder<List<BeritaAPI>>(
          future: data,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ListView(
                  scrollDirection: Axis.horizontal,
                  children: snapshot.data
                      .where((a) => a.kategori == kategori)
                      .map((f) {
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Hero(
                            tag: f.id_berita,
                            child: Material(
                              child: InkWell(
                                onTap: () async {
                                  if (kategori == 'Berita') {
                                    // Navigator.of(context)
                                    //     .push(MaterialPageRoute(
                                    //         builder: (c) => DetailBerita(
                                    //               id: f.id_berita,
                                    //               title: f.judul,
                                    //               // desc: f.isi,
                                    //               gambar:
                                    //                   'http://simadu.id/images/berita/' +
                                    //                       f.img,
                                    //               tanggal: f.tanggal,
                                    //               penulis: f.penulis,
                                    //             )));
                                    String url = f.link;
                                    if (await canLaunch(url)) {
                                      await launch(url);
                                    } else {
                                      throw 'Could not launch $url';
                                    }
                                  }
                                  if (kategori == 'Artikel') {
                                    Navigator.of(context)
                                        .push(MaterialPageRoute(
                                            builder: (c) => DetailArtikel(
                                                  id: f.id_berita,
                                                  title: f.judul,
                                                  desc: f.isi,
                                                  gambar:
                                                      'http://simadu.id/images/berita/' +
                                                          f.img,
                                                  tanggal: f.tanggal,
                                                  penulis: f.penulis,
                                                )));
                                  }
                                  if (kategori == 'Agenda') {
                                    Navigator.of(context)
                                        .push(MaterialPageRoute(
                                            builder: (c) => DetailAgenda(
                                                  id: f.id_berita,
                                                  title: f.judul,
                                                  // desc: f.isi,
                                                  gambar:
                                                      'http://simadu.id/images/berita/' +
                                                          f.img,
                                                  tanggal: f.tanggal,
                                                  penulis: f.penulis,
                                                )));
                                  }
                                },
                                child: Column(
                                  children: <Widget>[
                                    Container(
                                      child: SizedBox(
                                        height: 140,
                                        width:
                                            MediaQuery.of(context).size.width,
                                        child: Image.network(
                                          'http://simadu.id/images/berita/' +
                                              f.img,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: <Widget>[
                                        Container(
                                          width:
                                              MediaQuery.of(context).size.width,
                                          // color: Colors.black38,
                                          child: Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: <Widget>[
                                                  // Text(
                                                  //   f['title'],
                                                  //   style: TextStyle(color: Colors.white),
                                                  // ),
                                                   Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                    .all(8.0),
                                                            child: Row(
                                                              children: <
                                                                  Widget>[
                                                                Text(
                                                                    'Tanggal : '),
                                                                Text(
                                                                  f.tanggal,
                                                                  style: TextStyle(
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .bold),
                                                                ),
                                                                Text(
                                                                    ' | Dipost : '),
                                                                Text(
                                                                  f.penulis,
                                                                  style: TextStyle(
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .bold),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                          Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                    .all(8.0),
                                                            child: Text(
                                                              f.judul.substring(
                                                                  0,
                                                                  (f.judul.length <
                                                                          40
                                                                      ? f.judul
                                                                          .length
                                                                      : 40)),
                                                              style: TextStyle(
                                                                  color: Colors
                                                                      .black),
                                                            ),
                                                          ),
                                                          Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                    .all(8.0),
                                                            child: Container(
                                                              height: 35,
                                                              child:
                                                                  RaisedButton(
                                                                textColor:
                                                                    Colors
                                                                        .black,
                                                                color: Colors
                                                                    .lightBlue,
                                                                onPressed:
                                                                    () async {

                                                                      if(kategori == 'Artikel'){
                                                                        Navigator.of(context).push(
                                                                      MaterialPageRoute(
                                                                          builder: (c) =>
                                                                              DetailArtikel(
                                                                                id: f.id_berita,
                                                                                title:
                                                                                    f.judul,
                                                                                desc:
                                                                                    f.isi,
                                                                                gambar:
                                                                                    'http://simadu.id/images/berita/' + f.img,
                                                                                tanggal:
                                                                                    f.tanggal,
                                                                                penulis:
                                                                                    f.penulis,
                                                                              )));

                                                                      }if(kategori == 'Berita'){
                                                                        String url =
                                                                      f.link;
                                                                  if (await canLaunch(
                                                                      url)) {
                                                                    await launch(
                                                                        url);
                                                                  } else {
                                                                    showDialog(
                                                                      context:
                                                                          context,
                                                                      builder:
                                                                          (context) =>
                                                                              new AlertDialog(
                                                                        title: new Text(
                                                                            'Maaf'),
                                                                        content:
                                                                            new Text('Link Kosong'),
                                                                        // actions: 
                                                                      ),
                                                                    );
                                                                      }
                                                                  
                                                                  }
                                                                },
                                                                child: Text(
                                                                  'Baca Selengkapnya',
                                                                  style: TextStyle(
                                                                      color: Colors
                                                                          .white),
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                  // Padding(
                                                  //   padding:
                                                  //       const EdgeInsets.only(
                                                  //           top: 8.0),
                                                  //   child: Text(''),
                                                  // ),
                                                  // RaisedButton(
                                                  //   child: Text(
                                                  //       'Baca Selengkapnya'),
                                                  //   textColor: Colors.white,
                                                  //   color: Colors.lightBlue,
                                                  //   onPressed: () {
                                                  //     if (kategori ==
                                                  //         'Berita') {
                                                  //       Navigator.of(context).push(
                                                  //           MaterialPageRoute(
                                                  //               builder: (c) =>
                                                  //                   DetailBerita(
                                                  //                     id: f
                                                  //                         .id_berita,
                                                  //                     title: f
                                                  //                         .judul,
                                                  //                     desc:
                                                  //                         f.isi,
                                                  //                     gambar: 'http://simadu.id/images/berita/' +
                                                  //                         f.img,
                                                  //                     tanggal: f
                                                  //                         .tanggal,
                                                  //                     penulis: f
                                                  //                         .penulis,
                                                  //                   )));
                                                  //     }
                                                  //     if (kategori ==
                                                  //         'Artikel') {
                                                  //       Navigator.of(context).push(
                                                  //           MaterialPageRoute(
                                                  //               builder: (c) =>
                                                  //                   DetailArtikel(
                                                  //                     id: f
                                                  //                         .id_berita,
                                                  //                     title: f
                                                  //                         .judul,
                                                  //                     desc:
                                                  //                         f.isi,
                                                  //                     gambar: 'http://simadu.id/images/berita/' +
                                                  //                         f.img,
                                                  //                     tanggal: f
                                                  //                         .tanggal,
                                                  //                     penulis: f
                                                  //                         .penulis,
                                                  //                   )));
                                                  //     }
                                                  //     if (kategori ==
                                                  //         'Agenda') {
                                                  //       Navigator.of(context).push(
                                                  //           MaterialPageRoute(
                                                  //               builder: (c) =>
                                                  //                   DetailAgenda(
                                                  //                     id: f
                                                  //                         .id_berita,
                                                  //                     title: f
                                                  //                         .judul,
                                                  //                     desc:
                                                  //                         f.isi,
                                                  //                     gambar: 'http://simadu.id/images/berita/' +
                                                  //                         f.img,
                                                  //                     tanggal: f
                                                  //                         .tanggal,
                                                  //                     penulis: f
                                                  //                         .penulis,
                                                  //                   )));
                                                  //     }
                                                  //   },
                                                  // ),
                                                ],
                                              )),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        );
                      })
                      .cast<Widget>()
                      .toList()
                  // .getRange(0, 4)
                  // .toList(),
                  );
            }
            return CircularProgressIndicator();
          }),
    );
  }
}
