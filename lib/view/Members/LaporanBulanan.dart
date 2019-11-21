import 'package:flutter/material.dart';
import 'package:simadu/model/LaporanBulananAPI.dart';
import 'package:simadu/view/Members/AddLaporanBulanan.dart';

class LaporanBulanan extends StatefulWidget {
  LaporanBulanan({Key key, this.namaPemilik, this.namaUsaha, this.idRegister})
      : super(key: key);

  final String namaPemilik;
  final String namaUsaha;
  final String idRegister;
  @override
  _LaporanBulananState createState() => _LaporanBulananState();
}

class _LaporanBulananState extends State<LaporanBulanan> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Laporan Bulananan',
          style: TextStyle(fontSize: 16.0),
        ),
      ),
      body: FutureBuilder<List<LaporanBulananAPI>>(
          future: fetchLaporanBulananAPI(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ListView(
                  children: snapshot.data.where((a)=>a.id_register==widget.idRegister).toList().
                  map((f) {
                return Column(
                  children: <Widget>[
                    ExpansionTile(
                      title: Text(f.nama_produk==null?'':f.nama_produk),
                      children: <Widget>[
                        ListTile(
                          leading: Text('Jenis Produk'),
                          title: Text(f.jenis_produk==null?'':f.jenis_produk),
                        ),
                        ListTile(
                          leading: Text('Tanggal'),
                          title: Text(f.tanggal==null?'':f.tanggal),
                        ),
                        ListTile(
                          leading: Text('Unit Penjualan'),
                          title: Text(f.unit_penjualan==null?'':f.unit_penjualan),
                        ),
                        ListTile(
                          leading: Text('Satuan'),
                          title: Text(f.satuan==null?'':f.satuan),
                        ),
                        ListTile(
                          leading: Text('Harga'),
                          title: Text(f.harga==null?'':f.harga),
                        ),
                        ListTile(
                          leading: Text('Total'),
                          title: Text(f.total==null?'':f.total),
                        ),
                      ],
                    ),
                     Container(
                      width: MediaQuery.of(context).size.width,
                      height: 1,
                      color: Colors.black38,
                    )
                  ],
                );
              }).toList());
            }
            return CircularProgressIndicator();
          }),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(
                        builder: (c) => AddLaporanBulanan(
                          idRegister: widget.idRegister,
                            
                            )));
        },
        child: Icon(Icons.add),
        backgroundColor: Colors.lightBlue,
      ),
    );
  }
}
