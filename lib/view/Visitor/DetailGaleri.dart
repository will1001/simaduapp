import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

import '../LandingPage.dart';

class DetailGaleri extends StatefulWidget {
  DetailGaleri({Key key, this.id, this.title, this.desc, this.gambar})
      : super(key: key);

  final String id;
  final String title;
  final String desc;
  final String gambar;
  @override
  _DetailGaleriState createState() => _DetailGaleriState();
}

class _DetailGaleriState extends State<DetailGaleri> {
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
                            child: Image.network(widget.gambar),
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
                Padding(
                  padding: const EdgeInsets.only(left: 19.0, top: 8, bottom: 8),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        widget.desc,
                        style: TextStyle(color: Colors.grey),
                      ),
                    ],
                  ),
                ),
                Column(
                  children: <Widget>[
                    RaisedButton(
                      child: Text('Daftar'),
                      textColor: Colors.black,
                      color: Colors.lightBlue,
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (c) => LandingPage(
                                  selectedIndex: 5,
                                )));
                      },
                    )
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
