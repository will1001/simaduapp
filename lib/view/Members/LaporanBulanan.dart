import 'package:flutter/material.dart';
import 'package:simadu/model/LaporanBulananAPI.dart';
import 'package:simadu/view/Members/AddLaporanBulanan.dart';

class LaporanBulanan extends StatefulWidget {
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
                  children: snapshot.data.map((f) {
                return ExpansionTile(
                  title: Text(f.nama_produk),
                  children: <Widget>[
                    ListTile(
                      leading: Text('Jenis Produk'),
                      title: Text(f.jenis_produk),
                    ),
                    ListTile(
                      leading: Text('Tanggal'),
                      title: Text(f.tanggal),
                    ),
                    ListTile(
                      leading: Text('Unit Penjualan'),
                      title: Text(f.unit_penjualan),
                    ),
                    ListTile(
                      leading: Text('Satuan'),
                      title: Text(f.satuan),
                    ),
                    ListTile(
                      leading: Text('Harga'),
                      title: Text(f.harga),
                    ),
                    ListTile(
                      leading: Text('Total'),
                      title: Text(f.total),
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
                        builder: (c) => AddLaporanBulanan(
                            
                            )));
        },
        child: Icon(Icons.add),
        backgroundColor: Colors.lightBlue,
      ),
    );
  }
}
