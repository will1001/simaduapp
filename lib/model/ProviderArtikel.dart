import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class ProviderArtikel with ChangeNotifier {
  var _data = [
    {
      'id': '9',
      'title': 'kesehatan',
      'desc': 'lorem ipsuma met al doret aulkajsldkasd asdas',
      'gambar':
          'https://images.unsplash.com/photo-1569703747050-174f762d406c?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=60'
    },
    {
      'id': '10',
      'title': 'keuangan',
      'desc': 'lorem ipsuma met al doret aulkajsldkasd asdas',
      'gambar':
          'https://images.unsplash.com/photo-1569703747050-174f762d406c?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=60'
    },
    {
      'id': '11',
      'title': 'pendidikan',
      'desc': 'lorem ipsuma met al doret aulkajsldkasd asdas',
      'gambar':
          'https://images.unsplash.com/photo-1569703747050-174f762d406c?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=60'
    },
    {
      'id': '12',
      'title': 'olah raga',
      'desc': 'lorem ipsuma met al doret aulkajsldkasd asdas',
      'gambar':
          'https://images.unsplash.com/photo-1569703747050-174f762d406c?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=60'
    },
    {
      'id': '13',
      'title': 'esport',
      'desc': 'lorem ipsuma met al doret aulkajsldkasd asdas',
      'gambar':
          'https://images.unsplash.com/photo-1569703747050-174f762d406c?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=60'
    },
    {
      'id': '14',
      'title': 'teknologi',
      'desc': 'lorem ipsuma met al doret aulkajsldkasd asdas',
      'gambar':
          'https://images.unsplash.com/photo-1569703747050-174f762d406c?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=60'
    },
    {
      'id': '15',
      'title': 'perikanan',
      'desc': 'lorem ipsuma met al doret aulkajsldkasd asdas',
      'gambar':
          'https://images.unsplash.com/photo-1569703747050-174f762d406c?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=60'
    },
    {
      'id': '16',
      'title': 'sosial',
      'desc': 'lorem ipsuma met al doret aulkajsldkasd asdas',
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
