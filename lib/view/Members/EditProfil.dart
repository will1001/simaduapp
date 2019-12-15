import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

import 'package:simadu/model/APIProfil.dart';

class EditProfil extends StatefulWidget {
  EditProfil({Key key, this.idRegister}) : super(key: key);

  final String idRegister;
  @override
  _EditProfilState createState() => _EditProfilState();
}

class _EditProfilState extends State<EditProfil> {
  String msg = '';
  Color warnapesan;
    String kategori_usahaController;
  String kabupaten_Controller;
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
  TextEditingController usernameController = new TextEditingController();
  TextEditingController passwordController = new TextEditingController();
  bool validationnama_usaha = false;
  bool validationnama_pemilik = false;
  bool validationno_ktp = false;
  bool validationkategori_usaha = false;
  bool validationemail = false;
  bool validationno_hp = false;
  bool validationalamat = false;
  bool validationdesa = false;
  bool validationkecamatan = false;
  bool validationprovinsi = false;
  bool validationUsername = false;
  bool validationPassword = false;

  Future updateProfil() async {
    var responseJson;
    String url = "http://simadu.id/api/api_edit_profil.php";
    final response = await http.post(url, body: {
      "id_register": widget.idRegister,
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
      "username": usernameController.text,
      "password": passwordController.text,
    });
    responseJson = json.decode(response.body);
    if (responseJson.length == 0) {
      setState(() {
        msg = "Maaf Pendafataran gagal coba kembali";
        warnapesan = Colors.red;
      });
    } else {
      setState(() {
        msg = responseJson['msg'];
        warnapesan = Colors.green;
      });
      Navigator.pop(context);
    }
  }

  Future<List<APIProfil>> fetchEditProfil() async {
    print(widget.idRegister);
    var responseJson;
    String url = "http://simadu.id/api/api_register_where_id.php";
    final response = await http.post(url, body: {
      "id_register": widget.idRegister,
    });
    if (response.statusCode == 200) {
      responseJson = json.decode(response.body);
      responseJson =
          (responseJson as List).map((p) => APIProfil.fromJson(p)).toList();
    } else {
      responseJson = null;
    }

    return responseJson;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<List<APIProfil>>(
        future: fetchEditProfil(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            nama_usahaController.value = nama_usahaController.value
                .copyWith(text: snapshot.data[0].nama_usaha);
            nama_pemilikController.value = nama_pemilikController.value
                .copyWith(text: snapshot.data[0].nama_pemilik);
            no_ktpController.value =
                no_ktpController.value.copyWith(text: snapshot.data[0].no_ktp);
            kategori_usahaController = snapshot.data[0].kategori_usaha;
            emailController.value =
                emailController.value.copyWith(text: snapshot.data[0].email);
            no_hpController.value =
                no_hpController.value.copyWith(text: snapshot.data[0].no_hp);
            alamatController.value =
                alamatController.value.copyWith(text: snapshot.data[0].alamat);
            desaController.value =
                desaController.value.copyWith(text: snapshot.data[0].desa);
            kecamatanController.value = kecamatanController.value
                .copyWith(text: snapshot.data[0].kecamatan);
                kabupaten_Controller = snapshot.data[0].kabupaten;
            provinsiController.value = provinsiController.value
                .copyWith(text: snapshot.data[0].provinsi);
            usernameController.value = provinsiController.value
                .copyWith(text: snapshot.data[0].username);
            passwordController.value = provinsiController.value
                .copyWith(text: snapshot.data[0].password);
            return ListView(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(top: 51, bottom: 21),
                  child: Center(
                      child: Text(
                    'Profil',
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
                        errorText: validationno_ktp
                            ? 'UseNomor KTPdak boleh kosong'
                            : null,
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
                //         errorText: validationkategori_usaha
                //             ? 'Kategori Usaha tidak boleh kosong'
                //             : null,
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
                  width: 290,
                  child: DropdownButton<String>(
                    hint: Text('Kategori Usaha'),
                    value: kategori_usahaController,
                    icon: Padding(
                      padding: const EdgeInsets.only(left:98.0),
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
                        errorText: validationno_hp
                            ? 'PasNomor HPdak boleh kosong'
                            : null,
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
                        hintText: 'Alamat',
                        labelText: 'Alamat',
                        errorText: validationalamat
                            ? 'Alamat tidak boleh kosong'
                            : null,
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
                        errorText:
                            validationdesa ? 'Desa tidak boleh kosong' : null,
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
                        errorText: validationprovinsi
                            ? 'Provinsi tidak boleh kosong'
                            : null,
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
                Column(
                  children: <Widget>[
                    RaisedButton(
                      onPressed: () {
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

                        if (kategori_usahaController.isEmpty) {
                          setState(() {
                            validationkategori_usaha = true;
                          });
                        } else {
                          setState(() {
                            validationkategori_usaha = false;
                          });
                        }
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
                        // if (kabupaten_Controller.isEmpty) {
                        //   setState(() {
                        //     validationkabupaten = true;
                        //   });
                        // } else {
                        //   setState(() {
                        //     validationkabupaten = false;
                        //   });
                        // }

                        if (provinsiController.text.isEmpty) {
                          setState(() {
                            validationprovinsi = true;
                          });
                        } else {
                          setState(() {
                            validationprovinsi = false;
                          });
                        }

                        if (nama_usahaController.text.isNotEmpty &&
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
                          updateProfil();
                        } else {
                          return null;
                        }
                      },
                      child: Text('Update'),
                      textColor: Colors.black,
                      color: Colors.lightBlue,
                    ),
                    Center(
                        child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        msg,
                        style: TextStyle(color: warnapesan),
                      ),
                    )),
                  ],
                ),
              ],
            );
          }
          return CircularProgressIndicator();
        },
      ),
    );
  }
}
