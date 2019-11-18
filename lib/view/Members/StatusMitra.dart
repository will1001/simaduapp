import 'package:flutter/material.dart';
import 'package:simadu/model/StatusMitraAPI.dart';
import 'package:simadu/view/Members/AddStatusMitra.dart';

class StatusMitra extends StatefulWidget {
  StatusMitra({Key key, this.namaPemilik, this.namaUsaha, this.idRegister})
      : super(key: key);

  final String namaPemilik;
  final String namaUsaha;
  final String idRegister;
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
      body: ListView(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(left: 8.0, top: 8),
              child: Container(
                width: MediaQuery.of(context).size.width,
                color: Colors.green,
                height: 40,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: <Widget>[
                      Icon(
                        Icons.settings,
                        color: Colors.white,
                      ),
                      Text(
                        '  Status Mitra',
                        style: TextStyle(color: Colors.white),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: Container(
                width: MediaQuery.of(context).size.width,
                // color: Colors.transparent,
                // height: 40,
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.green, width: 1)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        'Apakah Anda Merupakan Mitra Binaan BUMN?',
                        textAlign: TextAlign.start,
                        style: TextStyle(color: Colors.black),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: RaisedButton(
                          onPressed: () async {
                          Navigator.of(context).push(MaterialPageRoute(
                          builder: (c) => AddStatusMitra(
                              idRegister: widget.idRegister,
                              )));
                          },
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text('Jawab'),
                            ],
                          ),
                          textColor: Colors.white,
                          color: Colors.green,
                        ),
                    ),
            //         ListTile(
            //           title: Text('Apakah Anda Memilik Sertifikat?'),
            //           trailing:  RaisedButton(
            //             onPressed: () async {
            //             Navigator.of(context).push(MaterialPageRoute(
            //             builder: (c) => UploadSertifikat(
            //               idRegister: widget.idRegister,
            // //                 // id: f['id'],
            // //                 // title: f['title'],
            // //                 // desc: f['desc'],
            // //                 // gambar: f['gambar'],
            //                 )));
            //             },
            //             child: Text('Upload'),
            //             textColor: Colors.white,
            //             color: Colors.green,
            //           ),
            //         ),
            //         ListTile(
            //           title: Text('Apakah Anda Belum Memilik Sertifikat?'),
            //           trailing:  RaisedButton(
            //             onPressed: () async {
            //               // setState(() {
            //               //   _judul = f.judul;
            //               // });
            //               // daftarpinjamandana();
            //             },
            //             child: Text('Daftar'),
            //             textColor: Colors.white,
            //             color: Colors.green,
            //           ),
            //         ),
                    Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Container(
                        color: Colors.green[100],
                        height: 30,
                        width: MediaQuery.of(context).size.width,
                        child: Center(child: Text('Data Anda Sudah Di Update',style: TextStyle(color: Colors.green),)),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        )
    );
  }
}