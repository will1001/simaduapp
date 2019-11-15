import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Gallery extends StatefulWidget {
  @override
  _GalleryState createState() => _GalleryState();
}

class _GalleryState extends State<Gallery> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            'Gallery',
            style: TextStyle(fontSize: 16.0),
          ),
        ),
        body: ListView(
          children: <Widget>[
            ListTile(
              leading: Icon(FontAwesomeIcons.calendar,color: Colors.blue,),
              title: Text('Agenda'),
            ),
            ListTile(
              leading: Icon(FontAwesomeIcons.youtube,color: Colors.red,),
              title: Text('Video Edukasi'),
            ),
            ListTile(
              leading: Icon(FontAwesomeIcons.question,color: Colors.blue,),
              title: Text('Quiz'),
            ),
            ListTile(
              leading: Icon(FontAwesomeIcons.graduationCap,color: Colors.red,),
              title: Text('Meminta Kelas'),
            ),
          ],
        ));
  }
}
