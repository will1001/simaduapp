import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:simadu/model/QuizAPI.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

class DetailQuiz extends StatefulWidget {
  DetailQuiz({Key key, this.nomor,this.idRegister}) : super(key: key);

  final String nomor;
  final String idRegister;
  
  @override
  _DetailQuizState createState() => _DetailQuizState();
}

class _DetailQuizState extends State<DetailQuiz> {
  int no = 1;
  int index = 0;
  String jawaban = '';
  List<String> totaljawaban = [];
  int benar = 0;
  int salah = 0;
  double score;
  String msg = '';
  Color warnapesan;

  Future isikuis(int b,int s,double sc) async {
    var responseJson;
    String url = "http://simadu.id/api/insert_quiz.php";
    final response = await http.post(url, body: {
      "idRegister": widget.idRegister,
      "nomorsoal": widget.nomor,
      "benar": b.toString(),
      "salah": s.toString(),
      "hasil": sc.toString(),
    });
    responseJson = json.decode(response.body);
    if (responseJson.length == 0) {
      setState(() {
        msg = "Failed";
        warnapesan = Colors.red;
      });
    } else {
      //  if(responseJson[0]['username'])
      // Navigator.of(context).push(MaterialPageRoute(
      //     builder: (c) => LandingPage(
      //           selectedIndex: 5,
      //         )));
      print(responseJson['msg']);
       setState(() {
        msg = responseJson['msg'];
        warnapesan = Colors.green;
      });
      
    }
  }


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
      // for (var i = 0; i < 99; i++) {
      //                totaljawaban.add('');
      //                }
                      
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            'Quiz',
            style: TextStyle(fontSize: 16.0),
          ),
        ),
        body: ListView(
          children: <Widget>[
            FutureBuilder<List<QuizAPI>>(
                future: fetchQuizAPI(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    //


                    return Container();
                  }
                  return CircularProgressIndicator();
                }),
            FutureBuilder<List<QuizAPI>>(
                future: fetchQuizAPI(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    var idsoal;
                    var soal;
                    var jwba;
                    var jwbb;
                    var jwbc;
                    var jwbd;
                    var jwbe;
                    var kuncijwb;
                    var datab=[];

                    for (var i = 0;
                        i <
                            snapshot.data
                                .where((a) => a.no == widget.nomor)
                                .length;
                        i++) {
                      idsoal = snapshot.data
                          .where((a) => a.no == widget.nomor)
                          .map((f) {
                        return f.id_soal;
                      }).toList();
                      soal = snapshot.data
                          .where((a) => a.no == widget.nomor)
                          .map((f) {
                        return f.soal;
                      }).toList();
                      jwba = snapshot.data
                          .where((a) => a.no == widget.nomor)
                          .map((f) {
                        return f.a;
                      }).toList();
                      jwbb = snapshot.data
                          .where((a) => a.no == widget.nomor)
                          .map((f) {
                        return f.b;
                      }).toList();
                      jwbc = snapshot.data
                          .where((a) => a.no == widget.nomor)
                          .map((f) {
                        return f.c;
                      }).toList();
                      jwbd = snapshot.data
                          .where((a) => a.no == widget.nomor)
                          .map((f) {
                        return f.d;
                      }).toList();
                      jwbe = snapshot.data
                          .where((a) => a.no == widget.nomor)
                          .map((f) {
                        return f.e;
                      }).toList();
                      kuncijwb = snapshot.data
                          .where((a) => a.no == widget.nomor)
                          .map((f) {
                        return f.knc_jawaban;
                      }).toList();
                      
                      if(totaljawaban.length<=datab.length){
                        totaljawaban.add('value');
                      }
                       datab.add({
                          'id_soal': '',
                          'soal': '',
                          'index': 0,
                          'a': '',
                          'b': '',
                          'c': '',
                          'd': '',
                          'e': '',
                          'knc_jawaban': '',
                        });
                        datab[i]['id_soal'] = idsoal[i];
                        datab[i]['soal'] = soal[i];
                        datab[i]['index'] = i;
                        datab[i]['a'] = jwba[i];
                        datab[i]['b'] = jwbb[i];
                        datab[i]['c'] = jwbc[i];
                        datab[i]['d'] = jwbd[i];
                        datab[i]['e'] = jwbe[i];
                        datab[i]['knc_jawaban'] = kuncijwb[i];
                    }
                    return Column(
                      children: <Widget>[
                        Column(
                          children: datab
                              .map((f) {
                         
                              return Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: <Widget>[
                                        Text('${f['index']+1}. ${f['soal']}'),
                                        Row(
                                          children: <Widget>[
                                            Radio(
                                              value: f['a'].toString(),
                                              groupValue: totaljawaban[f['index']],
                                              onChanged: (String value) {
                                                setState(() {
                                                  // totaljawaban.add(value);
                                                  totaljawaban[f['index']] = value;
                                                });
                                              },
                                            ),
                                            Text(f['a'])
                                          ],
                                        ),
                                        Row(
                                          children: <Widget>[
                                            Radio(
                                              value: f['b'].toString(),
                                              groupValue: totaljawaban[f['index']]
                                                  .toString(),
                                              onChanged: (String value) {
                                                setState(() {
                                                  // totaljawaban.add(value);
                                                  totaljawaban[f['index']] = value;
                                                });
                                              },
                                            ),
                                            Text(f['b'])
                                          ],
                                        ),
                                        Row(
                                          children: <Widget>[
                                            Radio(
                                              value: f['c'].toString(),
                                              groupValue: totaljawaban[f['index']]
                                                  .toString(),
                                              onChanged: (String value) {
                                                setState(() {
                                                  // totaljawaban.add(value);
                                                  totaljawaban[f['index']] = value;
                                                });
                                              },
                                            ),
                                            Text(f['c'])
                                          ],
                                        ),
                                        Row(
                                          children: <Widget>[
                                            Radio(
                                              value: f['d'].toString(),
                                              groupValue: totaljawaban[f['index']]
                                                  .toString(),
                                              onChanged: (String value) {
                                                setState(() {
                                                  // totaljawaban.add(value);
                                                  totaljawaban[f['index']] = value;
                                                });
                                              },
                                            ),
                                            Text(f['d']),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                  // Text(totaljawaban.toString()),
                                ],
                              );
                          }).toList(),
                        ),
                        // Text(kuncijwb.toString()),
                        RaisedButton(
                          onPressed: () {
                            for (var i = 0; i < totaljawaban.length; i++) {
                              if (totaljawaban[i] == kuncijwb[i]) {
                              setState(() {
                                benar++;
                              });
                            } else {
                              setState(() {
                                salah++;
                              });
                            }
                            score=(benar/totaljawaban.length)*100;
                            }
                            isikuis(benar,salah,score);
                             Future.delayed(Duration(seconds: 1),
                                (){
                            Navigator.of(context).pop();
                                  
                                },
                                
                                );

                          },
                          child: Text('submit'),
                          textColor: Colors.black,
                          color: Colors.lightBlue,
                        ),
                        Text(
              msg,
              style: TextStyle(color: warnapesan),
            ),
                      ],
                    );
                  }
                  return CircularProgressIndicator();
                }),
          ],
        ));
  }
}
