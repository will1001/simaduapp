import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:simadu/model/ProviderProfilVideo.dart';
import 'package:simadu/model/TimAPI.dart';
import 'package:simadu/model/VideoEdukasiAPI.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:video_player/video_player.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

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
    int no = 1;
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          leading: Opacity(opacity: 0, child: Icon(Icons.title)),
          // centerTitle: true,
          // title: Text(
          //   'Profil',
          //   style: TextStyle(fontSize: 16.0),
          // ),
          bottom: TabBar(
            tabs: <Widget>[
              Tab(
                text: 'Profil',
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
                FutureBuilder<List<TimAPI>>(
                    future: fetchTimAPI(),
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        return Card(
                          elevation: 9,
                          child: Column(
                            children: <Widget>[
                              SizedBox(
                                width: MediaQuery.of(context).size.width,
                                height: MediaQuery.of(context).size.height,
                                child: ListView(
                                  // scrollDirection: Axis.horizontal,
                                  children: <Widget>[
                                    Card(
                                      elevation: 9,
                                      child: Column(
                                        children: <Widget>[
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: <Widget>[
                                              Padding(
                                                padding:
                                                    const EdgeInsets.all(8.0),
                                                child: Text(
                                                  'Tentang Kami',
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      fontSize: 17),
                                                ),
                                              )
                                            ],
                                          ),
                                          Card(
                                            elevation: 9,
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: <Widget>[
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.all(8.0),
                                                  child: Image.asset(
                                                    'assets/images/logo.jpg',
                                                    width: 170,

                                                    // fit: BoxFit.fill,
                                                  ),
                                                )
                                              ],
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: SizedBox(
                                              width: MediaQuery.of(context)
                                                  .size
                                                  .width,
                                              child: RichText(
                                                text: TextSpan(
                                                  style: TextStyle(
                                                    fontSize: 14.0,
                                                    color: Colors.black,
                                                  ),
                                                  children: <TextSpan>[
                                                    TextSpan(
                                                        text:
                                                            'Rumah Kreatif BUMN Lombok Barat ',
                                                        style: TextStyle(
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold)),
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
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: <Widget>[
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Text(
                                            'Tim Kami',
                                            style: TextStyle(
                                                fontWeight: FontWeight.w500,
                                                fontSize: 17),
                                          ),
                                        )
                                      ],
                                    ),
                                    Column(
                                      children: snapshot.data
                                          .map((f) {
                                            return Card(
                                              elevation: 9,
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.all(8.0),
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: <Widget>[
                                                    Row(
                                                      children: <Widget>[
                                                        Container(
                                                            margin:
                                                                EdgeInsets.all(5),
                                                            width: 100.0,
                                                            height: 100.0,
                                                            decoration: BoxDecoration(
                                                                shape: BoxShape
                                                                    .circle,
                                                                image: DecorationImage(
                                                                    fit: BoxFit
                                                                        .fill,
                                                                    image: NetworkImage(
                                                                        'http://simadu.id/images/tim/' +
                                                                            f.img)))),
                                                        Column(
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: <Widget>[
                                                            Padding(
                                                              padding:
                                                                  const EdgeInsets
                                                                          .only(
                                                                      left: 21.0,
                                                                      bottom: 7),
                                                              child: Text(
                                                                f.nama,
                                                                style: TextStyle(
                                                                    fontSize: 17,
                                                                    color: Colors
                                                                        .lightBlue),
                                                              ),
                                                            ),
                                                            Padding(
                                                              padding:
                                                                  const EdgeInsets
                                                                          .only(
                                                                      left: 21.0,
                                                                      bottom: 7),
                                                              child: Text(
                                                                f.jabatan,
                                                                style: TextStyle(
                                                                    // fontSize: 21,
                                                                    // color: Colors.lightBlue
                                                                    ),
                                                              ),
                                                            ),
                                                            // Padding(
                                                            //   padding:
                                                            //       const EdgeInsets
                                                            //               .only(
                                                            //           left: 21.0),
                                                            //   child: Row(
                                                            //     children: <
                                                            //         Widget>[
                                                            //       Padding(
                                                            //         padding:
                                                            //             const EdgeInsets
                                                            //                     .all(
                                                            //                 3.0),
                                                            //         child: Icon(
                                                            //           FontAwesomeIcons
                                                            //               .facebook,
                                                            //               size: 21,
                                                            //           color: Colors
                                                            //               .blue,
                                                            //         ),
                                                            //       ),
                                                            //       Padding(
                                                            //         padding:
                                                            //             const EdgeInsets
                                                            //                     .all(
                                                            //                 3.0),
                                                            //         child: Icon(
                                                            //           FontAwesomeIcons
                                                            //               .twitter,
                                                            //               size: 21,
                                                            //           color: Colors
                                                            //               .lightBlue,
                                                            //         ),
                                                            //       ),
                                                            //       Padding(
                                                            //         padding:
                                                            //             const EdgeInsets
                                                            //                     .all(
                                                            //                 3.0),
                                                            //         child: Icon(
                                                            //           FontAwesomeIcons
                                                            //               .linkedin,
                                                            //               size: 21,
                                                            //           color: Colors
                                                            //               .blue,
                                                            //         ),
                                                            //       ),
                                                            //     ],
                                                            //   ),
                                                            // ),
                                                          ],
                                                        ),
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            );
                                          })
                                          .cast<Widget>()
                                          .toList(),
                                    )
                                  ],
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
            FutureBuilder<List<VideoEdukasiAPI>>(
                future: fetchVideoEdukasiAPI(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return ListView(
                        children: snapshot.data.map((f) {
                          if(no>snapshot.data.length){
                            no=1;
                          }
                      return Column(
                        children: <Widget>[
                          ListTile(
                            leading: Text((no++).toString() + '.'),
                            title: Text(f.judul),
                            trailing: Icon(Icons.videocam),
                            onTap: () async {
                              String url =
                                  'https://www.youtube.com/embed/${f.link}';
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
                    }).toList());
                  }
                  return CircularProgressIndicator();
                }),
          ],
        ),
      ),
    );
  }
}
