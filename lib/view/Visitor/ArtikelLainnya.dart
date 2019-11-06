import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:simadu/model/BeritaAPI.dart';
import 'package:simadu/model/ProviderBerita.dart';
import 'DetailArtikel.dart';

class ArtikelLainnya extends StatefulWidget {
  @override
  _ArtikelLainnyaState createState() => _ArtikelLainnyaState();
}

class _ArtikelLainnyaState extends State<ArtikelLainnya> {
  int start = 0;
  int finish = 8;

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
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<ProviderBerita>(
      builder: (context) => ProviderBerita(),
      child: Consumer<ProviderBerita>(
        builder: (context, providerberita, _) => Scaffold(
          body: NotificationListener<ScrollNotification>(
            onNotification: (ScrollNotification scrollInfo) {
              if (scrollInfo.metrics.pixels ==
                  scrollInfo.metrics.maxScrollExtent) {
                loadMore(providerberita.data);
              }
            },
            child: FutureBuilder<List<BeritaAPI>>(
                future: fetchBeritaAPI(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return GridView.count(
              crossAxisCount: 2,
              children: snapshot.data.where((a)=>a.kategori=='Artikel')
                  .map((f) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Hero(
                        tag: f.id_berita,
                        child: Material(
                          child: InkWell(
                            onTap: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (c) => DetailArtikel(
                                        id: f.id_berita,
                                        title: f.judul,
                                        desc: f.isi,
                                        gambar: 'http://simadu.id/images/berita/'+f.img,
                                        tanggal: f.tanggal,
                                      )));
                            },
                            child: Stack(
                              children: <Widget>[
                                Container(
                                  child: SizedBox(
                                    height: 200,
                                    width: 200,
                                    child: Image.network(
                                      'http://simadu.id/images/berita/' +f.img,
                                      // fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: <Widget>[
                                    Container(
                                      width: 200,
                                      color: Colors.black38,
                                      child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Column(
                                            children: <Widget>[
                                              // Text(
                                              //   f['title'],
                                              //   style: TextStyle(color: Colors.white),
                                              // ),
                                              Text(
                                                f.isi.toString().substring(
                                                    0,
                                                    f.isi.length < 43
                                                        ? f.isi.length
                                                        : 43),
                                                style: TextStyle(
                                                  color: Colors.white,
                                                  // fontSize: 10,
                                                ),
                                              )
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
                  .toList(),
                  // .getRange(start,
                  //             snapshot.data.length != 0 ? (snapshot.data.length<finish?snapshot.data.length: start + finish) : 0)
                  // .toList(),
            );
                  }
                  return CircularProgressIndicator();
                }),
          ),
        ),
      ),
    );
  }
}
