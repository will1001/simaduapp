import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:simadu/view/Members/DaftarSertifikat.dart';

class MyLegal extends StatefulWidget {
  @override
  _MyLegalState createState() => _MyLegalState();
}

class _MyLegalState extends State<MyLegal> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            'My Legal',
            style: TextStyle(fontSize: 16.0),
          ),
        ),
        body: ListView(
          children: <Widget>[
            ListTile(
              leading: Image.asset('assets/images/031-certificate.png',width: 25,),
              title: Text('Sertifikat'),
              onTap: (){
                Navigator.of(context).push(MaterialPageRoute(
                        builder: (c) => DaftarSertifikat(
            //                 // id: f['id'],
            //                 // title: f['title'],
            //                 // desc: f['desc'],
            //                 // gambar: f['gambar'],
                            )));
              },
            ),
            // ListTile(
            //   leading: Icon(FontAwesomeIcons.youtube,color: Colors.red,),
            //   title: Text('Video Edukasi'),
            // ),
            // ListTile(
            //   leading: Icon(FontAwesomeIcons.question,color: Colors.blue,),
            //   title: Text('Quiz'),
            // ),
            // ListTile(
            //   leading: Icon(FontAwesomeIcons.graduationCap,color: Colors.red,),
            //   title: Text('Meminta Kelas'),
            // ),
          ],
        ));
  }
}
