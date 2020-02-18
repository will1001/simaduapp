import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

import '../LandingPage.dart';

class DetailGaleri extends StatefulWidget {
  DetailGaleri({Key key, this.id, this.title, this.desc, this.gambar,this.tanggal})
      : super(key: key);

  final String id;
  final String title;
  final String desc;
  final String gambar;
  final String tanggal;
  @override
  _DetailGaleriState createState() => _DetailGaleriState();
}

class _DetailGaleriState extends State<DetailGaleri> {
  @override
  Widget build(BuildContext context) {
    timeDilation = 3.0;
    return Scaffold(
       appBar: AppBar(
        
      ),
      body: ListView(
        children: <Widget>[
          Card(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                 Padding(
                  padding: const EdgeInsets.only(left:19.0,right: 19),
                  child: Text(
                    widget.title,
                    style: TextStyle(fontWeight: FontWeight.w400, fontSize: 21),
                  ),
                ),
                // Row(
                //     children: <Widget>[
                       
                //       Padding(
                //         padding: const EdgeInsets.only(right :5.0,left: 5.0),
                //         child: Icon(Icons.calendar_today,color: Colors.lightBlue,size: 15,),
                //       ),
                //       Text(widget.tanggal.toString())
                //     ],
                //   ),
                Padding(
                  padding: const EdgeInsets.only(left:19.0,right: 19),
                  child: Container(
                    height: 200,
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
                  padding: const EdgeInsets.only(left: 19.0,right: 19),
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
                    Padding(
                      padding: const EdgeInsets.only(left:19.0),
                      child: RaisedButton(
                        child: Text('Daftar Sekarang'),
                        textColor: Colors.white,
                        color: Colors.lightBlue,
                        onPressed: () {
                          
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (c) => LandingPage(
                                    selectedIndex: 5,
                                  )));
                        },
                      ),
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
