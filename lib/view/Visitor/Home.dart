import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:simadu/model/BeritaAPI.dart';
import 'package:simadu/model/KegiatanRKB.dart';
import 'package:simadu/model/Pencapaian.dart';
import 'package:simadu/model/ProviderHome.dart';
import 'package:simadu/model/SliderAPI.dart';

import 'ArtikelLainnya.dart';
import 'BeritaLainnya.dart';

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
                                  return Padding(
                                    padding: const EdgeInsets.all(12.0),
                                    child: Stack(
                                      children: <Widget>[
                                        Image.network(
                                          'http://simadu.id/images/slider/' +
                                              f.img,
                                          fit: BoxFit.cover,
                                          width: 300,
                                          height: 200,
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
                                              ],
                                            ),
                                          ],
                                        ),
                                      );
                                    })
                                    .cast<Widget>()
                                    .toList()
                                    .getRange(0, (snapshot.data.length<4?snapshot.data.length:4))
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
                        child: Column(
                          children: <Widget>[
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: <Widget>[
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    'Pencapaian',
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
                                  Padding(
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
                                  Padding(
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
                                  Padding(
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
                                  Padding(
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
                                  )
                                ],
                              ),
                            ),
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
                                    'Berita Terbaru',
                                    style: TextStyle(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 17),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 121),
                                  child: GestureDetector(
                                    child: Text(
                                      'Lihat Lainnya',
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
                              height: 200,
                              child: ListView(
                                scrollDirection: Axis.horizontal,
                                children: snapshot.data
                                    .where((a) => a.kategori == 'Berita')
                                    .map((f) {
                                      return Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Stack(
                                          children: <Widget>[
                                            Image.network(
                                              'http://simadu.id/images/berita/' +
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
                                                              const EdgeInsets
                                                                  .all(8.0),
                                                          child: Text(
                                                            f.judul,
                                                            style: TextStyle(
                                                                color: Colors
                                                                    .white),
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
                                    .toList()
                                   .getRange(0, (snapshot.data.where((a) => a.kategori == 'Berita').length<4?snapshot.data
                                    .where((a) => a.kategori == 'Berita').length:4))
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
                                    'Artikel Terbaru',
                                    style: TextStyle(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 17),
                                  ),
                                ),
                                 Padding(
                      padding: const EdgeInsets.only(left: 111),
                      child: GestureDetector(
                        child: Text(
                          'Lihat Lainnya',
                          style: TextStyle(fontSize: 17),
                        ),
                        onTap: (){
                           Navigator.of(context).push(MaterialPageRoute(
                                      builder: (c) => ArtikelLainnya(
                                          )));
                        },
                      ),
                    ),
                              ],
                            ),
                            SizedBox(
                              width: MediaQuery.of(context).size.width,
                              height: 200,
                              child: ListView(
                                scrollDirection: Axis.horizontal,
                                children: snapshot.data
                                    .where((a) => a.kategori == 'Artikel')
                                    .map((f) {
                                      print(snapshot.data
                                    .where((a) => a.kategori == 'Artikel').length);
                                      return Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Stack(
                                          children: <Widget>[
                                            Image.network(
                                              'http://simadu.id/images/berita/' +
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
                                                              const EdgeInsets
                                                                  .all(8.0),
                                                          child: Text(
                                                            f.judul,
                                                            style: TextStyle(
                                                                color: Colors
                                                                    .white),
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
                                    .toList()
                                    .getRange(0, (snapshot.data.where((a) => a.kategori == 'Artikel').length<4?snapshot.data
                                    .where((a) => a.kategori == 'Artikel').length:4))
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
                            'Mitra',
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
                              'assets/images/YBP.jpg',
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
