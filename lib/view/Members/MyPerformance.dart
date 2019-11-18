import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:simadu/view/Members/PartisipasiUser.dart';
import 'package:simadu/view/Members/PerkembanganUser.dart';
import 'package:simadu/view/Members/Summary.dart';

class MyPerformance extends StatefulWidget {
   MyPerformance({Key key, this.namaPemilik, this.namaUsaha, this.idRegister})
      : super(key: key);

  final String namaPemilik;
  final String namaUsaha;
  final String idRegister;
  @override
  _MyPerformanceState createState() => _MyPerformanceState();
}

class _MyPerformanceState extends State<MyPerformance> {
  String _tahunchart=DateTime.now().toString().substring(0, 4);
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
              leading: Icon(FontAwesomeIcons.businessTime,color: Colors.blue,),
              // title: Icon(FontAwesomeIcons.meetup,color: Colors.blue,),
              title: Text('Partisipasi'),
              onTap: (){
                 Navigator.of(context).push(MaterialPageRoute(
                    builder: (c) => PartisipasiUser(
                      idRegister: widget.idRegister,
                        )));
              },
            ),
            ListTile(
              leading: Icon(FontAwesomeIcons.chartLine,color: Colors.blue,),
              // title: Icon(FontAwesomeIcons.meetup,color: Colors.blue,),
              title: Text('Perkembangan'),
              onTap: (){
                 Navigator.of(context).push(MaterialPageRoute(
                    builder: (c) => PerkembanganUser(
                      idRegister: widget.idRegister,
                        )));
              },
            ),
            ListTile(
              leading: Icon(FontAwesomeIcons.chartBar,color: Colors.blue,),
              title: Text('Summary'),
              trailing: DropdownButton<String>(
                            value: _tahunchart,
                            icon: Icon(Icons.arrow_downward),
                            iconSize: 24,
                            elevation: 16,
                            style: TextStyle(color: Colors.black),
                            underline: Container(
                              height: 2,
                              color: Colors.black,
                            ),
                            onChanged: (String newValue) {
                              setState(() {
                                _tahunchart = newValue.toString();
                              });
                            },
                            items: ['2019', '2020', '2021']
                                .map<DropdownMenuItem<String>>((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(value),
                              );
                            }).toList(),
                          ),
              onTap: (){
                 Navigator.of(context).push(MaterialPageRoute(
                    builder: (c) => Summary(
                      idRegister: widget.idRegister,
                      tahunchart: _tahunchart,
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
