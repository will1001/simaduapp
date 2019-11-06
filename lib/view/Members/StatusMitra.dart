import 'package:flutter/material.dart';
import 'package:simadu/model/StatusMitraAPI.dart';

class StatusMitra extends StatefulWidget {
  @override
  _StatusMitraState createState() => _StatusMitraState();
}

class _StatusMitraState extends State<StatusMitra> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
          title: Text(
            'Status Mitra',
            style: TextStyle(fontSize: 16.0),
          ),
      ),
      body: FutureBuilder<List<StatusMitraAPI>>(
          future: fetchStatusMitraAPI(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ListView(
                children: snapshot.data.map((f){
                  return ExpansionTile(
                    title: Text(f.nama),
                    children: <Widget>[
                      ListTile(
                        leading: Text('Tanggal'),
                        title: Text(f.tanggal),
                      ),
                      ListTile(
                        leading: Text('Mitra'),
                        title: Text(f.mitra),
                      ),
                      ListTile(
                        leading: Text('Lainnya'),
                        title: Text(f.lainya),
                      ),
                    ],
                  );
                }).toList(),
                
              );
            }
            return CircularProgressIndicator();
          }),
    );
  }
}