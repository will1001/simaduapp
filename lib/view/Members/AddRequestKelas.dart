import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:simadu/model/APIRegisterAll.dart';
import 'package:simadu/model/KategoriAPI.dart';
import 'package:simadu/model/ProviderRekuesKelas.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

class AddRequestKelas extends StatefulWidget {
   AddRequestKelas({Key key, this.idRegister})
      : super(key: key);

  final String idRegister;
  @override
  _AddRequestKelasState createState() => _AddRequestKelasState();
}

class _AddRequestKelasState extends State<AddRequestKelas> {
  String id_register;
  var _tanggal;
  String _kelas;
  TextEditingController lainnyaController = new TextEditingController();
  Future rekueskelas() async {
    var responseJson;
    String url = "http://simadu.id/api/api_rekueskelas.php";
    final response = await http.post(url, body: {
      "id_register": widget.idRegister,
      "tanggal": DateTime.now().toString().substring(0,10),
      "kelas": _kelas,
      "lainya":lainnyaController.text==''?'':lainnyaController.text,
      "status": 'Menunggu',
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
              'Rekues Kelas',
              style: TextStyle(fontSize: 16.0),
            ),
          ),
          body: ListView(
            children: <Widget>[
              // Text(DateTime.now().toString().substring(0,10)),
              // FutureBuilder<List<APIRegisterAll>>(
              //   future: fetchAPIRegisterAll(),
              //   builder: (context, snapshot) {
              //     if (snapshot.hasData) {
              //       registerlist =
              //           snapshot.data.map((d) => d.nama_pemilik).toList();
              //       registerlist = registerlist.toSet().toList();
              //       // lsttahun.remove('null');
              //       // lsttahun.sort();

              //       return Row(
              //         children: <Widget>[
              //           Padding(
              //             padding:
              //                 const EdgeInsets.only(left: 16.0, right: 5.0),
              //             child: Text('Nama Akun Anda :'),
              //           ),
              //           DropdownButton<String>(
              //             hint: Text('Nama Akun'),
              //             value: providerrekueskelas.namaakun,
              //             icon: Icon(Icons.arrow_downward),
              //             iconSize: 24,
              //             elevation: 16,
              //             style: TextStyle(color: Colors.black),
              //             underline: Container(
              //               height: 2,
              //               color: Colors.black,
              //             ),
              //             onChanged: (String newValue) {
              //               providerrekueskelas.namaakun = newValue.toString();
              //               var idRegister = snapshot.data.where((a)=>a.nama_pemilik==newValue.toString()).map((d)=>d.id_register).toList();
              //                 setState(() {
              //                  id_register=idRegister[0]; 
              //                 });
              //             },
              //             items: (registerlist == null ? [''] : registerlist)
              //                 .map<DropdownMenuItem<String>>((String value) {
              //               return DropdownMenuItem<String>(
              //                 value: value,
              //                 child: Text(value),
              //               );
              //             }).toList(),
              //           ),
              //         ],
              //       );
              //     }
              //     return CircularProgressIndicator();
              //   },
              // ),
              // FutureBuilder<List<KategoriAPI>>(
              //   future: fetchKategoriAPI(),
              //   builder: (context, snapshot) {
              //     if (snapshot.hasData) {
              //       kategorillist =
              //           snapshot.data.map((d) => d.kategori_usaha).toList();
              //       // lsttahun = lsttahun.toSet().toList();
              //       // lsttahun.remove('null');
              //       // lsttahun.sort();

              //       return Row(
              //         children: <Widget>[
              //           Padding(
              //             padding:
              //                 const EdgeInsets.only(left: 16.0, right: 79.0),
              //             child: Text('Kelas :'),
              //           ),
              //           DropdownButton<String>(
              //             hint: Text('Kelas'),
              //             value: providerrekueskelas.kelas,
              //             icon: Icon(Icons.arrow_downward),
              //             iconSize: 24,
              //             elevation: 16,
              //             style: TextStyle(color: Colors.black),
              //             underline: Container(
              //               height: 2,
              //               color: Colors.black,
              //             ),
              //             onChanged: (String newValue) {
              //               providerrekueskelas.kelas = newValue.toString();
              //               setState(() {
              //                kelasController=newValue.toString();
              //               });
              //             },
              //             items: (kategorillist == null ? [''] : kategorillist)
              //                 .map<DropdownMenuItem<String>>((String value) {
              //               return DropdownMenuItem<String>(
              //                 value: value,
              //                 child: Text(value),
              //               );
              //             }).toList(),
              //           ),
              //         ],
              //       );
              //     }
              //     return CircularProgressIndicator();
              //   },
              // ),
              // Row(
              //   children: <Widget>[
              //     Padding(
              //       padding: const EdgeInsets.only(left: 16.0, right: 50.0),
              //       child: Text('Tanggal :'),
              //     ),
                  
              //     Text(_tanggal == null
              //         ? ''
              //         : _tanggal.toString().substring(8, 10) +
              //             ' ' +
              //             convertbulan(_tanggal.toString().substring(5, 7)) +
              //             ' ' +
              //             _tanggal.toString().substring(0, 4))
              //             ,
              //             IconButton(
              //       icon: Icon(Icons.calendar_today),
              //       onPressed: () {
              //         DatePicker.showDatePicker(context,
              //             showTitleActions: true,
              //             minTime: DateTime(2010, 1, 1),
              //             maxTime: DateTime(2099, 1, 1), onChanged: (date) {
              //           setState(() {
              //             _tanggal = date;
              //           });
              //         }, onConfirm: (date) {
              //           setState(() {
              //             _tanggal = date;
              //           });
              //         }, currentTime: DateTime.now(), locale: LocaleType.id);
              //       },
              //     ),
              //   ],
              // ),
              Row(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(left: 16.0, right: 27.0),
                    child: Text('Kelas :'),
                  ),
                  DropdownButton<String>(
                    hint: Text('Kelas'),
                    value: _kelas,
                    icon: Icon(Icons.arrow_downward),
                    iconSize: 24,
                    elevation: 16,
                    style: TextStyle(color: Colors.black),
                    underline: Container(
                      height: 2,
                      color: Colors.black,
                    ),
                    onChanged: (String newValue) {
                      setState(() {
                        _kelas = newValue.toString();
                      });
                    },
                    items: ['Manajemen Pemasaran', 'Manajemen Keuangan','Manajemen Operasional','Manajemen SDM','Desain dan Pengembangan Produk','Manajemen Konsumen']
                        .map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(left: 16),
                child: TextField(
                  controller: lainnyaController,
                  decoration: InputDecoration(
                    icon: Text('Lainnya :'),
                    hintText: 'Lainnya',
                    labelText: 'Lainnya',
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 16,bottom: 8,top: 16),
                child: Text('Status :        Menunggu'),
              ),
              Column(
                children: <Widget>[
                  RaisedButton(
                    child: Text('Kirim'),
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
