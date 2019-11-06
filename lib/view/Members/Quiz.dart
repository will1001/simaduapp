import 'package:flutter/material.dart';
import 'package:simadu/model/QuizAPI.dart';
import 'package:url_launcher/url_launcher.dart';

class Quiz extends StatefulWidget {
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
            'Quiz',
            style: TextStyle(fontSize: 16.0),
          ),
      ),
      body: FutureBuilder<List<QuizAPI>>(
          future: fetchQuizAPI(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ListView(
                children: snapshot.data.map((f){
                  return Column(
                    children: <Widget>[
                      ListTile(
                    leading: Text((no++).toString()+'.'),
                        title: Text(f.keterangan),
                        trailing: Icon(Icons.file_download),
                        onTap: () async {
                           String url = 'http://simadu.id/user/img/quiz/' +f.nama_file;
                                if (await canLaunch(url)) {
                                  await launch(url);
                                } else {
                                  throw 'Could not launch $url';
                                }
                        },
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          color: Colors.black,
                          height: 1,
                        ),
                      )
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