import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class ProviderDaftar with ChangeNotifier {
  var _daftardata = [
    {
      'atributData': '_namausaha',
      'Controller': TextEditingController(),
      'Validation': false,
      'Text': 'Nama Usaha',
      'icon': Icons.business,
      'errorText': 'Nama Usaha tidak boleh kosong',
    },
    {
      'atributData': '_namapemilik',
      'Controller': TextEditingController(),
      'Validation': false,
      'Text': 'Nama Pemilik',
      'icon': Icons.person_outline,
      'errorText': 'Nama Pemilik tidak boleh kosong',
    },
    {
      'atributData': '_noktp',
      'Controller': TextEditingController(),
      'Validation': false,
      'Text': 'Nomor KTP',
      'icon': Icons.credit_card,
      'errorText': 'Nomor KTP tidak boleh kosong',
    },
    {
      'atributData': '_kategoriusaha',
      'Controller': TextEditingController(),
      'Validation': false,
      'Text': 'Kategori Usaha',
      'icon': Icons.category,
      'errorText': 'Kategori Usaha tidak boleh kosong',
    },
    {
      'atributData': '_email',
      'Controller': TextEditingController(),
      'Validation': false,
      'Text': 'Email',
      'icon': Icons.email,
      'errorText': 'Email tidak boleh kosong',
    },
    {
      'atributData': '_nohp',
      'Controller': TextEditingController(),
      'Validation': false,
      'Text': 'Nomor HP',
      'icon': Icons.phone_android,
      'errorText': 'Nomor HP tidak boleh kosong',
    },
    {
      'atributData': '_alamat',
      'Controller': TextEditingController(),
      'Validation': false,
      'Text': 'Alamat',
      'icon': Icons.map,
      'errorText': 'Alamat tidak boleh kosong',
    },
    {
      'atributData': '_desa',
      'Controller': TextEditingController(),
      'Validation': false,
      'Text': 'Desa',
      'icon': Icons.map,
      'errorText': 'Desa tidak boleh kosong',
    },
    {
      'atributData': '_kecamatan',
      'Controller': TextEditingController(),
      'Validation': false,
      'Text': 'Kecamatan',
      'icon': Icons.map,
      'errorText': 'Kecamatan tidak boleh kosong',
    },
    {
      'atributData': '_provinsi',
      'Controller': TextEditingController(),
      'Validation': false,
      'Text': 'Provinsi',
      'icon': Icons.map,
      'errorText': 'Provinsi tidak boleh kosong',
    },
    {
      'atributData': '_username',
      'Controller': TextEditingController(),
      'Validation': false,
      'Text': 'Username',
      'icon': Icons.person,
      'errorText': 'Username tidak boleh kosong',
    },
    {
      'atributData': '_password',
      'Controller': TextEditingController(),
      'Validation': false,
      'Text': 'Password',
      'icon': Icons.lock,
      'errorText': 'Password tidak boleh kosong',
    },
  ];

  get daftardata => _daftardata;

  set daftardata(var value) {
    _daftardata = value;
    notifyListeners();
  }
}
