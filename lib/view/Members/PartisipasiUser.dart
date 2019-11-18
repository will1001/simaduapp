import 'package:flutter/material.dart';
import 'package:simadu/model/PartisipasiAPI.dart';

class PartisipasiUser extends StatefulWidget {
  PartisipasiUser({Key key, this.namaPemilik, this.namaUsaha, this.idRegister})
      : super(key: key);

  final String namaPemilik;
  final String namaUsaha;
  final String idRegister;
  @override
  _PartisipasiUserState createState() => _PartisipasiUserState();
}

class _PartisipasiUserState extends State<PartisipasiUser> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Partisipasi',
          style: TextStyle(fontSize: 16.0),
        ),
      ),
      body: FutureBuilder<List<PartisipasiAPI>>(
          future: fetchPartisipasiAPI(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ListView(
                  children: snapshot.data.where((a)=>a.id_register==widget.idRegister).toList().
                  map((f) {
                return ExpansionTile(
                  title: Text(f.judul==null?'':f.judul),
                  children: <Widget>[
                    ListTile(
                      leading: Text('Tanggal Kegiatan'),
                      title: Text(f.tanggal==null?'':f.tanggal),
                    ),
                    ListTile(
                      leading: Text('Kehadiran'),
                      title: Text(f.kehadiran==null?'':f.kehadiran),
                    ),
                    // ListTile(
                    //   leading: Text('Unit Penjualan'),
                    //   title: Text(f.unit_penjualan==null?'':f.unit_penjualan),
                    // ),
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
      //                   builder: (c) => AddPartisipasiUser(
                            
      //                       )));
      //   },
      //   child: Icon(Icons.add),
      //   backgroundColor: Colors.lightBlue,
      // ),
    );
  }
}
