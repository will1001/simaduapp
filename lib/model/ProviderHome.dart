import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;







class ProviderHome with ChangeNotifier {
  var _slider;
  var _kegiatanrkb = [
    {
      'id': '1',
      'img': 'http://simadu.id/images/wp1.jpg',
      'title': 'Workshop Investment & Capital Budgeting',
      'Text': 'Nama Usaha',
      'icon': Icons.business,
      'errorText': 'Nama Usaha tidak boleh kosong',
    },
    {
      'id': '2',
      'img': 'http://simadu.id/images/wp2.jpg',
      'title': 'Workshop Product Packaging Strategy ',
      'Text': 'Nama Pemilik',
      'icon': Icons.person_outline,
      'errorText': 'Nama Pemilik tidak boleh kosong',
    },
    {
      'id': '3',
      'img': 'http://simadu.id/images/wp3.jpg',
      'title': 'Gaining Sales with Product Varian Strategy',
      'Text': 'Nomor KTP',
      'icon': Icons.credit_card,
      'errorText': 'Nomor KTP tidak boleh kosong',
    }
  ];

  get kegiatanrkb => _kegiatanrkb;
  get slider => _slider;

  set kegiatanrkb(var value) {
    _kegiatanrkb = value;
    notifyListeners();
  }
  

}
