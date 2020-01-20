import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:simadu/model/ProviderDaftar.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

import '../LandingPage.dart';

class FormDaftar extends StatefulWidget {
  @override
  _FormDaftarState createState() => _FormDaftarState();
}

class _FormDaftarState extends State<FormDaftar> {
  String msg = '';
  Color warnapesan;
  String kategori_usahaController;
  String kabupaten_Controller;
  TextEditingController usernameController = new TextEditingController();
  TextEditingController passwordController = new TextEditingController();
  TextEditingController ulangipasswordController = new TextEditingController();
  TextEditingController nama_usahaController = new TextEditingController();
  TextEditingController nama_pemilikController = new TextEditingController();
  TextEditingController no_ktpController = new TextEditingController();
  // TextEditingController kategori_usahaController = new TextEditingController();
  TextEditingController emailController = new TextEditingController();
  TextEditingController no_hpController = new TextEditingController();
  TextEditingController alamatController = new TextEditingController();
  TextEditingController desaController = new TextEditingController();
  TextEditingController kecamatanController = new TextEditingController();
  TextEditingController provinsiController = new TextEditingController();
  bool validationUsername = false;
  bool validationPassword = false;
  bool validationUlangiPassword = false;
  bool validationnama_usaha = false;
  bool validationnama_pemilik = false;
  bool validationno_ktp = false;
  // bool validationkategori_usaha = false;
  bool validationemail = false;
  bool validationno_hp = false;
  bool validationalamat = false;
  bool validationdesa = false;
  bool validationkecamatan = false;
  bool validationprovinsi = false;
  

  Future registerapi() async {
    var responseJson;
    String url = "http://simadu.id/api/api_register.php";
    final response = await http.post(url, body: {
      "username": usernameController.text,
      "password": passwordController.text,
      "nama_usaha": nama_usahaController.text,
      "nama_pemilik": nama_pemilikController.text,
      "no_ktp": no_ktpController.text,
      "kategori_usaha": kategori_usahaController,
      "email": emailController.text,
      "no_hp": no_hpController.text,
      "alamat": alamatController.text,
      "desa": desaController.text,
      "kecamatan": kecamatanController.text,
      "kabupaten": kabupaten_Controller,
      "provinsi": provinsiController.text,
    });
    responseJson = json.decode(response.body);
    if (responseJson.length == 0) {
      setState(() {
        msg = "Maaf Pendafataran gagal coba kembali";
        warnapesan = Colors.red;
      });
    } else {
      //  if(responseJson[0]['username'])
      // Navigator.of(context).push(MaterialPageRoute(
      //     builder: (c) => LandingPage(
      //           selectedIndex: 5,
      //         )));
      // print(responseJson['msg']);
      setState(() {
        msg = responseJson['msg'];
        warnapesan = Colors.green;
      });
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text('Berhasil'),
              content: Text(
                msg,
                style: TextStyle(color: Colors.green),
              ),
            );
          });

      Future.delayed(
        Duration(seconds: 3),
        () {
          Navigator.pop(context);
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(top: 51, bottom: 21),
            child: Center(
                child: Text(
              'SIMADU | Rumah Kreatif BUMN',
              style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
            )),
          ),
          Padding(
            padding: const EdgeInsets.all(17.0),
            child: Center(
              child: TextField(
                controller: nama_usahaController,
                decoration: InputDecoration(
                  icon: Icon(Icons.business),
                  hintText: 'Nama Usaha',
                  labelText: 'Nama Usaha',
                  errorText: validationnama_usaha
                      ? 'Nama Usaha tidak boleh kosong'
                      : null,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(17.0),
            child: Center(
              child: TextField(
                controller: nama_pemilikController,
                decoration: InputDecoration(
                  icon: Icon(Icons.person_outline),
                  hintText: 'Nama Pemilik',
                  labelText: 'Nama Pemilik',
                  errorText: validationnama_pemilik
                      ? 'Nama Pemilik tidak boleh kosong'
                      : null,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(17.0),
            child: Center(
              child: TextField(
                controller: no_ktpController,
                decoration: InputDecoration(
                  icon: Icon(Icons.credit_card),
                  hintText: 'Nomor KTP',
                  labelText: 'Nomor KTP',
                  errorText:
                      validationno_ktp ? 'Nomor KTP tidak boleh kosong' : null,
                ),
              ),
            ),
          ),
          // Padding(
          //   padding: const EdgeInsets.all(17.0),
          //   child: Center(
          //     child: TextField(
          //       controller: kategori_usahaController,
          //       decoration: InputDecoration(
          //         icon: Icon(Icons.category),
          //         hintText: 'Kategori Usaha',
          //         labelText: 'Kategori Usaha',
          //         errorText:
          //             validationkategori_usaha ? 'Kategori Usaha tidak boleh kosong' : null,
          //       ),
          //     ),
          //   ),
          // ),
          Padding(
            padding: const EdgeInsets.all(17.0),
            child: Row(
              children: <Widget>[
                 Padding(
                   padding: const EdgeInsets.only(right:11.0),
                   child: Icon(Icons.category,color: Colors.black38,),
                 ),
                Container(
                  width: MediaQuery.of(context).size.width - 70,
                  child: DropdownButton<String>(
                    hint: Text('Kategori Usaha'),
                    value: kategori_usahaController,
                    icon: Padding(
                      padding: const EdgeInsets.only(left:148.0),
                      child: Icon(Icons.keyboard_arrow_down),
                    ),
                    iconSize: 24,
                    elevation: 16,
                    style: TextStyle(color: Colors.black),
                    underline: Container(
                      height: 1,
                      width: MediaQuery.of(context).size.width - 70,
                      color: Colors.black38,
                    ),
                    onChanged: (String newValue) {
                      setState(() {
                        kategori_usahaController = newValue.toString();
                      });
                    },
                    items: [
                      'Makanan dan Minuman',
                      'Fashion dan Gaya Hidup',
                      'Kerajinan Tangan',
                      'Seni dan Musik',
                      'Kesehatan dan Kecantikan',
                      'Jasa Pelayanan',
                      'Start Up Digital'
                    ].map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(17.0),
            child: Center(
              child: TextField(
                controller: emailController,
                decoration: InputDecoration(
                  icon: Icon(Icons.email),
                  hintText: 'Email',
                  labelText: 'Email',
                  errorText:
                      validationemail ? 'Email tidak boleh kosong' : null,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(17.0),
            child: Center(
              child: TextField(
                controller: no_hpController,
                decoration: InputDecoration(
                  icon: Icon(Icons.phone_android),
                  hintText: 'Nomor HP',
                  labelText: 'Nomor HP',
                  errorText:
                      validationno_hp ? 'Nomor HP tidak boleh kosong' : null,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(17.0),
            child: Center(
              child: TextField(
                controller: alamatController,
                decoration: InputDecoration(
                  icon: Icon(Icons.map),
                  hintText: 'Alamat Usaha',
                  labelText: 'Alamat Usaha',
                  errorText:
                      validationalamat ? 'Alamat tidak boleh kosong' : null,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(17.0),
            child: Center(
              child: TextField(
                controller: desaController,
                decoration: InputDecoration(
                  icon: Icon(Icons.map),
                  hintText: 'Desa',
                  labelText: 'Desa',
                  errorText: validationdesa ? 'Desa tidak boleh kosong' : null,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(17.0),
            child: Center(
              child: TextField(
                controller: kecamatanController,
                decoration: InputDecoration(
                  icon: Icon(Icons.map),
                  hintText: 'Kecamatan',
                  labelText: 'Kecamatan',
                  errorText: validationkecamatan
                      ? 'Kecamatan tidak boleh kosong'
                      : null,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(17.0),
            child: Row(
              children: <Widget>[
                 Padding(
                   padding: const EdgeInsets.only(right:11.0),
                   child: Icon(Icons.category,color: Colors.black38,),
                 ),
                Container(
                  width: 290,
                  child: DropdownButton<String>(
                    hint: Text('Kabupaten'),
                    value: kabupaten_Controller,
                    icon: Padding(
                      padding: const EdgeInsets.only(left:161.0),
                      child: Icon(Icons.keyboard_arrow_down),
                    ),
                    iconSize: 24,
                    elevation: 16,
                    style: TextStyle(color: Colors.black),
                    underline: Container(
                      height: 1,
                      width: 290,
                      color: Colors.black38,
                    ),
                    onChanged: (String newValue) {
                      setState(() {
                        kabupaten_Controller = newValue.toString();
                      });
                    },
                    items: [
                      'Bima',
                      'Dompu',
                      'Lombok Barat',
                      'Lombok Tengah',
                      'Lombok Timur',
                      'Lombok Utara',
                      'Sumbawa',
                      'Sumbawa Barat',
                      'Kota Bima',
                      'Kota Mataram',
                    ].map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(17.0),
            child: Center(
              child: TextField(
                controller: provinsiController,
                decoration: InputDecoration(
                  icon: Icon(Icons.map),
                  hintText: 'Provinsi',
                  labelText: 'Provinsi',
                  errorText:
                      validationprovinsi ? 'Provinsi tidak boleh kosong' : null,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(17.0),
            child: Center(
              child: TextField(
                controller: usernameController,
                decoration: InputDecoration(
                  icon: Icon(Icons.person),
                  hintText: 'Username',
                  labelText: 'Username',
                  errorText:
                      validationUsername ? 'Username tidak boleh kosong' : null,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(17.0),
            child: Center(
              child: TextField(
                controller: passwordController,
                obscureText: true,
                decoration: InputDecoration(
                  icon: Icon(Icons.lock),
                  hintText: 'Password',
                  labelText: 'Password',
                  errorText:
                      validationPassword ? 'Password tidak boleh kosong' : null,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(17.0),
            child: Center(
              child: TextField(
                controller: ulangipasswordController,
                obscureText: true,
                decoration: InputDecoration(
                  icon: Icon(Icons.lock),
                  hintText: 'Ulangi Password',
                  labelText: 'Ulangi Password',
                  errorText:
                      validationUlangiPassword ? 'Password tidak sama' : null,
                ),
              ),
            ),
          ),
          Column(
            children: <Widget>[
              RaisedButton(
                onPressed: () {
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
                  if (ulangipasswordController.text!=passwordController.text) {
                    setState(() {
                      validationUlangiPassword = true;
                    });
                  } else {
                    setState(() {
                      validationUlangiPassword = false;
                    });
                  }
                  if (nama_usahaController.text.isEmpty) {
                    setState(() {
                      validationnama_usaha = true;
                    });
                  } else {
                    setState(() {
                      validationnama_usaha = false;
                    });
                  }

                  if (nama_pemilikController.text.isEmpty) {
                    setState(() {
                      validationnama_pemilik = true;
                    });
                  } else {
                    setState(() {
                      validationnama_pemilik = false;
                    });
                  }
                  if (no_ktpController.text.isEmpty) {
                    setState(() {
                      validationno_ktp = true;
                    });
                  } else {
                    setState(() {
                      validationno_ktp = false;
                    });
                  }

                  // if (kategori_usahaController.text.isEmpty) {
                  //   setState(() {
                  //     validationkategori_usaha = true;
                  //   });
                  // } else {
                  //   setState(() {
                  //     validationkategori_usaha = false;
                  //   });
                  // }
                  if (emailController.text.isEmpty) {
                    setState(() {
                      validationemail = true;
                    });
                  } else {
                    setState(() {
                      validationemail = false;
                    });
                  }

                  if (no_hpController.text.isEmpty) {
                    setState(() {
                      validationno_hp = true;
                    });
                  } else {
                    setState(() {
                      validationno_hp = false;
                    });
                  }
                  if (alamatController.text.isEmpty) {
                    setState(() {
                      validationalamat = true;
                    });
                  } else {
                    setState(() {
                      validationalamat = false;
                    });
                  }

                  if (desaController.text.isEmpty) {
                    setState(() {
                      validationdesa = true;
                    });
                  } else {
                    setState(() {
                      validationdesa = false;
                    });
                  }
                  if (kecamatanController.text.isEmpty) {
                    setState(() {
                      validationkecamatan = true;
                    });
                  } else {
                    setState(() {
                      validationkecamatan = false;
                    });
                  }

                  if (provinsiController.text.isEmpty) {
                    setState(() {
                      validationprovinsi = true;
                    });
                  } else {
                    setState(() {
                      validationprovinsi = false;
                    });
                  }

                  if (usernameController.text.isNotEmpty &&
                      passwordController.text.isNotEmpty &&
                      ulangipasswordController.text.isNotEmpty &&
                      nama_usahaController.text.isNotEmpty &&
                      nama_pemilikController.text.isNotEmpty &&
                      no_ktpController.text.isNotEmpty &&
                      kategori_usahaController.isNotEmpty &&
                      emailController.text.isNotEmpty &&
                      no_hpController.text.isNotEmpty &&
                      alamatController.text.isNotEmpty &&
                      desaController.text.isNotEmpty &&
                      kecamatanController.text.isNotEmpty &&
                      kabupaten_Controller.isNotEmpty &&
                      provinsiController.text.isNotEmpty) {
                    registerapi();
                  } else {
                    return null;
                  }
                },
                child: Text('DAFTAR'),
                textColor: Colors.black,
                color: Colors.lightBlue,
              ),
              // Center(
              //     child: Padding(
              //   padding: const EdgeInsets.all(8.0),
              //   child: Text(
              //     msg,
              //     style: TextStyle(color: warnapesan),
              //   ),
              // )),
            ],
          ),
        ],
      ),
    );
  }
}
