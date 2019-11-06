import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:simadu/model/APIRegisterAll.dart';
import 'package:simadu/model/JenisProdukAPI.dart';
import 'package:simadu/model/KategoriAPI.dart';
import 'package:simadu/model/ProviderRekuesKelas.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

class AddLaporanBulanan extends StatefulWidget {
  @override
  _AddLaporanBulananState createState() => _AddLaporanBulananState();
}

class _AddLaporanBulananState extends State<AddLaporanBulanan> {
  String id_register;
  var _tanggal;
  String jenis_produkController;
  TextEditingController nama_produkController = new TextEditingController();
  TextEditingController unit_penjualanController = new TextEditingController();
  TextEditingController satuanController = new TextEditingController();
  TextEditingController hargaController = new TextEditingController();
  TextEditingController totalController = new TextEditingController();
  Future tambahDataLaporanBulanan() async {
    var responseJson;
    String url = "http://simadu.id/api/api_laporanbulanan.php";
    final response = await http.post(url, body: {
      "id_register": id_register,
      "tanggal": _tanggal.toString().substring(0,10),
      "jenis_produk": jenis_produkController,
      "nama_produk": nama_produkController.text,
      "unit_penjualan": unit_penjualanController.text,
      "satuan": satuanController.text,
      "harga": hargaController.text,
      "total": totalController.text,
    });
    responseJson = json.decode(response.body);
    if (responseJson.length == 0) {
      setState(() {
        msg = "Maaf Laporan Gagal di Simpan";
        warnapesan = Colors.red;
      });
    } else {
      //  if(responseJson[0]['username'])
      // Navigator.of(context).push(MaterialPageRoute(
      //     builder: (c) => LandingPage(
      //           selectedIndex: 5,
      //         )));
       setState(() {
        msg = responseJson['msg'];
        warnapesan = Colors.green;
      });
      
    }
  }

  bool validationUsername = false;
  String msg = '';
  Color warnapesan;

  var jenisproduklist;
  var registerlist;
  TextEditingController lainnyaController = new TextEditingController();
  DateTime _date = DateTime.now();
  TimeOfDay _time = TimeOfDay.now();
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<ProviderRekuesKelas>(
      builder: (context) => ProviderRekuesKelas(),
      child: Consumer<ProviderRekuesKelas>(
        builder: (context, providerrekueskelas, _) => Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: Text(
              'Laporan Bulanan',
              style: TextStyle(fontSize: 16.0),
            ),
          ),
          body: ListView(
            children: <Widget>[
              FutureBuilder<List<APIRegisterAll>>(
                future: fetchAPIRegisterAll(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    registerlist =
                        snapshot.data.map((d) => d.nama_pemilik).toList();
                    registerlist = registerlist.toSet().toList();

                    
                    
                    return Row(
                      children: <Widget>[
                        Padding(
                          padding:
                              const EdgeInsets.only(left: 16.0, right: 5.0),
                          child: Text('Nama Akun Anda :'),
                        ),
                        DropdownButton<String>(
                          hint: Text('Nama Akun'),
                          value: providerrekueskelas.namaakun,
                          icon: Icon(Icons.arrow_downward),
                          iconSize: 24,
                          elevation: 16,
                          style: TextStyle(color: Colors.black),
                          underline: Container(
                            height: 2,
                            color: Colors.black,
                          ),
                          onChanged: (String newValue) {
                            providerrekueskelas.namaakun = newValue.toString();
                            var idRegister = snapshot.data.where((a)=>a.nama_pemilik==newValue.toString()).map((d)=>d.id_register).toList();
                              setState(() {
                               id_register=idRegister[0]; 
                              });
                          },
                          items: (registerlist == null ? [''] : registerlist)
                              .map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                        ),
                      ],
                    );
                  }
                  return CircularProgressIndicator();
                },
              ),
              Row(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(left: 16.0, right: 50.0),
                    child: Text('Tanggal :'),
                  ),
                  
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Text(_tanggal == null
                        ? ''
                        : _tanggal.toString().substring(8, 10) +
                            ' ' +
                            convertbulan(_tanggal.toString().substring(5, 7)) +
                            ' ' +
                            _tanggal.toString().substring(0, 4)),
                  ),
                  IconButton(
                    icon: Icon(Icons.calendar_today),
                    onPressed: () {
                      DatePicker.showDatePicker(context,
                          showTitleActions: true,
                          minTime: DateTime(2010, 1, 1),
                          maxTime: DateTime(2099, 1, 1), onChanged: (date) {
                        setState(() {
                          _tanggal = date;
                        });
                      }, onConfirm: (date) {
                        setState(() {
                          _tanggal = date;
                        });
                      }, currentTime: DateTime.now(), locale: LocaleType.id);
                    },
                  ),
                ],
              ),
              FutureBuilder<List<JenisProdukAPI>>(
                future: fetchJenisProdukAPI(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    jenisproduklist =
                        snapshot.data.map((d) => d.jenis_produk).toList();

                    return Row(
                      children: <Widget>[
                        Padding(
                          padding:
                              const EdgeInsets.only(left: 16.0, right: 33.0),
                          child: Text('Jenis Produk :'),
                        ),
                        DropdownButton<String>(
                          hint: Text('Jenis Produk'),
                          value: providerrekueskelas.kelas,
                          icon: Icon(Icons.arrow_downward),
                          iconSize: 24,
                          elevation: 16,
                          style: TextStyle(color: Colors.black),
                          underline: Container(
                            height: 2,
                            color: Colors.black,
                          ),
                          onChanged: (String newValue) {
                            providerrekueskelas.kelas = newValue.toString();
                            setState(() {
                             jenis_produkController= newValue.toString();
                            });
                          },
                          items: (jenisproduklist == null ? [''] : jenisproduklist)
                              .map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                        ),
                      ],
                    );
                  }
                  return CircularProgressIndicator();
                },
              ),
              Padding(
                padding: const EdgeInsets.only(left: 16),
                child: TextField(
                  controller: nama_produkController,
                  decoration: InputDecoration(
                    icon: Container(width: 100,child: Text('Nama Produk :')),
                    hintText: 'Nama Produk',
                    labelText: 'Nama Produk',
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 16),
                child: TextField(
                  controller: unit_penjualanController,
                  decoration: InputDecoration(
                    icon: Container(width: 100,child: Text('Unit Penjualan :')),
                    hintText: 'Unit Penjualan',
                    labelText: 'Unit Penjualan',
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 16),
                child: TextField(
                  controller: satuanController,
                  decoration: InputDecoration(
                    icon: Container(width: 100,child: Text('Satuan Per Unit :')),
                    hintText: 'Satuan Per Unit ',
                    labelText: 'Satuan Per Unit',
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 16),
                child: TextField(
                  controller: hargaController,
                  decoration: InputDecoration(
                    icon: Container(width: 100,child: Text('Harga Per Unit :')),
                    hintText: 'Harga Per Unit',
                    labelText: 'Harga Per Unit',
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 16),
                child: TextField(
                  controller: totalController,
                  decoration: InputDecoration(
                    icon: Container(
                      width: 100,
                      child: Text('Total Penjualan Per Produk :')),
                    hintText: 'Total Penjualan Per Produk',
                    labelText: 'Total Penjualan Per Produk',
                  ),
                ),
              ),
              Column(
                children: <Widget>[
                  RaisedButton(
                    child: Text('Submit'),
                    textColor: Colors.black,
                    color: Colors.lightBlue,
                    onPressed: () {
                      tambahDataLaporanBulanan();
                    },
                  ),
                  Center(
                      child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      msg,
                      style: TextStyle(color: Colors.green),
                    ),
                  )),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  convertbulan(String angkabulan) {
    if (angkabulan == '01') {
      return 'Januari';
    }
    if (angkabulan == '02') {
      return 'Februari';
    }
    if (angkabulan == '03') {
      return 'Maret';
    }
    if (angkabulan == '04') {
      return 'April';
    }
    if (angkabulan == '05') {
      return 'Mei';
    }
    if (angkabulan == '06') {
      return 'Juni';
    }
    if (angkabulan == '07') {
      return 'Juli';
    }
    if (angkabulan == '08') {
      return 'Agustus';
    }
    if (angkabulan == '09') {
      return 'September';
    }
    if (angkabulan == '10') {
      return 'Oktober';
    }
    if (angkabulan == '11') {
      return 'November';
    }
    if (angkabulan == '12') {
      return 'Desember';
    }
  }
}
