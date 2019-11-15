import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:simadu/view/Members/Summary.dart';

class MyPerformance extends StatefulWidget {
  @override
  _MyPerformanceState createState() => _MyPerformanceState();
}

class _MyPerformanceState extends State<MyPerformance> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            'My Performance',
            style: TextStyle(fontSize: 16.0),
          ),
        ),
        body: ListView(
          children: <Widget>[
            ListTile(
              // leading: Icon(FontAwesomeIcons.calendar,color: Colors.blue,),
              title: Text('Partisipasi'),
              trailing: Text('91%'),
            ),
            ListTile(
              // leading: Icon(FontAwesomeIcons.youtube,color: Colors.red,),
              title: Text('Perkembangan'),
              trailing: Text('45%'),
            ),
            ListTile(
              leading: Icon(FontAwesomeIcons.chartBar,color: Colors.blue,),
              title: Text('Summary'),
              onTap: (){
                 Navigator.of(context).push(MaterialPageRoute(
                    builder: (c) => Summary(
                        )));
              },
            ),
            // ListTile(
            //   leading: Icon(FontAwesomeIcons.graduationCap,color: Colors.red,),
            //   title: Text('Meminta Kelas'),
            // ),
          ],
        ));
  }
}
