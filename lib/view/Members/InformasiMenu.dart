import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:simadu/view/Members/PinjamanDana.dart';
import 'package:simadu/view/Members/StatusMitra.dart';

class InformasiMenu extends StatefulWidget {
  @override
  _InformasiMenuState createState() => _InformasiMenuState();
}

class _InformasiMenuState extends State<InformasiMenu> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            'Informasi',
            style: TextStyle(fontSize: 16.0),
          ),
        ),
        body: ListView(
          children: <Widget>[
            ListTile(
              leading: Image.asset('assets/images/iconfinder_Finance_loan_money_1889199.png',width: 35,),
              title: Text('Pinjaman Dana'),
              onTap: (){
                Navigator.of(context).push(MaterialPageRoute(
                        builder: (c) => PinjamanDana(
            //                 // id: f['id'],
            //                 // title: f['title'],
            //                 // desc: f['desc'],
            //                 // gambar: f['gambar'],
                            )));
              },
            ),
            ListTile(
              leading: Image.asset('assets/images/047-handshake.png',width: 35,),
              title: Text('Status Mitra'),
              onTap: (){
                Navigator.of(context).push(MaterialPageRoute(
                        builder: (c) => StatusMitra(
            //                 // id: f['id'],
            //                 // title: f['title'],
            //                 // desc: f['desc'],
            //                 // gambar: f['gambar'],
                            )));
              },
            ),
            // ListTile(
            //   leading: Icon(FontAwesomeIcons.question,color: Colors.blue,),
            //   title: Text('Quiz'),
            // ),
            // ListTile(
            //   leading: Icon(FontAwesomeIcons.graduationCap,color: Colors.red,),
            //   title: Text('Meminta Kelas'),
            // ),
          ],
        ));
  }
}
