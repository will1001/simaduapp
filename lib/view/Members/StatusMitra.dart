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
      body: ListTile(
        title: Text('Apakah Anda Merupakan Mitra Binaan BUMN?'),
        trailing: RaisedButton.icon(
                    icon: Icon(Icons.label_important),
                    label: Text('Jawab'),
                    textColor: Colors.white,
                    color: Colors.lightBlue,
                    onPressed: () {
                     Navigator.of(context).push(MaterialPageRoute(
                        builder: (c) => AddStatusMitra(
                            idRegister: widget.idRegister,
                            )));
                    },
                  ),
      ),
    );
  }
}