import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:background_fetch/background_fetch.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:simadu/model/Agenda.dart';
import 'package:simadu/view/LandingPage.dart';
import 'package:simadu/view/Members/AgendaUser.dart';
import 'dart:async';
import 'package:simadu/view/Visitor/Galeri.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

final notifications = FlutterLocalNotificationsPlugin();

getagendabaru() async {
  var responseJson;
  var responseJson2;
  int _cacheagenda = 0;
  int _1stInstallSign = 0;

  SharedPreferences prefs = await SharedPreferences.getInstance();
  int logagenda = (prefs.getInt('logagenda') ?? _cacheagenda);
  int log1stInstallSign =
      (prefs.getInt('log1stInstallSign') ?? _1stInstallSign);

  String url = "http://simadu.id/api/jml_api_agenda_baru.php";
  final response = await http.post(url);
  if (response.statusCode == 200) {
    responseJson = json.decode(response.body);
  } else {
    responseJson = null;
  }

  String url2 = "http://simadu.id/api/api_agenda.php";
  final response2 = await http.post(url2);
  if (response2.statusCode == 200) {
    responseJson2 = json.decode(response2.body);
  } else {
    responseJson2 = null;
  }

  var jmlAgendaBaru = int.parse(responseJson);

  var selisihJmlAgenda = jmlAgendaBaru - logagenda;

  if (log1stInstallSign == 0) {
    await prefs.setInt('log1stInstallSign', 1);
    await prefs.setInt('logagenda', jmlAgendaBaru);
  } else {
    if (logagenda == jmlAgendaBaru) {
      return null;
    } else {
      for (var i = 0; i < selisihJmlAgenda; i++) {
        showOngoingNotification(notifications,
            title: '${responseJson2[i]['judul']}',
            body: '${responseJson2[i]['agenda']}',
            id: i);
      }
      await prefs.setInt('logagenda', jmlAgendaBaru);
    }
  }
}

_datacache() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  bool loglogin = (prefs.getBool('loglogin') ?? false);
  String idRegistercache = (prefs.getString('idRegistercache') ?? null);
  await prefs.setBool('loglogin', loglogin);
  await prefs.setString('idRegistercache', idRegistercache);
  return ('$loglogin');
}

_datacacheidRegistercache() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  bool loglogin = (prefs.getBool('loglogin') ?? false);
  String idRegistercache = (prefs.getString('idRegistercache') ?? null);
  await prefs.setBool('loglogin', loglogin);
  await prefs.setString('idRegistercache', idRegistercache);
  return ('$idRegistercache');
}

void backgroundFetchHeadlessTask(String taskId) async {
  print('[BackgroundFetch] Headless event received.');
  getagendabaru();

  BackgroundFetch.finish(taskId);
}

NotificationDetails get _ongoing {
  final androidChannelSpecifics = AndroidNotificationDetails(
      'channelId', 'channelName', 'channelDescription',
      importance: Importance.Max,
      priority: Priority.High,
      ongoing: false,
      autoCancel: true,
      visibility: NotificationVisibility.Public,
      sound: 'tone',
      playSound: true);
  final iOSChannelSpecifics = IOSNotificationDetails(sound: "tone.aiff");
  return NotificationDetails(androidChannelSpecifics, iOSChannelSpecifics);
}

Future showOngoingNotification(
  FlutterLocalNotificationsPlugin notifications, {
  @required String title,
  @required String body,
  @required int id,
  // int id = 1,
}) =>
    _showNotification(notifications,
        title: title, body: body, id: id, type: _ongoing);

Future _showNotification(
  FlutterLocalNotificationsPlugin notifications, {
  @required String title,
  @required String body,
  @required NotificationDetails type,
  @required int id,

  // int id = 1,
}) =>
    notifications.show(id, title, body, type);

void main() {
  runApp(MyApp());
  BackgroundFetch.registerHeadlessTask(backgroundFetchHeadlessTask);
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'SIMADU',
      theme: ThemeData(
        primarySwatch: Colors.lightBlue,
      ),
      home: SplashScreen(title: 'SIMADU'),
    );
  }
}

class SplashScreen extends StatefulWidget {
  SplashScreen({Key key, this.title}) : super(key: key);

  final String title;
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool _enabled = true;
  int _status = 0;
  List<DateTime> _events = [];

  @override
  void initState() {
    super.initState();
    initPlatformState();
    final android = new AndroidInitializationSettings('aaa');
    final ios = new IOSInitializationSettings(
        onDidReceiveLocalNotification: (id, title, body, payload) =>
            onSelectNotification(payload));

    notifications.initialize(InitializationSettings(android, ios),
        onSelectNotification: onSelectNotification);

    getagendabaru();

    // getagendabaru().then((val) {
    //   print(val);
    // });

    // print(_cacheagendabaru);

    // print('agenda ${_cacheagendabaru}');
    // print(getagendabaru());

    Future.delayed(
      Duration(seconds: 5),
      () {
        Navigator.of(context).push(MaterialPageRoute(
            builder: (c) => LandingPage(
                  title: widget.title,
                  selectedIndex: 0,
                )));
      },
    );
  }

  Future onSelectNotification(String payload) async => await Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => FutureBuilder(
            future: _datacache(),
            builder: (context, snapshot) {
              print(snapshot.data);
              if (snapshot.data == 'true') {
                return FutureBuilder(
                  future: _datacacheidRegistercache(),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return AgendaUser(
                        idRegister: snapshot.data,
                      );
                    }

                    return CircularProgressIndicator();
                  },
                );
              }
              if (snapshot.data == 'false') {
                return Galeri();
              }

              return CircularProgressIndicator();
            },
          ),
        ),
      );

  Future<void> initPlatformState() async {
    // Configure BackgroundFetch.
    BackgroundFetch.configure(
        BackgroundFetchConfig(
            minimumFetchInterval: 1,
            stopOnTerminate: false,
            enableHeadless: true,
            requiresBatteryNotLow: false,
            requiresCharging: false,
            requiresStorageNotLow: false,
            requiresDeviceIdle: false,
            requiredNetworkType: NetworkType.NONE), (String taskId) async {
      // This is the fetch-event callback.
      print("[BackgroundFetch] Event received $taskId");
      getagendabaru();
      setState(() {
        _events.insert(0, new DateTime.now());
      });
      // IMPORTANT:  You must signal completion of your task or the OS can punish your app
      // for taking too long in the background.
      BackgroundFetch.finish(taskId);
    }).then((int status) {
      print('[BackgroundFetch] configure success: $status');
      setState(() {
        _status = status;
      });
    }).catchError((e) {
      print('[BackgroundFetch] configure ERROR: $e');
      setState(() {
        _status = e;
      });
    });

    // Optionally query the current BackgroundFetch status.
    int status = await BackgroundFetch.status;
    setState(() {
      _status = status;
    });

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) return;
  }

  void _onClickEnable(enabled) {
    setState(() {
      _enabled = enabled;
    });
    if (enabled) {
      BackgroundFetch.start().then((int status) {
        print('[BackgroundFetch] start success: $status');
      }).catchError((e) {
        print('[BackgroundFetch] start FAILURE: $e');
      });
    } else {
      BackgroundFetch.stop().then((int status) {
        print('[BackgroundFetch] stop success: $status');
      });
    }
  }

  void _onClickStatus() async {
    int status = await BackgroundFetch.status;
    print('[BackgroundFetch] status: $status');
    setState(() {
      _status = status;
    });
  }

  void backgroundFetchHeadlessTask(String taskId) async {
    print('[BackgroundFetch] Headless event received.');
    getagendabaru();
    BackgroundFetch.finish(taskId);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // appBar: AppBar(
        //   leading: Opacity(opacity: 0.0, child: Icon(Icons.home)),
        //   centerTitle: true,
        //       title: Text(widget.title,style: TextStyle(fontSize: 16.0),),
        // ),
        body: GestureDetector(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
            builder: (c) => LandingPage(title: widget.title)));
      },
      child: Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SizedBox(
                width: 150,
                height: 150,
                child: FadeInImage(
                  fadeInDuration: const Duration(seconds: 1),
                  placeholder: AssetImage('assets/images/logo.jpg'),
                  image: AssetImage('assets/images/logo.jpg'),
                ),
              ),
              // RaisedButton(
              //   child: Text('asdsadsadasa123'),
              //   onPressed: () {
              //   showOngoingNotification(notifications,
              //       title: 'Agenda Baru', body: 'Pelatihan Bla bla 1', id: 1);
              // })
            ],
          ),
        ),
      ),
    ));
  }
}
