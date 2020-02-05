import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:simadu/model/APIRegisterAll.dart';
import 'package:simadu/model/KategoriAPI.dart';
import 'package:simadu/model/ProviderRekuesKelas.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

class DaftarPinjaman extends StatefulWidget {
  DaftarPinjaman({Key key, this.idRegister, this.title}) : super(key: key);

  final String idRegister;
  final String title;
  @override
  _DaftarPinjamanState createState() => _DaftarPinjamanState();
}

class _DaftarPinjamanState extends State<DaftarPinjaman> {
  String id_register;
  String _status;
  var _tanggal;
  String _mitra;
  TextEditingController jmlpinjamanController = new TextEditingController();
  TextEditingController keperluanController = new TextEditingController();
  TextEditingController lamapinjamanController = new TextEditingController();
  TextEditingController lamaberdiriusahaController =
      new TextEditingController();
  TextEditingController riwayatpinjamanController = new TextEditingController();
  TextEditingController riwayatjumlahpinjamanController = new TextEditingController();
  TextEditingController riwayatsumberpinjamanController = new TextEditingController();
  Future rekueskelas() async {
    var responseJson;
    String url = "http://simadu.id/api/daftar_pinjaman_api.php";
    final response = await http.post(url, body: {
      "id_register": widget.idRegister,
      "judul": widget.title,
      "jumlah":
          jmlpinjamanController.text == '' ? '' : jmlpinjamanController.text,
      "keperluan":
          keperluanController.text == '' ? '' : keperluanController.text,
      "lama_peminjaman":
          lamapinjamanController.text == '' ? '' : lamapinjamanController.text,
      "lama_usaha": lamaberdiriusahaController.text == ''
          ? ''
          : lamaberdiriusahaController.text,
      // "riwayat_pinjaman": riwayatpinjamanController.text == ''
      //     ? ''
      //     : riwayatpinjamanController.text,
      "jml_pinjaman": riwayatjumlahpinjamanController.text == ''
          ? ''
          : riwayatjumlahpinjamanController.text,
      "sumber_pinjaman": riwayatsumberpinjamanController.text == ''
          ? ''
          : riwayatsumberpinjamanController.text,
      "status": _status == null
          ? ''
          : _status,
    });
    responseJson = json.decode(response.body);
    if (responseJson.length == 0) {
      setState(() {
        msg = "Maaf Laporan Gagal di Simpan";
        warnapesan = Colors.red;
      });
    } else {
      setState(() {
        msg = responseJson['msg'];
        warnapesan = Colors.green;
      });
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text('Berhasil'),
              content: Text(
                msg,
                style: TextStyle(color: Colors.green),
              ),
            );
          });

      Future.delayed(
        Duration(seconds: 3),
        () {
          Navigator.pop(context);
          Navigator.pop(context);
        },
      );
    }
  }

  Color warnapesan;
  String msg = '';
  var kategorillist;
  var registerlist;
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
              'Pinjaman Dana',
              style: TextStyle(fontSize: 16.0),
            ),
          ),
          body: ListView(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(left: 16.0, top: 25.0),
                child: Row(
                  children: <Widget>[
                    Container(width: 100, child: Text('Pinjaman')),
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: Container(
                          width: 220,
                          decoration: BoxDecoration(
                              border:
                                  Border.all(color: Colors.black12, width: 1)),
                          child: Container(
                              color: Colors.black12,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(widget.title),
                              ))),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 16),
                child: TextField(
                  controller: jmlpinjamanController,
                  decoration: InputDecoration(
                    icon:  Container(width: 100, child: Text('Jumlah Pinjaman :'),),
                    hintText: 'Jumlah Pinjaman',
                    labelText: '0',
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 16),
                child: TextField(
                  controller: keperluanController,
                  decoration: InputDecoration(
                    icon:  Container(width: 100, child: Text('Keperluan :'),),
                    hintText: 'Keperluan',
                    labelText: 'Digunakan Untuk Apa Pinjaman Dana?',
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 16),
                child: TextField(
                  controller: lamapinjamanController,
                  decoration: InputDecoration(
                    icon:  Container(width: 100, child: Text('Lama Peminjaman:'),),
                    hintText: 'Lama Peminjaman ?',
                    labelText: 'Lama Peminjaman',
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 16),
                child: TextField(
                  controller: lamaberdiriusahaController,
                  decoration: InputDecoration(
                    icon:  Container(width: 100, child: Text('Lama Berdiri Usaha :'),),
                    hintText: 'Lama Berdiri Usaha ?',
                    labelText: 'Lama Berdiri Usaha',
                  ),
                ),
              ),
              // Padding(
              //   padding: const EdgeInsets.only(left: 16),
              //   child: TextField(
              //     controller: riwayatpinjamanController,
              //     decoration: InputDecoration(
              //       icon:  Container(width: 100, child: Text('Riwayat Pinjaman :'),),
              //       hintText: 'Riwayat Pinjaman',
              //       labelText: 'Riwayat Pinjaman',
              //     ),
              //   ),
              // ),
              Padding(
                padding: const EdgeInsets.only(top:31.0),
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: 1,
                  color: Colors.black38,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(11.0),
                child: Text('Riwayat Pinjaman'),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 16),
                child: TextField(
                  controller: riwayatjumlahpinjamanController,
                  decoration: InputDecoration(
                    icon: Container(width: 100, child: Text('Jumlah Pinjaman :')),
                    hintText: 'Jumlah Pinjaman',
                    labelText: '0',
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 16),
                child: TextField(
                  controller: riwayatsumberpinjamanController,
                  decoration: InputDecoration(
                    icon: Container(width: 100, child: Text('Sumber Pinjaman :')),
                    hintText: 'Sumber Pinjaman',
                    labelText: 'Sumber Pinjaman',
                  ),
                ),
              ),
              Row(
                children: <Widget>[
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 21.0, right: 66.0, top: 25),
                    child: Text('status :'),
                  ),
                  DropdownButton<String>(
                    value: _status,
                    icon: Icon(Icons.keyboard_arrow_down),
                    iconSize: 24,
                    elevation: 16,
                    style: TextStyle(color: Colors.black),
                    underline: Container(
                      height: 1,
                      color: Colors.black38,
                    ),
                    onChanged: (String newValue) {
                      setState(() {
                        _status = newValue.toString();
                      });
                    },
                    items: ['Lunas', 'Belum']
                        .map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                  ),
                ],
              ),
              Column(
                children: <Widget>[
                  RaisedButton(
                    child: Text('simpan'),
                    textColor: Colors.black,
                    color: Colors.lightBlue,
                    onPressed: () {
                      rekueskelas();
                    },
                  ),
                  // Center(
                  //     child: Padding(
                  //   padding: const EdgeInsets.all(8.0),
                  //   child: Text(
                  //     msg,
                  //     style: TextStyle(color: Colors.green),
                  //   ),
                  // )),
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
