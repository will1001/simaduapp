import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:simadu/model/ProviderDaftar.dart';

class BuatLaporanPenjualan extends StatefulWidget {
  @override
  _BuatLaporanPenjualanState createState() => _BuatLaporanPenjualanState();
}

class _BuatLaporanPenjualanState extends State<BuatLaporanPenjualan> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ChangeNotifierProvider<ProviderDaftar>(
      builder: (context) => ProviderDaftar(),
      child: Consumer<ProviderDaftar>(
        builder: (context, providerdaftar, _) => ListView(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(top: 51, bottom: 21),
                      child: Center(
                          child: Text(
                        'SIMADU | Rumah Kreatif BUMN',
                        style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                      )),
                    ),
                    Column(
                      children: providerdaftar.daftardata.map((f){
                      return Padding(
                      padding: const EdgeInsets.all(17.0),
                      child: Center(
                        child: TextField(
                          controller: f['Controller'],
                          onChanged: (String str) {
                            setState(() {
                              f['atributData'] = str;
                            });
                          },
                          decoration: InputDecoration(
                              icon: Icon(f['icon']),
                              hintText: f['Text'],
                              labelText: f['Text'],
                              errorText: f['Validation'] ? f['errorText'] : null,
                              ),
                        ),
                      ),
                    );
                    }).cast<Widget>().toList(),
                    ),
                    Column(
                      children: <Widget>[
                        RaisedButton(
                          onPressed: () {
                            setState(() {
                              for (var i = 0; i < providerdaftar.daftardata.length; i++) {
                                providerdaftar.daftardata[i]['Controller'].text.isEmpty
                                  ? providerdaftar.daftardata[i]['Validation'] = true
                                  : providerdaftar.daftardata[i]['Validation'] = false;
                              }
                            });
                          },
                          child: Text('Submit'),
                          textColor: Colors.black,
                          color: Colors.lightBlue,
                        ),
                      ],
                    ),
                  ],
                ),
        ),
      ),
    );
  }
}