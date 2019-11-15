import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:simadu/model/Agenda.dart';
import 'package:simadu/model/ProviderGaleri.dart';

import 'DetailGaleri.dart';

class Galeri extends StatefulWidget {
  @override
  _GaleriState createState() => _GaleriState();
}

class _GaleriState extends State<Galeri> {
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
    return ChangeNotifierProvider<ProviderGaleri>(
      builder: (context) => ProviderGaleri(),
      child: Consumer<ProviderGaleri>(
        builder: (context, providerGaleri, _) => Scaffold(
          body: NotificationListener<ScrollNotification>(
            onNotification: (ScrollNotification scrollInfo) {
              if (scrollInfo.metrics.pixels ==
                  scrollInfo.metrics.maxScrollExtent) {
                loadMore(providerGaleri.data);
              }
            },
            child: FutureBuilder<List<Agenda>>(
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
                                        Navigator.of(context)
                                            .push(MaterialPageRoute(
                                                builder: (c) => DetailGaleri(
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
                                                    width: 145,
                                                    height: 100,
                                                    child: Image.network(
                                                        'http://simadu.id/images/agenda/' +
                                                            f.img),
                                                  ),
                                                  Expanded(
                                                    child: Padding(
                                                      padding: const EdgeInsets.all(8.0),
                                                      child: Container(
                                                        height: 100,
                                                        child: Column(
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: <Widget>[
                                                            Text(f.judul),
                                                            Text(
                                                              f.agenda.substring(0,100)+'. . .',
                                                              style: TextStyle(
                                                                  color: Colors
                                                                      .grey),
                                                            ),
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
                          .getRange(start,
                              snapshot.data.length != 0 ? (snapshot.data.length<finish?snapshot.data.length: start + finish) : 0)
                          .toList(),
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
