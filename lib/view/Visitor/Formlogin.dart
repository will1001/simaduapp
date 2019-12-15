import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:simadu/model/ProviderLogin.dart';
import 'package:simadu/model/UserAPI.dart';
import 'package:simadu/view/LandingPage.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:url_launcher/url_launcher.dart';

class Formlogin extends StatefulWidget {
  @override
  _FormloginState createState() => _FormloginState();
}

class _FormloginState extends State<Formlogin> {
  String msg = '';
  int totalvalidasi = 0;
  TextEditingController usernameController = new TextEditingController();
  TextEditingController passwordController = new TextEditingController();
  bool validationUsername = false;
  bool validationPassword = false;

  Future<List<UserAPI>> fetchUserAPI() async {
    var responseJson;
    String url = "http://simadu.id/api/get_api_register.php";
    final response = await http.post(url, body: {
      "username": usernameController.text,
      "password": passwordController.text,
    });
    responseJson = json.decode(response.body);
    if (responseJson.length == 0) {
      setState(() {
        msg = "Maaf Cek Kembali Usernama atau Password Anda";
      });
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text(''),
              content: Text(
                msg,
                style: TextStyle(color: Colors.red),
              ),
            );
          });

      Future.delayed(
        Duration(seconds: 3),
        () {
          Navigator.pop(context);
        },
      );
    } else {
      //  if(responseJson[0]['username'])
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                   mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Text('Selamat Datang',style: TextStyle(color: Colors.lightBlue),),
                  ],
                ),
              ),
              content: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text(
                    '${responseJson[0]['nama_pemilik']}',
                    style: TextStyle(color: Colors.black),
                  ),
                ],
              ),
            );
          });

      Future.delayed(
        Duration(seconds: 3),
        () {
         Navigator.of(context).push(MaterialPageRoute(
          builder: (c) => LandingPage(
                selectedIndex: 5,
                namaPemilik:responseJson[0]['nama_pemilik'],
                namaUsaha:responseJson[0]['nama_usaha'],
                idRegister:responseJson[0]['id_register'],
              )));
      _savelogin();
        },
      );
      
    }
  }

  _savelogin() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool loglogin = true;
    await prefs.setBool('loglogin', loglogin);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(top: 31, bottom: 21),
            child: SizedBox(
              height: 70,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Card(
                                elevation: 9,child: Image.asset('assets/images/logo.png')),
                  Card(
                                elevation: 9,child: Image.asset('assets/images/BUMN.jpeg')),
                  Card(
                                elevation: 9,child: Image.asset('assets/images/PLN.jpg')),
                ],
              )),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 0, bottom: 0),
            child: Center(
                child: Text(
              'SIMADU | Rumah Kreatif BUMN',
              style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
            )),
          ),
          Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(17.0),
                child: Center(
                  child: TextField(
                    controller: usernameController,
                    // onChanged: (String str) {
                    //   setState(() {
                    //     f['atributData'] = str;
                    //   });
                    // },
                    decoration: InputDecoration(
                      icon: Icon(Icons.person),
                      hintText: 'Username',
                      labelText: 'Username',
                      errorText: validationUsername
                          ? 'Username tidak boleh kosong'
                          : null,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(17.0),
                child: Center(
                  child: TextField(
                    controller: passwordController,
                    // onChanged: (String str) {
                    //   setState(() {
                    //     f['atributData'] = str;
                    //   });
                    // },
                    obscureText: true,
                    decoration: InputDecoration(
                      icon: Icon(Icons.lock),
                      hintText: 'Password',
                      labelText: 'Password',
                      errorText: validationPassword
                          ? 'Password tidak boleh kosong'
                          : null,
                    ),
                  ),
                ),
              )
            ],
          ),
          Column(
            children: <Widget>[
              RaisedButton(
                onPressed: () {
                  // fetchUserAPI();
                  if (usernameController.text.isEmpty) {
                    setState(() {
                      validationUsername = true;
                    });
                  } else {
                    setState(() {
                      validationUsername = false;
                    });
                  }

                  if (passwordController.text.isEmpty) {
                    setState(() {
                      validationPassword = true;
                    });
                  } else {
                    setState(() {
                      validationPassword = false;
                    });
                  }
                  if (usernameController.text.isNotEmpty &&
                      passwordController.text.isNotEmpty) {
                    fetchUserAPI();
                  } else {
                    return null;
                  }
                },
                child: Text('MASUK'),
                textColor: Colors.black,
                color: Colors.lightBlue,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: GestureDetector(
                  onTap: () async{
                    String url = 'http://simadu.id/user/reset.php';
                                if (await canLaunch(url)) {
                                  await launch(url);
                                } else {
                                  throw 'Could not launch $url';
                                }
                  },
                  child: Text('Lupa Password ?',style: TextStyle(color: Colors.black),)),
              ),
              Padding(
            padding: const EdgeInsets.only(top: 0, bottom: 21),
            child: SizedBox(
              height: 70,
              child: Card(
                                elevation: 9,child: Image.asset('assets/images/YBP.jpg')),
              ),
          ),
            ],
          ),
          // Center(
          //     child: Padding(
          //   padding: const EdgeInsets.all(8.0),
          //   child: Text(
          //     msg,
          //     style: TextStyle(color: Colors.red),
          //   ),
          // )),
        ],
      ),
    );
  }
}
