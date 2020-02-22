import 'package:flutter/material.dart';
import 'package:simadu/view/Visitor/Galeri.dart';
import 'LandingPage.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:background_fetch/background_fetch.dart';
import 'dart:async';

final notifications = FlutterLocalNotificationsPlugin();

void backgroundFetchHeadlessTask(String taskId) async {
  print('[BackgroundFetch] Headless event received.');
  showOngoingNotification(notifications,
      title: 'Agenda Baru', body: 'Pelatihan Bla bla 1', id: 1);
  BackgroundFetch.finish(taskId);
}

NotificationDetails get _ongoing {
  final androidChannelSpecifics = AndroidNotificationDetails(
      'channelId', 'channelName', 'channelDescription',
      importance: Importance.Max,
      priority: Priority.High,
      ongoing: false,
      autoCancel: true);
  final iOSChannelSpecifics = IOSNotificationDetails();
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

    showOngoingNotification(notifications,
        title: 'Agenda Baru', body: 'Pelatihan Bla bla 1', id: 1);

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
        MaterialPageRoute(builder: (context) => Galeri()),
      );

  Future<void> initPlatformState() async {
    // Configure BackgroundFetch.
    BackgroundFetch.configure(
        BackgroundFetchConfig(
            minimumFetchInterval: 15,
            stopOnTerminate: false,
            enableHeadless: false,
            requiresBatteryNotLow: false,
            requiresCharging: false,
            requiresStorageNotLow: false,
            requiresDeviceIdle: false,
            requiredNetworkType: NetworkType.NONE), (String taskId) async {
      // This is the fetch-event callback.
      print("[BackgroundFetch] Event received $taskId");
      showOngoingNotification(notifications,
          title: 'Agenda Baru', body: 'Pelatihan Bla bla 1', id: 1);
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
