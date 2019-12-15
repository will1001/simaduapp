import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:simadu/model/Agenda.dart';
import 'package:simadu/view/Members/AgendaUser.dart';
import 'package:simadu/view/Members/Quiz.dart';
import 'package:simadu/view/Members/RequestKelas.dart';

import 'VideoEdukasi.dart';

class Myclass extends StatefulWidget {
  Myclass({Key key, this.idRegister})
      : super(key: key);

  final String idRegister;
  @override
  _MyclassState createState() => _MyclassState();
}

class _MyclassState extends State<Myclass> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            'Kelas',
            style: TextStyle(fontSize: 16.0),
          ),
        ),
        body: ListView(
          children: <Widget>[
            ListTile(
              leading: Icon(FontAwesomeIcons.calendar,color: Colors.blue,),
              title: Text('Agenda'),
              onTap: (){
                Navigator.of(context).push(MaterialPageRoute(
                        builder: (c) => AgendaUser(
                          idRegister: widget.idRegister,
            //                 // id: f['id'],
            //                 // title: f['title'],
            //                 // desc: f['desc'],
            //                 // gambar: f['gambar'],
                            )));
              },
            ),
            ListTile(
              leading: Icon(FontAwesomeIcons.youtube,color: Colors.red,),
              title: Text('Video'),
              onTap: (){
                Navigator.of(context).push(MaterialPageRoute(
                        builder: (c) => VideoEdukasi(
            //                 // id: f['id'],
            //                 // title: f['title'],
            //                 // desc: f['desc'],
            //                 // gambar: f['gambar'],
                            )));
              },
            ),
            ListTile(
              leading: Icon(FontAwesomeIcons.question,color: Colors.blue,),
              title: Text('Kuis'),
              onTap: (){
                Navigator.of(context).push(MaterialPageRoute(
                        builder: (c) => Quiz(
                                idRegister:widget.idRegister
            //                 // id: f['id'],
            //                 // title: f['title'],
            //                 // desc: f['desc'],
            //                 // gambar: f['gambar'],
                            )));
              },
            ),
            ListTile(
              leading: Icon(FontAwesomeIcons.graduationCap,color: Colors.red,),
              title: Text('Meminta Kelas'),
              onTap: (){
                Navigator.of(context).push(MaterialPageRoute(
                        builder: (c) => RequestKelas(
                          idRegister: widget.idRegister,
            //                 // id: f['id'],
            //                 // title: f['title'],
            //                 // desc: f['desc'],
            //                 // gambar: f['gambar'],
                            )));
              },
            ),
          ],
        ));
  }
}
