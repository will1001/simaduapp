import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class ProviderBerita with ChangeNotifier {
  var _data = [
    {
      'id': '1',
      'title': 'kesehatan',
      'desc': 'lorem ipsuma met al doret aulkajsldkasd asdas',
      'tanggal': '01-10-2019',
      'gambar':
          'https://images.unsplash.com/photo-1569703747050-174f762d406c?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=60'
    },
    {
      'id': '2',
      'title': 'keuangan',
      'desc': 'lorem ipsuma met al doret aulkajsldkasd asdas',
      'tanggal': '01-10-2019',
      'gambar':
          'https://images.unsplash.com/photo-1569703747050-174f762d406c?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=60'
    },
    {
      'id': '3',
      'title': 'pendidikan',
      'desc': 'lorem ipsuma met al doret aulkajsldkasd asdas',
      'tanggal': '01-10-2019',
      'gambar':
          'https://images.unsplash.com/photo-1569703747050-174f762d406c?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=60'
    },
    {
      'id': '4',
      'title': 'olah raga',
      'desc': 'lorem ipsuma met al doret aulkajsldkasd asdas',
      'tanggal': '01-10-2019',
      'gambar':
          'https://images.unsplash.com/photo-1569703747050-174f762d406c?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=60'
    },
    {
      'id': '5',
      'title': 'esport',
      'desc': 'lorem ipsuma met al doret aulkajsldkasd asdas',
      'tanggal': '01-10-2019',
      'gambar':
          'https://images.unsplash.com/photo-1569703747050-174f762d406c?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=60'
    },
    {
      'id': '6',
      'title': 'teknologi',
      'desc': 'lorem ipsuma met al doret aulkajsldkasd asdas',
      'tanggal': '01-10-2019',
      'gambar':
          'https://images.unsplash.com/photo-1569703747050-174f762d406c?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=60'
    },
    {
      'id': '7',
      'title': 'perikanan',
      'desc': 'lorem ipsuma met al doret aulkajsldkasd asdas',
      'tanggal': '01-10-2019',
      'gambar':
          'https://images.unsplash.com/photo-1569703747050-174f762d406c?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=60'
    },
    {
      'id': '8',
      'title': 'sosial',
      'desc': 'lorem ipsuma met al doret aulkajsldkasd asdas',
      'tanggal': '01-10-2019',
      'gambar':
          'https://images.unsplash.com/photo-1569703747050-174f762d406c?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=60'
    },
  ];

  get data => _data;

  set data(var value) {
    _data = value;
    notifyListeners();
  }
}
