import 'dart:io';

import 'package:flutter/material.dart';
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
  LandingPage({Key key, this.title, this.selectedIndex, this.namaPemilik,this.namaUsaha,this.idRegister}) : super(key: key);

  final String title;
  final String namaPemilik;
  final String namaUsaha;
  final String idRegister;
  final int selectedIndex;
  @override
  _LandingPageState createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  var _widgetOptions;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  void initState() {
    print(widget.idRegister);
    super.initState();
    _selectedIndex = widget.selectedIndex;
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
            onPressed: () {exit(0);},
            child: new Text('Yes'),
          ),
        ],
      ),
    ) ?? false;
      },
      child: Scaffold(
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
              title: Text('Daftar'),
            ),
          ],
          currentIndex: _selectedIndex,
          selectedItemColor: Colors.lightBlue[700],
          onTap: _onItemTapped,
        ),
      ),
    );
  }
}
