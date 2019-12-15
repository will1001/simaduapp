import 'package:flutter/material.dart';
import 'package:simadu/model/QuizAPI.dart';
import 'package:simadu/model/QuizAPInmr.dart';
import 'package:simadu/view/Members/DetailQuiz.dart';
import 'package:simadu/view/Visitor/DetailBerita.dart';
import 'package:url_launcher/url_launcher.dart';

class Quiz extends StatefulWidget {
    Quiz({Key key, this.idRegister})
      : super(key: key);

  final String idRegister;
  @override
  _QuizState createState() => _QuizState();
}

class _QuizState extends State<Quiz> {
 int no=1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
          title: Text(
            'Kuis',
            style: TextStyle(fontSize: 16.0),
          ),
      ),
      body: FutureBuilder<List<QuizAPInmr>>(
          future: fetchQuizAPInmr(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              print(snapshot.data);
              return ListView(
                children: snapshot.data.map((f){
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: RaisedButton(
                          onPressed: (){
                             Navigator.of(context).push(MaterialPageRoute(
                        builder: (c) => DetailQuiz(
                                nomor:f.no,
                                idRegister: widget.idRegister,
            //                 // id: f['id'],
            //                 // title: f['title'],
            //                 // desc: f['desc'],
            //                 // gambar: f['gambar'],
                            )));
                          },
                          child: Text('Kuis Nomor ${f.no}'),
                          textColor: Colors.black,
                          color: Colors.lightBlue,
                        ),
                      ),
                      // Padding(
                      //   padding: const EdgeInsets.all(8.0),
                      //   child: Container(
                      //     color: Colors.black,
                      //     height: 1,
                      //   ),
                      // )
                    ],
                  );
                }).toList()
              );
            }
            return CircularProgressIndicator();
          }),
    );
  }
}