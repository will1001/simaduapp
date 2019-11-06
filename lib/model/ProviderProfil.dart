import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class ProviderProfil with ChangeNotifier {
  var _slider=[
    {
      'id': 1,
      'img': 'https://images.unsplash.com/photo-1501523460185-2aa5d2a0f981?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=60',
      'title': 'Workshop Investment & Capital Budgeting',
    },
    {
      'id': 2,
      'img': 'https://images.unsplash.com/photo-1533900298318-6b8da08a523e?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=60',
      'title': 'Workshop Investment & Capital Budgeting 2',
    },
    {
      'id': 3,
      'img': 'https://images.unsplash.com/photo-1542838132-92c53300491e?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=60',
      'title': 'Workshop Investment & Capital Budgeting 3',
    },
  ];
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
  
  set slider(var value) {
    _slider = value;
    notifyListeners();
  }

}
