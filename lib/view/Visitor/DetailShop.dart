import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:url_launcher/url_launcher.dart';

class DetailShop extends StatefulWidget {
  DetailShop(
      {Key key,
      this.id,
      this.title,
      this.desc,
      this.gambar,
      this.linkbukalapak,
      this.linklazada,
      this.linkshoppe,
      this.linktokopedia,
      this.linkblanjadotcom})
      : super(key: key);

  final String id;
  final String title;
  final String desc;
  final String linkbukalapak;
  final String linklazada;
  final String linkshoppe;
  final String linktokopedia;
  final String linkblanjadotcom;
  final String gambar;
  @override
  _DetailShopState createState() => _DetailShopState();
}

class _DetailShopState extends State<DetailShop> {
  @override
  Widget build(BuildContext context) {
    timeDilation = 3.0;
    return Scaffold(
      body: ListView(
        children: <Widget>[
          Card(
            child: Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Container(
                    height: 240,
                    color: Colors.white,
                    child: Hero(
                        tag: widget.id,
                        child: Material(
                          child: InkWell(
                            child: Image.network(
                              widget.gambar,
                              fit: BoxFit.cover,
                            ),
                          ),
                        )),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 19.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Text(widget.title),
                    ],
                  ),
                ),
                // Padding(
                //   padding: const EdgeInsets.only(top: 8.0, bottom: 8, left: 19),
                //   child: Column(
                //     mainAxisAlignment: MainAxisAlignment.start,
                //     children: <Widget>[
                //       Text(
                //         widget.desc,
                //         style: TextStyle(color: Colors.grey),
                //       ),
                //     ],
                //   ),
                // ),

                Column(
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(left: 19.0),
                          child: ButtonTheme(
                            minWidth: 110,
                            child: RaisedButton(
                              textColor: Colors.black,
                              color: Colors.lightBlue,
                              onPressed: () async {
                                String url = widget.linkbukalapak;
                                if (await canLaunch(url)) {
                                  await launch(url);
                                } else {
                                  throw 'Could not launch $url';
                                }
                              },
                              child: Text('Beli Produk ini',style: TextStyle(color: Colors.white),),
                            ),
                          ),
                        ),
                      ],
                    ),
                    // Row(
                    //   mainAxisAlignment: MainAxisAlignment.start,
                    //   children: <Widget>[
                    //     Padding(
                    //       padding: const EdgeInsets.only(left: 19.0),
                    //       child: ButtonTheme(
                    //         minWidth: 110,
                    //         child: RaisedButton(
                    //           textColor: Colors.black,
                    //           color: Colors.lightBlue,
                    //           onPressed: () async {
                    //             String url = widget.linklazada;
                    //             if (await canLaunch(url)) {
                    //               await launch(url);
                    //             } else {
                    //               throw 'Could not launch $url';
                    //             }
                    //           },
                    //           child: Text('Lazada'),
                    //         ),
                    //       ),
                    //     ),
                    //   ],
                    // ),
                    // Row(
                    //   mainAxisAlignment: MainAxisAlignment.start,
                    //   children: <Widget>[
                    //     ButtonTheme(
                    //         minWidth: 110,
                    //       child: Padding(
                    //         padding: const EdgeInsets.only(left: 19.0),
                    //         child: RaisedButton(
                    //           textColor: Colors.black,
                    //           color: Colors.lightBlue,
                    //           onPressed: () async {
                    //             String url = widget.linkshoppe;
                    //             if (await canLaunch(url)) {
                    //               await launch(url);
                    //             } else {
                    //               throw 'Could not launch $url';
                    //             }
                    //           },
                    //           child: Text('Shoppe'),
                    //         ),
                    //       ),
                    //     ),
                    //   ],
                    // ),
                    // Row(
                    //   mainAxisAlignment: MainAxisAlignment.start,
                    //   children: <Widget>[
                    //     Padding(
                    //       padding: const EdgeInsets.only(left: 19.0),
                    //       child: ButtonTheme(
                    //         minWidth: 110,
                    //         child: RaisedButton(
                    //           textColor: Colors.black,
                    //           color: Colors.lightBlue,
                    //           onPressed: () async {
                    //             String url = widget.linktokopedia;
                    //             if (await canLaunch(url)) {
                    //               await launch(url);
                    //             } else {
                    //               throw 'Could not launch $url';
                    //             }
                    //           },
                    //           child: Text('Tokopedia'),
                    //         ),
                    //       ),
                    //     ),
                    //   ],
                    // ),
                    // Row(
                    //   mainAxisAlignment: MainAxisAlignment.start,
                    //   children: <Widget>[
                    //     Padding(
                    //       padding: const EdgeInsets.only(left: 19.0),
                    //       child: ButtonTheme(
                    //         minWidth: 110,
                    //         child: RaisedButton(
                    //           textColor: Colors.black,
                    //           color: Colors.lightBlue,
                    //           onPressed: () async {
                    //             String url = widget.linkblanjadotcom;
                    //             if (await canLaunch(url)) {
                    //               await launch(url);
                    //             } else {
                    //               throw 'Could not launch $url';
                    //             }
                    //           },
                    //           child: Text('Belanja.com'),
                    //         ),
                    //       ),
                    //     ),
                    //   ],
                    // ),
                  ],
                )

                // Row(
                //   mainAxisAlignment: MainAxisAlignment.end,
                //   children: <Widget>[
                //     RaisedButton(
                //       onPressed: () async {
                //         String url = widget.linkbukalapak;
                //         if (await canLaunch(url)) {
                //           await launch(url);
                //         } else {
                //           throw 'Could not launch $url';
                //         }
                //       },
                //       child: Padding(
                //         padding: const EdgeInsets.all(8.0),
                //         child: Image.asset(
                //           'assets/images/iconbukalapak.png'
                //           width: 32,
                //           height: 32,
                //         ),
                //       ),
                //     ),
                //     RaisedButton(
                //        onPressed: () async {
                //         String url = widget.linklazada;
                //         if (await canLaunch(url)) {
                //           await launch(url);
                //         } else {
                //           throw 'Could not launch $url';
                //         }
                //       },
                //       child: Padding(
                //         padding: const EdgeInsets.all(8.0),
                //         child: Image.asset(
                //           'assets/images/iconlazada.png'
                //           width: 32,
                //           height: 32,
                //         ),
                //       ),
                //     ),
                //     RaisedButton(
                //        onPressed: () async {
                //         String url = widget.linkshoppe;
                //         if (await canLaunch(url)) {
                //           await launch(url);
                //         } else {
                //           throw 'Could not launch $url';
                //         }
                //       },
                //       child: Padding(
                //         padding: const EdgeInsets.all(8.0),
                //         child: Image.asset(
                //           'assets/images/iconshoppe.png'
                //           width: 32,
                //           height: 32,
                //         ),
                //       ),
                //     ),
                //     RaisedButton(
                //        onPressed: () async {
                //         String url = widget.linktokopedia;
                //         if (await canLaunch(url)) {
                //           await launch(url);
                //         } else {
                //           throw 'Could not launch $url';
                //         }
                //       },
                //       child: Padding(
                //         padding: const EdgeInsets.all(8.0),
                //         child: Image.asset(
                //           'assets/images/icontokopedia.png'
                //           width: 32,
                //           height: 32,
                //         ),
                //       ),
                //     ),
                //     RaisedButton(
                //        onPressed: () async {
                //         String url = widget.linkblanjadotcom;
                //         if (await canLaunch(url)) {
                //           await launch(url);
                //         } else {
                //           throw 'Could not launch $url';
                //         }
                //       },
                //       child: Padding(
                //         padding: const EdgeInsets.all(8.0),
                //         child: Image.asset(
                //           'assets/images/iconblanja.png'
                //           width: 32,
                //           height: 32,
                //         ),
                //       ),
                //     ),
                //   ],
                // )
              ],
            ),
          )
        ],
      ),
    );
  }
}
