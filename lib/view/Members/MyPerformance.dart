import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:simadu/model/ListTahunLaporanBulanan.dart';
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
  String _tahunchart = DateTime.now().toString().substring(0, 4);
  var listtahun;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            'Performa',
            style: TextStyle(fontSize: 16.0),
          ),
        ),
        body: ListView(
          children: <Widget>[
            ListTile(
              leading: Icon(
                FontAwesomeIcons.businessTime,
                color: Colors.blue,
              ),
              // title: Icon(FontAwesomeIcons.meetup,color: Colors.blue,),
              title: Text('Partisipasi'),
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (c) => PartisipasiUser(
                          idRegister: widget.idRegister,
                        )));
              },
            ),
            ListTile(
              leading: Icon(
                FontAwesomeIcons.chartLine,
                color: Colors.blue,
              ),
              // title: Icon(FontAwesomeIcons.meetup,color: Colors.blue,),
              title: Text('Skor Kuis'),
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (c) => PerkembanganUser(
                          idRegister: widget.idRegister,
                        )));
              },
            ),

            ListTile(
              leading: Icon(
                FontAwesomeIcons.chartBar,
                color: Colors.blue,
              ),
              title: Text('Perkembangan'),
              trailing: FutureBuilder<List<ListTahunLaporanBulanan>>(
                  future: fetchListTahunLaporanBulanan(),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      var data =
                          snapshot.data.where((a) => a.tahun != '').toList();

                      listtahun = data.map((f) {
                        return f.tahun;
                      }).toList();

                      return DropdownButton<String>(
                        value: _tahunchart,
                        icon: Icon(Icons.keyboard_arrow_down),
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
                        items: listtahun
                            .map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                      );
                    }
                    return CircularProgressIndicator();
                  }),
              onTap: () {
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
