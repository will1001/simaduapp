import 'package:flutter/material.dart';
import 'package:simadu/model/PinjamanDanaAPI.dart';
import 'package:url_launcher/url_launcher.dart';

class PinjamanDana extends StatefulWidget {
  @override
  _PinjamanDanaState createState() => _PinjamanDanaState();
}

class _PinjamanDanaState extends State<PinjamanDana> {
  int no = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Pinjaman Dana',
          style: TextStyle(fontSize: 16.0),
        ),
      ),
      body: FutureBuilder<List<PinjamanDanaAPI>>(
          future: fetchPinjamanDanaAPI(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ListView(
                  children: snapshot.data.map((f) {
                return Column(
                  children: <Widget>[
                    ListTile(
                      leading: Text((no++).toString() + '.'),
                      title: Text(f.judul),
                      trailing: RaisedButton(
                        onPressed: () async {
                          String url = f.link;
                          if (await canLaunch(url)) {
                            await launch(url);
                          } else {
                            throw 'Could not launch $url';
                          }
                        },
                        child: Text('Read More'),
                        textColor: Colors.black,
                        color: Colors.lightBlue,
                      ),
                      onTap: () async {
                        // String url = f.link;
                        // if (await canLaunch(url)) {
                        //   await launch(url);
                        // } else {
                        //   throw 'Could not launch $url';
                        // }
                      },
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        color: Colors.black,
                        height: 1,
                      ),
                    )
                  ],
                );
              }).toList());
            }
            return CircularProgressIndicator();
          }),
    );
  }
}
