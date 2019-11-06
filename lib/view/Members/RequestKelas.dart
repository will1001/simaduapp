import 'package:flutter/material.dart';
import 'package:simadu/model/RekuesKelasAPI.dart';
import 'package:simadu/view/Members/AddRequestKelas.dart';

class RequestKelas extends StatefulWidget {
  @override
  _RequestKelasState createState() => _RequestKelasState();
}

class _RequestKelasState extends State<RequestKelas> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Rekues Kelas',
          style: TextStyle(fontSize: 16.0),
        ),
      ),
      body: FutureBuilder<List<RekuesKelasAPI>>(
          future: fetchRekuesKelasAPI(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ListView(
                  children: snapshot.data.map((f) {
                return ExpansionTile(
                  title: Text(f.kelas),
                  children: <Widget>[
                    ListTile(
                      leading: Text('Tanggal'),
                      title: Text(f.tanggal),
                    ),
                    ListTile(
                      leading: Text('Lainnya'),
                      title: Text(f.lainya),
                    ),
                  ],
                );
              }).toList());
            }
            return CircularProgressIndicator();
          }),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(
                        builder: (c) => AddRequestKelas(
                            
                            )));
        },
        child: Icon(Icons.add),
        backgroundColor: Colors.lightBlue,
      ),
    );
  }
}
