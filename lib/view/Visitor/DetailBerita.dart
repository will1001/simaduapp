import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

class DetailBerita extends StatefulWidget {
   DetailBerita({Key key, this.id,this.title,this.desc,this.gambar, this.tanggal}) : super(key: key);

  final String id;
  final String title;
  final String desc;
  final String gambar;
  final String tanggal;
  @override
  _DetailBeritaState createState() => _DetailBeritaState();
}

class _DetailBeritaState extends State<DetailBerita> {
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
                  )
                ),
              ),
            ),
            Text(widget.title),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                widget.desc
                ,style: TextStyle(color: Colors.grey),
                ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                Text(widget.tanggal)
              ],
            )
              ],
            ),
          )
        ],
      ),
    );
  }
}