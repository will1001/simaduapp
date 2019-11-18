import 'package:flutter/material.dart';
import 'package:simadu/model/PartisipasiAPI.dart';
import 'package:simadu/model/PerkembanganAPI.dart';

class PerkembanganUser extends StatefulWidget {
  PerkembanganUser({Key key, this.namaPemilik, this.namaUsaha, this.idRegister})
      : super(key: key);

  final String namaPemilik;
  final String namaUsaha;
  final String idRegister;
  @override
  _PerkembanganUserState createState() => _PerkembanganUserState();
}

class _PerkembanganUserState extends State<PerkembanganUser> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Perkembangan',
          style: TextStyle(fontSize: 16.0),
        ),
      ),
      body: FutureBuilder<List<PerkembanganAPI>>(
          future: fetchPerkembanganAPI(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ListView(
                  children: snapshot.data.where((a)=>a.id_register==widget.idRegister).toList().
                  map((f) {
                return ExpansionTile(
                  title: Text('Soal nomor ${f.id_soal==null?'':f.id_soal}'),
                  children: <Widget>[
                    ListTile(
                      leading: Text('Benar'),
                      title: Text(f.benar==null?'':f.benar),
                    ),
                    ListTile(
                      leading: Text('Salah'),
                      title: Text(f.salah==null?'':f.salah),
                    ),
                    ListTile(
                      leading: Text('Skor'),
                      title: Text(f.skor==null?'':f.skor),
                    ),
                    // ListTile(
                    //   leading: Text('Satuan'),
                    //   title: Text(f.satuan==null?'':f.satuan),
                    // ),
                    // ListTile(
                    //   leading: Text('Harga'),
                    //   title: Text(f.harga==null?'':f.harga),
                    // ),
                    // ListTile(
                    //   leading: Text('Total'),
                    //   title: Text(f.total==null?'':f.total),
                    // ),
                  ],
                );
              }).toList());
            }
            return CircularProgressIndicator();
          }),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () {
      //     Navigator.of(context).push(MaterialPageRoute(
      //                   builder: (c) => AddPerkembanganUser(
                            
      //                       )));
      //   },
      //   child: Icon(Icons.add),
      //   backgroundColor: Colors.lightBlue,
      // ),
    );
  }
}
