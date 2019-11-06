import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:simadu/model/ProviderProfilVideo.dart';
import 'package:simadu/model/TimAPI.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:video_player/video_player.dart';

class Profil extends StatefulWidget {
  @override
  _ProfilState createState() => _ProfilState();
}

class _ProfilState extends State<Profil> {
  List<String> images = [
    'https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcT5aohv_x0BIMhZPy8uZiGvlCtoxGfnQEs7ZhZHm_gNiHi3pXSG',
    'https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcTO0t-2epJ5WbPPwKgXv4w5oj0ytQvBq4kzAyIq8-i_HRAvTUlF',
    'https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcQUCGTO7od-ARZ39KGRH0f9A9rGnuCbpayD6L24vFUCMlFZpTro'
  ];
  PageController pageController;
  VideoPlayerController _controller;
  Future<void> _initializeVideoPlayerFuture;

  @override
  void initState() {
    super.initState();
    pageController = PageController(initialPage: 1, viewportFraction: 0.8);
    _controller = VideoPlayerController.network(
      'https://flutter.github.io/assets-for-api-docs/assets/videos/butterfly.mp4',
    );

    _initializeVideoPlayerFuture = _controller.initialize();
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          leading: Opacity(opacity: 0, child: Icon(Icons.title)),
          centerTitle: true,
          title: Text(
            'Profil',
            style: TextStyle(fontSize: 16.0),
          ),
          bottom: TabBar(
            tabs: <Widget>[
              Tab(
                text: 'Profile',
              ),
              Tab(
                text: 'Video',
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: <Widget>[
            ListView(
              children: <Widget>[
                Card(
                  elevation: 9,
                  child: Column(
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              'Tentang Kami',
                              style: TextStyle(
                                  fontWeight: FontWeight.w500, fontSize: 17),
                            ),
                          )
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Image.asset(
                              'assets/images/logo.jpg',
                              width: 170,

                              // fit: BoxFit.fill,
                            ),
                          )
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: SizedBox(
                          width: MediaQuery.of(context).size.width,
                          child: RichText(
                            text: TextSpan(
                              style: TextStyle(
                                fontSize: 14.0,
                                color: Colors.black,
                              ),
                              children: <TextSpan>[
                                TextSpan(
                                    text: 'Rumah Kreatif BUMN Lombok Barat ',
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold)),
                                TextSpan(
                                    text:
                                        'merupakan rumah kreatif binaan dari PT PLN Unit Induk Wilayah NTB. Tugas utama kami adalah membantu UMKM dalam mengembangkan produk, Menciptakan deversifikasi produk, mewujudkan UMKM yang Go Modern, Go Digital, dan Go Online.'),
                              ],
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                FutureBuilder<List<TimAPI>>(
                  future: fetchTimAPI(),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return Card(
                  elevation: 9,
                  child: Column(
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              'Tim Kami',
                              style: TextStyle(
                                  fontWeight: FontWeight.w500, fontSize: 17),
                            ),
                          )
                        ],
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width,
                        height: 200,
                        child: ListView(
                          scrollDirection: Axis.horizontal,
                          children: snapshot.data.map((f){
                            return Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Stack(
                                children: <Widget>[
                                  Image.network(
                                    'http://simadu.id/images/tim/'+f.img,
                                    width: 200,
                                    height: 200,
                                    fit: BoxFit.cover,
                                  ),
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: <Widget>[
                                      Container(
                                          width: 200,
                                          color: Colors.black38,
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.end,
                                            children: <Widget>[
                                              Padding(
                                                padding:
                                                    const EdgeInsets.all(4.0),
                                                child: Text(
                                                  f.nama,
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                              ),
                                              Padding(
                                                padding:
                                                    const EdgeInsets.all(4.0),
                                                child: Text(
                                                  f.jabatan,
                                                  style: TextStyle(
                                                      color: Colors.white),
                                                ),
                                              ),
                                            ],
                                          )),
                                    ],
                                  ),
                                ],
                              ),
                            );
                          }).cast<Widget>()
                          .toList(),
                        ),
                      )
                    ],
                  ),
                );
                    }
                    return CircularProgressIndicator();
                  }),
              ],
            ),
            ChangeNotifierProvider<ProviderProfilVideo>(
              builder: (context) => ProviderProfilVideo(),
              child: Consumer<ProviderProfilVideo>(
                builder: (context, providerProvilVideo, _) => ListView(
                    children: providerProvilVideo.videoProfil
                        .map((f) {
                          return Center(
                            child: ListTile(
                              title: Text(f['title']),
                              onTap: () async {
                                String url = f['link'];
                                if (await canLaunch(url)) {
                                  await launch(url);
                                } else {
                                  throw 'Could not launch $url';
                                }
                              },
                            ),
                          );
                        })
                        .cast<Widget>()
                        .toList()),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
