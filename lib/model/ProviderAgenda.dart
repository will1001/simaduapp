import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class ProviderAgenda with ChangeNotifier {
  var _data = [
    {
      'id': '17',
      'title': 'kesehatan',
      'desc': 'lorem ipsuma met al doret aulkajsldkasd asdas',
      'gambar':
          'https://images.unsplash.com/photo-1569703747050-174f762d406c?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=60'
    },
    {
      'id': '18',
      'title': 'keuangan',
      'desc': 'lorem ipsuma met al doret aulkajsldkasd asdas',
      'gambar':
          'https://images.unsplash.com/photo-1569703747050-174f762d406c?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=60'
    },
    {
      'id': '19',
      'title': 'pendidikan',
      'desc': 'lorem ipsuma met al doret aulkajsldkasd asdas',
      'gambar':
          'https://images.unsplash.com/photo-1569703747050-174f762d406c?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=60'
    },
    {
      'id': '20',
      'title': 'olah raga',
      'desc': 'lorem ipsuma met al doret aulkajsldkasd asdas',
      'gambar':
          'https://images.unsplash.com/photo-1569703747050-174f762d406c?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=60'
    },
    {
      'id': '21',
      'title': 'esport',
      'desc': 'lorem ipsuma met al doret aulkajsldkasd asdas',
      'gambar':
          'https://images.unsplash.com/photo-1569703747050-174f762d406c?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=60'
    },
    {
      'id': '22',
      'title': 'teknologi',
      'desc': 'lorem ipsuma met al doret aulkajsldkasd asdas',
      'gambar':
          'https://images.unsplash.com/photo-1569703747050-174f762d406c?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=60'
    },
    {
      'id': '23',
      'title': 'perikanan',
      'desc': 'lorem ipsuma met al doret aulkajsldkasd asdas',
      'gambar':
          'https://images.unsplash.com/photo-1569703747050-174f762d406c?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=60'
    },
    {
      'id': '24',
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
