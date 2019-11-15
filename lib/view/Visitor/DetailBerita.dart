import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

class DetailBerita extends StatefulWidget {
  DetailBerita(
      {Key key,
      this.id,
      this.title,
      this.desc,
      this.gambar,
      this.tanggal,
      this.penulis})
      : super(key: key);

  final String id;
  final String title;
  final String desc;
  final String gambar;
  final String tanggal;
  final String penulis;
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
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    widget.title,
                    style: TextStyle(fontWeight: FontWeight.w400, fontSize: 21),
                  ),
                ),
                // Padding(
                //   padding: const EdgeInsets.only(left:8.0),
                //   child: Text('Oleh ${widget.penulis}'),
                // ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: <Widget>[
                       Icon(Icons.person,color: Colors.lightBlue,size: 15,),
                       Padding(
                         padding: const EdgeInsets.only(left:3.0),
                         child: Text('${widget.penulis}'),
                       ),
                      Padding(
                        padding: const EdgeInsets.only(right :5.0,left: 5.0),
                        child: Icon(Icons.calendar_today,color: Colors.lightBlue,size: 15,),
                      ),
                      Text(widget.tanggal)
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 1.0),
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
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    widget.desc,
                    style: TextStyle(color: Colors.grey),
                  ),
                ),
                // Row(
                //   mainAxisAlignment: MainAxisAlignment.end,
                //   children: <Widget>[Text(widget.tanggal)],
                // )
              ],
            ),
          )
        ],
      ),
    );
  }
}
