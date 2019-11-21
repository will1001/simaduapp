import 'package:flutter/material.dart';
import 'package:simadu/model/PinjamanDanaAPI.dart';
import 'package:simadu/view/Members/DetailPinjamanDana.dart';
import 'package:simadu/view/Visitor/DetailGaleri.dart';


class PinjamanDana extends StatefulWidget {
  PinjamanDana({Key key, this.idRegister}) : super(key: key);

  final String idRegister;
  @override
  _PinjamanDanaState createState() => _PinjamanDanaState();
}

class _PinjamanDanaState extends State<PinjamanDana> {
  int no = 1;
  

  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Pinjaman Dana',
          style: TextStyle(fontSize: 16.0),
        ),
      ),
      body: FutureBuilder<List<PinjamanDanaAPI>>(
          future: fetchPinjamanDanaAPI(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ListView(
                  children: snapshot.data.map((f) {
                return Padding(
                    padding: const EdgeInsets.all(1.0),
                    child: Hero(
                      tag: f.id_pinjaman,
                      child: Material(
                        child: InkWell(
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (c) => DetailPinjamanDana(
                                  idRegister: widget.idRegister,
                                      id: f.id_pinjaman,
                                      title: f.judul,
                                      desc: f.pesan,
                                      // tanggal: f.tanggal,
                                      gambar:
                                          'http://simadu.id/images/pinjaman/' +
                                              f.img,
                                    )));
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(0.0),
                            child: Center(
                              child: Card(
                                elevation: 9,
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                      top: 8.0, bottom: 8),
                                  child: Row(
                                    children: <Widget>[
                                      Container(
                                        // width: 145,
                                        height: 110,
                                        child: Image.network(
                                            'http://simadu.id/images/pinjaman/' +
                                                f.img),
                                      ),
                                      Expanded(
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Container(
                                            height: 125,
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: <Widget>[
                                                Text(f.judul),
                                                Text(
                                                  f.pesan.substring(0, 50) +
                                                      '. . .',
                                                  style: TextStyle(
                                                      color: Colors.grey,
                                                      fontSize: 12),
                                                ),
                                                Column(
                                                  children: <Widget>[
                                                    RaisedButton(
                                                      child: Text('Detail'),
                                                      textColor: Colors.black,
                                                      color: Colors.lightBlue,
                                                      onPressed: () {
                                                        
                                                        Navigator.of(context).push(
                                                            MaterialPageRoute(
                                                                builder: (c) =>
                                                                    DetailPinjamanDana(
                                                                      idRegister: widget.idRegister,
                                                                      id: f
                                                                          .id_pinjaman,
                                                                      title: f
                                                                          .judul,
                                                                      desc: f
                                                                          .pesan,
                                                                      // tanggal: f.tanggal,
                                                                      gambar: 'http://simadu.id/images/pinjaman/' +
                                                                          f.img,
                                                                    )));
                                                        // daftarpinjamandana();
                                                      },
                                                    ),
                                                  ],
                                                )
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ));
              }).toList());
            }
            return CircularProgressIndicator();
          }),
    );
  }
}
