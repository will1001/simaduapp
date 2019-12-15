import 'package:flutter/material.dart';
import 'package:simadu/view/Visitor/Formdaftar.dart';
import 'package:simadu/view/Visitor/Formlogin.dart';

class Users extends StatefulWidget {
   Users({Key key, this.indextab})
      : super(key: key);
  final int indextab;
  @override
  _UsersState createState() => _UsersState();
}

class _UsersState extends State<Users> with SingleTickerProviderStateMixin {
  TabController _tabController;
  final List<Tab> myTabs = <Tab>[
    Tab(
      text: 'DAFTAR',
    ),
    Tab(
      text: 'MASUK',
    ),
  ];
  @override
  void initState() {
    super.initState();
    _tabController = new TabController(vsync: this, length: myTabs.length);
    // _tabController.index=widget.indextab;
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          leading: Opacity(opacity: 0, child: Icon(Icons.menu)),
          bottom: TabBar(
            controller: _tabController,
            indicatorColor: Colors.lightBlue[100],
            tabs: myTabs,
          ),
        ),
        body: TabBarView(
          controller: _tabController,
          children: <Widget>[
            FormDaftar(),
            Formlogin(),
          ],
        ),
      ),
    );
  }
}
