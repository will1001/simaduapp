import 'package:flutter/material.dart';
import 'package:simadu/model/HasilQuizAPI.dart';

class HasilQuiz extends StatefulWidget {
  HasilQuiz({Key key, this.namaPemilik, this.namaUsaha, this.idRegister})
      : super(key: key);

  final String namaPemilik;
  final String namaUsaha;
  final String idRegister;
  @override
  _HasilQuizState createState() => _HasilQuizState();
}

class _HasilQuizState extends State<HasilQuiz> {
  int no;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    no=1;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Skor Kuis',
          style: TextStyle(fontSize: 16.0),
        ),
      ),
      body: FutureBuilder<List<HasilQuizAPI>>(
          future: fetchHasilQuizAPI(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ListView(
                  children: snapshot.data.where((a)=>a.id_register==widget.idRegister).toList().
                  map((f) {
                return Column(
                  children: <Widget>[
                    ExpansionTile(
                      leading: Text((no++).toString()+'.'),
                      title: Text('Nomor Soal  ${f.id_soal==null?'':f.id_soal}'),
                      children: <Widget>[
                        ListTile(
                          leading: Text('Benar'),
                          title: Text(f.benar==null?'':f.benar),
                        ),
                        ListTile(
                          leading: Text('Salah'),
                          title: Text(f.salah==null?'':f.salah),
                        ),
                        ListTile(
                          leading: Text('Score'),
                          title: Text(f.score==null?'':f.score),
                        ),
                        // ListTile(
                        //   leading: Text('Satuan'),
                        //   title: Text(f.satuan==null?'':f.satuan),
                        // ),
                        // ListTile(
                        //   leading: Text('Harga'),
                        //   title: Text(f.harga==null?'':f.harga),
                        // ),
                        // ListTile(
                        //   leading: Text('Total'),
                        //   title: Text(f.total==null?'':f.total),
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
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () {
      //     // Navigator.of(context).push(MaterialPageRoute(
      //     //               builder: (c) => AddHasilQuiz(
      //     //                 idRegister: widget.idRegister,
                            
      //     //                   )));
      //   },
      //   child: Icon(Icons.add),
      //   backgroundColor: Colors.lightBlue,
      // ),
    );
  }
}
