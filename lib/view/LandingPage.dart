import 'dart:io';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:simadu/controller/Auth.dart';
import 'package:simadu/model/LoginApi.dart';
import 'package:simadu/view/Members/Member.dart';
import 'package:simadu/view/Visitor/Users.dart';

import 'Visitor/Berita.dart';
import 'Visitor/Galeri.dart';
import 'Visitor/Home.dart';
import 'Visitor/Profil.dart';
import 'Visitor/Shop.dart';

class LandingPage extends StatefulWidget {
  LandingPage(
      {Key key,
      this.title,
      this.selectedIndex,
      this.selectedIndex2,
      this.namaPemilik,
      this.namaUsaha,
      this.idRegister})
      : super(key: key);

  final String title;
  final String namaPemilik;
  final String namaUsaha;
  final String idRegister;
  final int selectedIndex;
  final int selectedIndex2;
  @override
  _LandingPageState createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  int _selectedIndex = 0;
  int _selectedIndex2 = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  var _widgetOptions;
  var _widgetOptions2;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
  void _onItemTapped2(int index) {
    setState(() {
      _selectedIndex2 = index;
    });
  }

  String namaPemilikcache;
  String namaUsahacache;
  String idRegistercache;

  _datacache() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool loglogin = (prefs.getBool('loglogin') ?? false);
    namaPemilikcache =
        (prefs.getString('namaPemilikcache') ?? widget.namaPemilik);
    namaUsahacache = (prefs.getString('namaUsahacache') ?? widget.namaUsaha);
    idRegistercache = (prefs.getString('idRegistercache') ?? widget.idRegister);
    await prefs.setBool('loglogin', loglogin);
    await prefs.setString('namaPemilikcache', namaPemilikcache);
    await prefs.setString('namaUsahacache', namaUsahacache);
    await prefs.setString('idRegistercache', idRegistercache);
    return ('$loglogin');
  }

  @override
  void initState() {
    print(widget.idRegister);
    super.initState();
    _selectedIndex = (widget.selectedIndex == null?0:widget.selectedIndex);
    _selectedIndex2 = (widget.selectedIndex2 == null?0:widget.selectedIndex2);
    _widgetOptions = <Widget>[
      Home(),
      Profil(),
      Galeri(),
      Berita(),
      Shop(),
      Auth(
        namaPemilik: widget.namaPemilik,
        namaUsaha: widget.namaUsaha,
        idRegister: widget.idRegister,
      ),
    ];
    _widgetOptions2 = <Widget>[
      Home(),
      Profil(),
      // Galeri(),
      Berita(),
      Shop(),
      Auth(
        namaPemilik: widget.namaPemilik,
        namaUsaha: widget.namaUsaha,
        idRegister: widget.idRegister,
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return showDialog(
              context: context,
              builder: (context) => new AlertDialog(
                title: new Text('Are you sure?'),
                content: new Text('Do you want to exit an App'),
                actions: <Widget>[
                  new FlatButton(
                    onPressed: () => Navigator.of(context).pop(false),
                    child: new Text('No'),
                  ),
                  new FlatButton(
                    onPressed: () {
                      exit(0);
                    },
                    child: new Text('Yes'),
                  ),
                ],
              ),
            ) ??
            false;
      },
      child: FutureBuilder(
        future: _datacache(),
        builder: (context, snapshot) {
          print(_selectedIndex);
          if (snapshot.data == 'true') {
            return Scaffold(
              body: _widgetOptions2.elementAt(_selectedIndex2),
              bottomNavigationBar: BottomNavigationBar(
                type: BottomNavigationBarType.fixed,
                items: const <BottomNavigationBarItem>[
                  BottomNavigationBarItem(
                    icon: Icon(Icons.home),
                    title: Text('Home'),
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.group),
                    title: Text('Profil'),
                  ),
                  // BottomNavigationBarItem(
                  //   icon: Icon(Icons.photo),
                  //   title: Text('Agenda'),
                  // ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.library_books),
                    title: Text('Berita'),
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.shopping_cart),
                    title: Text('Belanja'),
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.person),
                    title: Text('Akun'),
                  ),
                ],
                currentIndex: _selectedIndex2,
                selectedItemColor: Colors.lightBlue[700],
                onTap: _onItemTapped2,
              ),
            );
          }
          if (snapshot.data == 'false') {
            return Scaffold(
              body: _widgetOptions.elementAt(_selectedIndex),
              bottomNavigationBar: BottomNavigationBar(
                type: BottomNavigationBarType.fixed,
                items: const <BottomNavigationBarItem>[
                  BottomNavigationBarItem(
                    icon: Icon(Icons.home),
                    title: Text('Home'),
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.group),
                    title: Text('Profil'),
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.photo),
                    title: Text('Agenda'),
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.library_books),
                    title: Text('Berita'),
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.shopping_cart),
                    title: Text('Belanja'),
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.person),
                    title: Text('Akun'),
                  ),
                ],
                currentIndex: _selectedIndex,
                selectedItemColor: Colors.lightBlue[700],
                onTap: _onItemTapped,
              ),
            );
          }

          return CircularProgressIndicator();
        },
      ),
    );
  }
}
