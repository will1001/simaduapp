import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:simadu/model/BeritaAPI.dart';
import 'package:simadu/model/KegiatanRKB.dart';
import 'package:simadu/model/Pencapaian.dart';
import 'package:simadu/model/ProviderHome.dart';
import 'package:simadu/model/SliderAPI.dart';
import 'package:simadu/model/TimAPI.dart';

import 'ArtikelLainnya.dart';
import 'BeritaLainnya.dart';
import 'DetailArtikel.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  PageController pageController;

  @override
  void initState() {
    super.initState();
    pageController = PageController(initialPage: 1, viewportFraction: 0.8);
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<ProviderHome>(
      builder: (context) => ProviderHome(),
      child: Consumer<ProviderHome>(
        builder: (context, providerhome, _) => Scaffold(
          body: ListView(
            children: <Widget>[
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
                                  return Container(
                                    width: MediaQuery.of(context).size.width,
                                    child: Padding(
                                      padding: const EdgeInsets.all(0.0),
                                      child: Stack(
                                        children: <Widget>[
                                          Image.network(
                                            'http://simadu.id/images/slider/' +
                                                f.img,
                                            fit: BoxFit.cover,
                                            width: MediaQuery.of(context)
                                                .size
                                                .width,
                                            height: 250,
                                          ),
                                          Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.end,
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
                                              //             const EdgeInsets.all(
                                              //                 8.0),
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
              Card(
                elevation: 9,
                child: Container(
                  height: 230,
                  child: Column(
                    children: <Widget>[
                      // Row(
                      //   mainAxisAlignment: MainAxisAlignment.start,
                      //   children: <Widget>[
                      //     Padding(
                      //       padding: const EdgeInsets.all(8.0),
                      //       child: Text(
                      //         'Pencapaian',
                      //         style: TextStyle(
                      //             fontWeight: FontWeight.w500,
                      //             fontSize: 17),
                      //       ),
                      //     )
                      //   ],
                      // ),
                      SizedBox(
                        height: 220,
                        child: ListView(
                          scrollDirection: Axis.horizontal,
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Card(
                                elevation: 9,
                                child: Padding(
                                  padding: const EdgeInsets.only(top:0.0),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: <Widget>[
                                      Icon(
                                        FontAwesomeIcons.home,
                                        color: Colors.blue,
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Center(
                                            child: Text(
                                          'Basecamp',
                                          style:
                                              TextStyle(fontWeight: FontWeight.bold),
                                        )),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Container(
                                            alignment: FractionalOffset(0.5, 0.5),
                                            width: 200,
                                            child: Center(
                                                child: Text(
                                              'Kami menyediakan wadah bagi UMKM untuk menampilkan produk mereka di basecamp RKB-Lombok Barat',
                                              textAlign: TextAlign.center,
                                            ))),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Card(
                                        elevation: 9,
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: <Widget>[
                                      Icon(
                                        FontAwesomeIcons.building,
                                        color: Colors.blue,
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Center(
                                            child: Text(
                                          'Fasilitas Pelatihan',
                                          style:
                                              TextStyle(fontWeight: FontWeight.bold),
                                        )),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Container(
                                            alignment: FractionalOffset(0.5, 0.5),
                                            width: 200,
                                            child: Center(
                                                child: Text(
                                              'Kami memfasilitasi ruang dan sarana pelatihan lainnya yang mampu menunjang optimalisasi penyampaian materi edukasi',
                                              textAlign: TextAlign.center,
                                            ))),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Card(
                                        elevation: 9,
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: <Widget>[
                                      Icon(
                                        FontAwesomeIcons.calendar,
                                        color: Colors.blue,
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Center(
                                            child: Text(
                                          'Jadwal Pelatihan',
                                          style:
                                              TextStyle(fontWeight: FontWeight.bold),
                                        )),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Container(
                                            alignment: FractionalOffset(0.5, 0.5),
                                            width: 200,
                                            child: Center(
                                                child: Text(
                                              'Pelatihan yang terjadwal dengan baik setiap bulannya dapat memudahkan UMKM untuk mengembangkan pengetahuan mereka secara intensif',
                                              textAlign: TextAlign.center,
                                            ))),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Card(
                                        elevation: 9,
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: <Widget>[
                                      Icon(
                                        FontAwesomeIcons.handshake,
                                        color: Colors.blue,
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Center(
                                            child: Text(
                                          'Komitmen',
                                          style:
                                              TextStyle(fontWeight: FontWeight.bold),
                                        )),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Container(
                                            alignment: FractionalOffset(0.5, 0.5),
                                            width: 200,
                                            child: Center(
                                                child: Text(
                                              'Kami secara menyeluruh memastikan bahwa UMKM dapat berkembang baik dari sisi pengetahuan maupun aktivitas usaha.',
                                              textAlign: TextAlign.center,
                                            ))),
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
                ),
              ),
              FutureBuilder<List<TimAPI>>(
                  future: fetchTimAPI(),
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
                                    'TIM KAMI',
                                    style: TextStyle(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 17),
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
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: <Widget>[
                                            Row(
                                              children: <Widget>[
                                                Container(
                                                    margin: EdgeInsets.all(5),
                                                    width: 150.0,
                                                    height: 150.0,
                                                    decoration: BoxDecoration(
                                                        shape: BoxShape.circle,
                                                        image: DecorationImage(
                                                            fit: BoxFit.fill,
                                                            image: NetworkImage(
                                                                'http://simadu.id/images/tim/' +
                                                                    f.img)))),
                                                Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: <Widget>[
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              left: 21.0,
                                                              bottom: 7),
                                                      child: Text(
                                                        f.nama,
                                                        style: TextStyle(
                                                            fontSize: 21,
                                                            color: Colors
                                                                .lightBlue),
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              left: 21.0,
                                                              bottom: 7),
                                                      child: Text(
                                                        f.jabatan,
                                                        style: TextStyle(
                                                            // fontSize: 21,
                                                            // color: Colors.lightBlue
                                                            ),
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              left: 21.0),
                                                      child: Row(
                                                        children: <Widget>[
                                                          Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                    .all(8.0),
                                                            child: Icon(
                                                              FontAwesomeIcons
                                                                  .facebook,
                                                              color:
                                                                  Colors.blue,
                                                            ),
                                                          ),
                                                          Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                    .all(8.0),
                                                            child: Icon(
                                                              FontAwesomeIcons
                                                                  .twitter,
                                                              color: Colors
                                                                  .lightBlue,
                                                            ),
                                                          ),
                                                          Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                    .all(8.0),
                                                            child: Icon(
                                                              FontAwesomeIcons
                                                                  .linkedin,
                                                              color:
                                                                  Colors.blue,
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ],
                                                ),
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
                                    'KEGIATAN RKB',
                                    style: TextStyle(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 17),
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
                                            ClipRRect(
                                              borderRadius:
                                                  new BorderRadius.circular(
                                                      11.0),
                                              child: Image.network(
                                                'http://simadu.id/images/kegiatan/' +
                                                    f.img,
                                                // width: 200,
                                                height: 200,
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                            Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.end,
                                              children: <Widget>[
                                                ClipRRect(
                                                  borderRadius:
                                                      new BorderRadius.circular(
                                                          11.0),
                                                  child: Container(
                                                      width: 340,
                                                      color: Colors.black38,
                                                      child: Column(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .end,
                                                        children: <Widget>[
                                                          Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                    .all(8.0),
                                                            child: Text(
                                                              f.keterangan,
                                                              style: TextStyle(
                                                                  color: Colors
                                                                      .white),
                                                            ),
                                                          ),
                                                        ],
                                                      )),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      );
                                    })
                                    .cast<Widget>()
                                    .toList()
                                    .getRange(
                                        0,
                                        (snapshot.data.length < 4
                                            ? snapshot.data.length
                                            : 4))
                                    .toList(),
                              ),
                            )
                          ],
                        ),
                      );
                    }
                    return CircularProgressIndicator();
                  }),
              FutureBuilder<List<Pencapaian>>(
                  future: fetchPencapaian(),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return Card(
                        elevation: 9,
                        child: Container(
                          height: 170,
                          child: Column(
                            children: <Widget>[
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: <Widget>[
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      'PENCAPAIAN',
                                      style: TextStyle(
                                          fontWeight: FontWeight.w500,
                                          fontSize: 17),
                                    ),
                                  )
                                ],
                              ),
                              SizedBox(
                                height: 120,
                                child: ListView(
                                  scrollDirection: Axis.horizontal,
                                  children: <Widget>[
                                    Card(
                                      elevation: 9,
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Column(
                                          children: <Widget>[
                                            Icon(Icons.home),
                                            Padding(
                                              padding: const EdgeInsets.all(8.0),
                                              child:
                                                  Text(snapshot.data[0].pelatihan),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.all(8.0),
                                              child: Text('PELATIHAN'),
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                   Card(
                                      elevation: 9,
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Column(
                                          children: <Widget>[
                                            Icon(Icons.shopping_cart),
                                            Padding(
                                              padding: const EdgeInsets.all(8.0),
                                              child: Text(
                                                  snapshot.data[0].produk_umkm),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.all(8.0),
                                              child: Text('PRODUK UMKM'),
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                    Card(
                                      elevation: 9,
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Column(
                                          children: <Widget>[
                                            Icon(Icons.group),
                                            Padding(
                                              padding: const EdgeInsets.all(8.0),
                                              child: Text(snapshot.data[0].peserta),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.all(8.0),
                                              child: Text('PESERTA'),
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                  Card(
                                      elevation: 9,
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Column(
                                          children: <Widget>[
                                            Icon(Icons.business),
                                            Padding(
                                              padding: const EdgeInsets.all(8.0),
                                              child: Text(
                                                  snapshot.data[0].umkm_binaan),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.all(8.0),
                                              child: Text('UMKM BINAAN'),
                                            )
                                          ],
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    }
                    return CircularProgressIndicator();
                  }),
              FutureBuilder<List<BeritaAPI>>(
                  future: fetchBeritaAPI(),
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
                                    'BERITA TERBARU',
                                    style: TextStyle(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 17),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 75),
                                  child: GestureDetector(
                                    child: Text(
                                      'Lihat Lainnya >>',
                                      style: TextStyle(fontSize: 17),
                                    ),
                                    onTap: () {
                                      Navigator.of(context).push(
                                          MaterialPageRoute(
                                              builder: (c) => BeritaLainnya()));
                                    },
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              width: MediaQuery.of(context).size.width,
                              height: 280,
                              child: ListView(
                                scrollDirection: Axis.horizontal,
                                children: snapshot.data
                                    .where((a) => a.kategori == 'Berita')
                                    .map((f) {
                                      return Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Column(
                                          children: <Widget>[
                                            Image.network(
                                              'http://simadu.id/images/berita/' +
                                                  f.img,
                                              width: 200,
                                              height: 150,
                                              fit: BoxFit.cover,
                                            ),
                                            Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.end,
                                              children: <Widget>[
                                                Container(
                                                    width: 200,
                                                    // color: Colors.black38,
                                                    child: Column(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment.end,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: <Widget>[
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
                                                                      .only(
                                                                  left: 8.0),
                                                          child: Text(
                                                            f.isi
                                                                .toString()
                                                                .substring(
                                                                    0,
                                                                    f.isi.length <
                                                                            83
                                                                        ? f.isi
                                                                            .length
                                                                        : 83),
                                                            style: TextStyle(
                                                              color: Colors
                                                                  .black26,
                                                              // fontSize: 10,
                                                            ),
                                                          ),
                                                        ),
                                                        // SizedBox(
                                                        //   height: 35,
                                                        //   child: RaisedButton(
                                                        //     child: Text(
                                                        //         'Baca Selengkapnya'),
                                                        //     textColor:
                                                        //         Colors.white,
                                                        //     color: Colors
                                                        //         .lightBlue,
                                                        //     onPressed: () {
                                                        //       Navigator.of(context).push(
                                                        //           MaterialPageRoute(
                                                        //               builder: (c) =>
                                                        //                   DetailArtikel(
                                                        //                     id: f.id_berita,
                                                        //                     title:
                                                        //                         f.judul,
                                                        //                     desc:
                                                        //                         f.isi,
                                                        //                     gambar:
                                                        //                         'http://simadu.id/images/berita/' + f.img,
                                                        //                     tanggal:
                                                        //                         f.tanggal,
                                                        //                     penulis:
                                                        //                         f.penulis,
                                                        //                   )));
                                                        //     },
                                                        //   ),
                                                        // ),
                                                      ],
                                                    )),
                                              ],
                                            ),
                                          ],
                                        ),
                                      );
                                    })
                                    .cast<Widget>()
                                    .toList()
                                    .getRange(
                                        0,
                                        (snapshot.data
                                                    .where((a) =>
                                                        a.kategori == 'Berita')
                                                    .length <
                                                4
                                            ? snapshot.data
                                                .where((a) =>
                                                    a.kategori == 'Berita')
                                                .length
                                            : 4))
                                    .toList(),
                              ),
                            )
                          ],
                        ),
                      );
                    }
                    return CircularProgressIndicator();
                  }),
              FutureBuilder<List<BeritaAPI>>(
                  future: fetchBeritaAPI(),
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
                                    'ARTIKEL TERBARU',
                                    style: TextStyle(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 17),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 59),
                                  child: GestureDetector(
                                    child: Text(
                                      'Lihat Lainnya >>',
                                      style: TextStyle(fontSize: 17),
                                    ),
                                    onTap: () {
                                      Navigator.of(context).push(
                                          MaterialPageRoute(
                                              builder: (c) =>
                                                  ArtikelLainnya()));
                                    },
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              width: MediaQuery.of(context).size.width,
                              height: 280,
                              child: ListView(
                                scrollDirection: Axis.horizontal,
                                children: snapshot.data
                                    .where((a) => a.kategori == 'Artikel')
                                    .map((f) {
                                      print(snapshot.data
                                          .where((a) => a.kategori == 'Artikel')
                                          .length);
                                      return Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: <Widget>[
                                            Image.network(
                                              'http://simadu.id/images/berita/' +
                                                  f.img,
                                              width: 200,
                                              height: 150,
                                              fit: BoxFit.cover,
                                            ),
                                            Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.end,
                                              children: <Widget>[
                                                Container(
                                                    width: 200,
                                                    // color: Colors.black38,
                                                    child: Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment.end,
                                                      children: <Widget>[
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
                                                                      .only(
                                                                  left: 8.0),
                                                          child: Text(
                                                            f.isi
                                                                .toString()
                                                                .substring(
                                                                    0,
                                                                    f.isi.length <
                                                                            83
                                                                        ? f.isi
                                                                            .length
                                                                        : 83),
                                                            style: TextStyle(
                                                              color: Colors
                                                                  .black26,
                                                              // fontSize: 10,
                                                            ),
                                                          ),
                                                        ),
                                                        // SizedBox(
                                                        //   height: 35,
                                                        //   child: RaisedButton(
                                                        //     child: Text(
                                                        //         'Baca Selengkapnya'),
                                                        //     textColor:
                                                        //         Colors.white,
                                                        //     color: Colors
                                                        //         .lightBlue,
                                                        //     onPressed: () {
                                                        //       Navigator.of(context).push(
                                                        //           MaterialPageRoute(
                                                        //               builder: (c) =>
                                                        //                   DetailArtikel(
                                                        //                     id: f.id_berita,
                                                        //                     title:
                                                        //                         f.judul,
                                                        //                     desc:
                                                        //                         f.isi,
                                                        //                     gambar:
                                                        //                         'http://simadu.id/images/berita/' + f.img,
                                                        //                     tanggal:
                                                        //                         f.tanggal,
                                                        //                     penulis:
                                                        //                         f.penulis,
                                                        //                   )));
                                                        //     },
                                                        //   ),
                                                        // ),
                                                      ],
                                                    )),
                                              ],
                                            ),
                                          ],
                                        ),
                                      );
                                    })
                                    .cast<Widget>()
                                    .toList()
                                    .getRange(
                                        0,
                                        (snapshot.data
                                                    .where((a) =>
                                                        a.kategori == 'Artikel')
                                                    .length <
                                                4
                                            ? snapshot.data
                                                .where((a) =>
                                                    a.kategori == 'Artikel')
                                                .length
                                            : 4))
                                    .toList(),
                              ),
                            )
                          ],
                        ),
                      );
                    }
                    return CircularProgressIndicator();
                  }),
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
                            'MITRA',
                            style: TextStyle(
                                fontWeight: FontWeight.w500, fontSize: 17),
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 120,
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Image.asset(
                              'assets/images/BUMN.jpeg',
                              fit: BoxFit.cover,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Image.asset(
                              'assets/images/logo.png',
                              fit: BoxFit.cover,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Image.asset(
                              'assets/images/PLN.jpg',
                              fit: BoxFit.cover,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
