import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:simadu/model/ProviderShop.dart';
import 'package:simadu/model/ShopAPI.dart';

import 'DetailShop.dart';

class Shop extends StatefulWidget {
  @override
  _ShopState createState() => _ShopState();
}

class _ShopState extends State<Shop> {
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
    return ChangeNotifierProvider<ProviderShop>(
      builder: (context) => ProviderShop(),
      child: Consumer<ProviderShop>(
        builder: (context, providershop, _) => Scaffold(
          body: NotificationListener<ScrollNotification>(
            onNotification: (ScrollNotification scrollInfo) {
              if (scrollInfo.metrics.pixels ==
                  scrollInfo.metrics.maxScrollExtent) {
                loadMore(providershop.data);
              }
            },
            child: FutureBuilder<List<ShopAPI>>(
                future: fetchShopAPI(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return GridView.count(
              crossAxisCount: 2,
              children: snapshot.data
                  .map((f) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Hero(
                        tag: f.id_shop,
                        child: Material(
                          child: InkWell(
                            onTap: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (c) => DetailShop(
                                        id: f.id_shop,
                                        title: f.keterangan,
                                        desc: f.keterangan,
                                        linkbukalapak: f.link,
                                        linklazada: f.link,
                                        linkshoppe: f.link,
                                        linktokopedia: f.link,
                                        linkblanjadotcom:
                                            f.link,
                                        gambar: 'http://simadu.id/images/shop/' +f.img,
                                      )));
                            },
                            child: Stack(
                              children: <Widget>[
                                Container(
                                  child: SizedBox(
                                    height: 200,
                                    width: 200,
                                    child: Image.network(
                                      'http://simadu.id/images/shop/' +f.img,
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
                                                f.keterangan.toString().substring(
                                                    0,
                                                    f.keterangan.length < 43
                                                        ? f.keterangan.length
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
