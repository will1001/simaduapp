import 'package:flutter/material.dart';
import 'package:simadu/model/VideoEdukasiAPI.dart';
import 'package:simadu/model/VideoEdukasiAPI.dart' as prefix0;
import 'package:url_launcher/url_launcher.dart';

class VideoEdukasi extends StatefulWidget {
  @override
  _VideoEdukasiState createState() => _VideoEdukasiState();
}

class _VideoEdukasiState extends State<VideoEdukasi> {
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
            'Video Edukasi',
            style: TextStyle(fontSize: 16.0),
          ),
      ),
      body: FutureBuilder<List<prefix0.VideoEdukasiAPI>>(
          future: fetchVideoEdukasiAPI(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ListView(
                children: snapshot.data.map((f){
                  return Column(
                    children: <Widget>[
                      ListTile(
                    leading: Text((no++).toString()+'.'),
                        title: Text(f.judul),
                        trailing: Icon(Icons.videocam),
                        onTap: () async {
                           String url = 'https://www.youtube.com/embed/${f.link}';
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