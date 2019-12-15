import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:simadu/model/BeritaAPI.dart';
import 'package:simadu/model/ProviderBerita.dart';
import 'package:url_launcher/url_launcher.dart';
import 'DetailBerita.dart';

class BeritaLainnya extends StatefulWidget {
  @override
  _BeritaLainnyaState createState() => _BeritaLainnyaState();
}

class _BeritaLainnyaState extends State<BeritaLainnya> {
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
                      children: snapshot.data
                          .where((a) => a.kategori == 'Berita')
                          .map((f) {
                            return Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Hero(
                                tag: f.id_berita,
                                child: Material(
                                  child: InkWell(
                                    onTap: () async {
                                      // Navigator.of(context).push(MaterialPageRoute(
                                      //     builder: (c) => DetailBerita(
                                      //           id: f.id_berita,
                                      //           penulis: f.penulis,
                                      //           title: f.judul,
                                      //           // desc: f.isi,
                                      //           gambar: 'http://simadu.id/images/berita/'+f.img,
                                      //           tanggal: f.tanggal,
                                      //         )));
                                      String url = f.link;
                                      if (await canLaunch(url)) {
                                        await launch(url);
                                      } else {
                                        throw 'Could not launch $url';
                                      }
                                    },
                                    child: Column(
                                      children: <Widget>[
                                        Container(
                                          child: SizedBox(
                                            height: 87,
                                            width: 200,
                                            child: Image.network(
                                              'http://simadu.id/images/berita/' +
                                                  f.img,
                                              // fit: BoxFit.cover,
                                            ),
                                          ),
                                        ),
                                        Column(
                                         crossAxisAlignment: CrossAxisAlignment.start,
                                          children: <Widget>[
                                            Opacity(
                                              opacity: 1,
                                              child: Container(
                                                width: 200,
                                                height: 45,
                                                color: Colors.white,
                                                child: Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            8.0),
                                                    child: Column(
                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                      children: <Widget>[
                                                        // Text(
                                                        //   f['title'],
                                                        //   style: TextStyle(color: Colors.white),
                                                        // ),
                                                        Text(
                                                          f.judul
                                                              .toString()
                                                              .substring(
                                                                  0,
                                                                  f.judul.length <
                                                                          33
                                                                      ? f.judul
                                                                          .length
                                                                      : 33),
                                                          style: TextStyle(
                                                              color:
                                                                  Colors.black,
                                                              fontSize: 12
                                                              // fontSize: 10,
                                                              ),
                                                        )
                                                      ],
                                                    )),
                                              ),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 8.0),
                                              child: Container(
                                                height: 25,
                                                child: RaisedButton(
                                                  textColor: Colors.black,
                                                  color: Colors.lightBlue,
                                                  onPressed: () async {
                                                    String url = f.link;
                                                    if (await canLaunch(url)) {
                                                      await launch(url);
                                                    } else {
                                                      showDialog(
                                                        context: context,
                                                        builder: (context) =>
                                                            new AlertDialog(
                                                          title:
                                                              new Text('Maaf'),
                                                          content: new Text(
                                                              'Link Kosong'),
                                                          // actions:
                                                        ),
                                                      );
                                                    }
                                                  },
                                                  child: Text(
                                                    'Baca Selengkapnya',
                                                    style: TextStyle(
                                                        color: Colors.white,
                                                        fontSize: 9),
                                                  ),
                                                ),
                                              ),
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
