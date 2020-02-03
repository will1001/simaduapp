import 'dart:core';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:file_picker/file_picker.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'package:async/async.dart';
import 'package:path/path.dart';
import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:simadu/model/SertifikatAPI.dart';
import 'package:simadu/view/Members/UploadSertifikat.dart';
import 'package:url_launcher/url_launcher.dart';

class DaftarSertifikat extends StatefulWidget {
  DaftarSertifikat({Key key, this.namaPemilik, this.idRegister})
      : super(key: key);

  final String namaPemilik;
  final String idRegister;
  @override
  _DaftarSertifikatState createState() => _DaftarSertifikatState();
}

class _DaftarSertifikatState extends State<DaftarSertifikat> {
  String msg = '';
  Color warnapesan;
  File filesertifikat;
  String _fileName;
  String _path;
  Map<String, String> _paths;
  String _extension;
  bool _loadingPath = false;
  bool _multiPick = false;
  bool _hasValidMime = false;
  FileType _pickingType = FileType.ANY;
  TextEditingController _controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    _controller.addListener(() => _extension = _controller.text);
  }

  Future uploadsertifikat() async {
    var responseJson;
    String url = "http://simadu.id/api/api_upload_sertifikat.php";
    // print(filesertifikat);
    var stream =
        http.ByteStream(DelegatingStream.typed(filesertifikat.openRead()));
    var len = await filesertifikat.length();
    var uri = Uri.parse(url);
    var req = http.MultipartRequest("POST", uri);
    var multifile = http.MultipartFile('file', stream, len,
        filename: basename(filesertifikat.path));
    req.fields['id_register'] = widget.idRegister;
    req.fields['keterangan'] = 'cvvvvv';
    req.fields['status'] = 'Sertifikat Anda Sudah Di Upload';
    req.files.add(multifile);

    responseJson = await req.send();

    if (responseJson.statusCode == '200') {
      setState(() {
        msg = "Maaf sertifikat gagal di upload";
        warnapesan = Colors.red;
      });
    } else {
      setState(() {
        msg = "Sertifikat Berhasil di Upload";
        warnapesan = Colors.lightBlue;
      });
    }
  }

  void _openFileExplorer() async {
    var temp;
    if (_pickingType != FileType.CUSTOM || _hasValidMime) {
      setState(() => _loadingPath = true);
      try {
        if (_multiPick) {
          _path = null;
          _paths = await FilePicker.getMultiFilePath(
              type: _pickingType, fileExtension: _extension);
          //  temp = await FilePicker.getFile(type: FileType.ANY);
        } else {
          _paths = null;
          // _path = await FilePicker.getFilePath(
          //     type: _pickingType, fileExtension: _extension);

          temp = await FilePicker.getFile(type: FileType.ANY);
        }
      } on PlatformException catch (e) {
        print("Unsupported operation" + e.toString());
      }
      if (!mounted) return;
      setState(() {
        _loadingPath = false;
        // _fileName = _path != null
        //     ? _path.split('/').last
        //     : _paths != null ? _paths.keys.toString() : '...';
        filesertifikat = temp;
      });

      uploadsertifikat();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Sertifikat',
          style: TextStyle(fontSize: 16.0),
        ),
      ),
      // body: ListView(
      //   children: <Widget>[
      //     Padding(
      //       padding: const EdgeInsets.only(left: 8.0, top: 8),
      //       child: Container(
      //         width: MediaQuery.of(context).size.width,
      //         color: Colors.lightBlue,
      //         height: 40,
      //         child: Padding(
      //           padding: const EdgeInsets.all(8.0),
      //           child: Row(
      //             children: <Widget>[
      //               Icon(
      //                 Icons.settings,
      //                 color: Colors.white,
      //               ),
      //               Text(
      //                 '  Sertifikat',
      //                 style: TextStyle(color: Colors.white),
      //               ),
      //             ],
      //           ),
      //         ),
      //       ),
      //     ),
      //     Padding(
      //       padding: const EdgeInsets.only(left: 8.0),
      //       child: Container(
      //         width: MediaQuery.of(context).size.width,
      //         // color: Colors.transparent,
      //         // height: 40,
      //         decoration: BoxDecoration(
      //             border: Border.all(color: Colors.lightBlue, width: 1)),
      //         child: Column(
      //           children: <Widget>[
      //             Padding(
      //               padding: const EdgeInsets.all(8.0),
      //               child: Text(
      //                 'Silahkan upload sertifikat anda, sebagai eviden dan dasar penilaian untuk bermitra, jika nanti Anda butuh pinjaman/ atau kami ingin memberikan pinjaman kami bisa menggunakan Sertifikat Anda sebagai dasar memberikan pinjaman tersebut.',
      //                 style: TextStyle(color: Colors.black),
      //               ),
      //             ),
      //             ListTile(
      //               title: Text('Apakah Anda Memilik Sertifikat?'),
      //               trailing:  RaisedButton(
      //                 onPressed: () async {
      //                 Navigator.of(context).push(MaterialPageRoute(
      //                 builder: (c) => UploadSertifikat(
      //                   idRegister: widget.idRegister,
      //     //                 // id: f['id'],
      //     //                 // title: f['title'],
      //     //                 // desc: f['desc'],
      //     //                 // gambar: f['gambar'],
      //                     )));
      //                 },
      //                 child: Text('Upload'),
      //                 textColor: Colors.white,
      //                 color: Colors.lightBlue,
      //               ),
      //             ),
      //             ListTile(
      //               title: Text('Apakah Anda Belum Memilik Sertifikat?'),
      //               trailing:  RaisedButton(
      //                 onPressed: () async {
      //                   // setState(() {
      //                   //   _judul = f.judul;
      //                   // });
      //                   // daftarpinjamandana();
      //                 },
      //                 child: Text('Daftar'),
      //                 textColor: Colors.white,
      //                 color: Colors.lightBlue,
      //               ),
      //             ),
      //             Padding(
      //               padding: const EdgeInsets.all(15.0),
      //               child: Container(
      //                 color: Colors.lightBlue[100],
      //                 height: 30,
      //                 width: MediaQuery.of(context).size.width,
      //                 child: Center(child: Text('Sertifikat Anda Sudah Di Upload',style: TextStyle(color: Colors.lightBlue),)),
      //               ),
      //             )
      //           ],
      //         ),
      //       ),
      //     ),
      //   ],
      // )
      body: FutureBuilder<List<SertifikatAPI>>(
          future: fetchSertifikatAPI(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              // print(a.id_register);
              // print(widget.idRegister);
              // print(snapshot.data
              //         .length);
              return ListView(
                  children: snapshot.data
                      .where((a) => a.id_register == widget.idRegister)
                      .toList()
                      .map((f) {
                return Column(
                  children: <Widget>[
                    ExpansionTile(
                      title: Text(f.keterangan == null ? '' : f.keterangan),
                      children: <Widget>[
                        ListTile(
                          leading: Text('File :'),
                          title: Text(f.file == null ? '' : f.file),
                        ),
                        ListTile(
                          leading: Text('Opsi :'),
                          title: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: <Widget>[
                              GestureDetector(
                                  onTap: () async {
                                    String url =
                                        'http://simadu.id/user/img/sertifikat/${f.file}';
                                    if (await canLaunch(url)) {
                                      await launch(url);
                                    } else {
                                      showDialog(
                                        context: context,
                                        builder: (context) => new AlertDialog(
                                          title: new Text('Maaf'),
                                          content: new Text('Link Kosong'),
                                          // actions:
                                        ),
                                      );
                                    }
                                  },
                                  child: Icon(Icons.file_download)),
                            ],
                          ),
                          // title: Text(f.tanggal == null ? '' : f.tanggal),
                        ),
                        // ListTile(
                        //   leading: Text('Unit Penjualan'),
                        //   title: Text(
                        //       f.unit_penjualan == null ? '' : f.unit_penjualan),
                        // ),
                        // ListTile(
                        //   leading: Text('Satuan'),
                        //   title: Text(f.satuan == null ? '' : f.satuan),
                        // ),
                        // ListTile(
                        //   leading: Text('Harga'),
                        //   title: Text(f.harga == null ? '' : f.harga),
                        // ),
                        // ListTile(
                        //   leading: Text('Total'),
                        //   title: Text(f.total == null ? '' : f.total),
                        // ),
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
              builder: (c) => UploadSertifikat(
                    idRegister: widget.idRegister,
                  )));
        },
        child: Icon(Icons.file_upload),
        backgroundColor: Colors.lightBlue,
      ),
    );
  }
}
