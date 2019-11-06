import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class ProviderShop with ChangeNotifier {
  var _data = [
    {
      'id': '1',
      'title': 'kesehatan',
      'desc': 'lorem ipsuma met al doret aulkajsldkasd asdas',
      'link_bukalapak':'https://www.bukalapak.com/',
      'link_lazada':'https://www.lazada.co.id/',
      'link_shoppe':'https://shopee.co.id/shop/',
      'link_tokopedia':'https://www.tokopedia.com/',
      'link_blanjadotcom':'https://www.blanja.com/',
      'gambar':
          'https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcT6lcGIYT1_dWfmKdgNgWn-0PPii5pUztc-2-k1uegZj-dDTKW6'
    },
    {
      'id': '2',
      'title': 'keuangan',
      'desc': 'lorem ipsuma met al doret aulkajsldkasd asdas',
      'link_bukalapak':'https://www.bukalapak.com/',
      'link_lazada':'https://www.lazada.co.id/',
      'link_shoppe':'https://shopee.co.id/shop/',
      'link_tokopedia':'https://www.tokopedia.com/',
      'link_blanjadotcom':'https://www.blanja.com/',
      'gambar':
          'https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcTsXJFPnquKcJHsmTZKZZrP00_CH0R59S0srxfSGZkvGSOqywYW'
    },
    {
      'id': '3',
      'title': 'pendidikan',
      'desc': 'lorem ipsuma met al doret aulkajsldkasd asdas',
      'link_bukalapak':'https://www.bukalapak.com/',
      'link_lazada':'https://www.lazada.co.id/',
      'link_shoppe':'https://shopee.co.id/shop/',
      'link_tokopedia':'https://www.tokopedia.com/',
      'link_blanjadotcom':'https://www.blanja.com/',
      'gambar':
          'https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcSt3TOwet07WtgD8NOZ8P15Cd37k9Zxoh6sj27R0WU4rRFLgeD7'
    },
    {
      'id': '4',
      'title': 'olah raga',
      'desc': 'lorem ipsuma met al doret aulkajsldkasd asdas',
      'link_bukalapak':'https://www.bukalapak.com/',
      'link_lazada':'https://www.lazada.co.id/',
      'link_shoppe':'https://shopee.co.id/shop/',
      'link_tokopedia':'https://www.tokopedia.com/',
      'link_blanjadotcom':'https://www.blanja.com/',
      'gambar':
          'http://www.creilpokerclub.fr/images/image/Casual%20Flock%20GRAY%20chaussures%20la%20mode%20pour%20femmes%20plats%20en%20fausse%20fourrure%20Flock%20ferm%20Toe%20Toe%20ronde%20Lettre%20Slip-On%2087618.jpg'
    },
    {
      'id': '5',
      'title': 'esport',
      'desc': 'lorem ipsuma met al doret aulkajsldkasd asdas',
      'link_bukalapak':'https://www.bukalapak.com/',
      'link_lazada':'https://www.lazada.co.id/',
      'link_shoppe':'https://shopee.co.id/shop/',
      'link_tokopedia':'https://www.tokopedia.com/',
      'link_blanjadotcom':'https://www.blanja.com/',
      'gambar':
          'http://www.creilpokerclub.fr/images/image/Casual%20Flock%20GRAY%20chaussures%20la%20mode%20pour%20femmes%20plats%20en%20fausse%20fourrure%20Flock%20ferm%20Toe%20Toe%20ronde%20Lettre%20Slip-On%2087618.jpg'
    },
    {
      'id': '6',
      'title': 'teknologi',
      'desc': 'lorem ipsuma met al doret aulkajsldkasd asdas',
      'gambar':
          'http://www.creilpokerclub.fr/images/image/Casual%20Flock%20GRAY%20chaussures%20la%20mode%20pour%20femmes%20plats%20en%20fausse%20fourrure%20Flock%20ferm%20Toe%20Toe%20ronde%20Lettre%20Slip-On%2087618.jpg'
    },
    {
      'id': '7',
      'title': 'perikanan',
      'desc': 'lorem ipsuma met al doret aulkajsldkasd asdas',
      'link_bukalapak':'https://www.bukalapak.com/',
      'link_lazada':'https://www.lazada.co.id/',
      'link_shoppe':'https://shopee.co.id/shop/',
      'link_tokopedia':'https://www.tokopedia.com/',
      'link_blanjadotcom':'https://www.blanja.com/',
      'gambar':
          'http://www.creilpokerclub.fr/images/image/Casual%20Flock%20GRAY%20chaussures%20la%20mode%20pour%20femmes%20plats%20en%20fausse%20fourrure%20Flock%20ferm%20Toe%20Toe%20ronde%20Lettre%20Slip-On%2087618.jpg'
    },
    {
      'id': '8',
      'title': 'sosial',
      'desc': 'lorem ipsuma met al doret aulkajsldkasd asdas',
      'link_bukalapak':'https://www.bukalapak.com/',
      'link_lazada':'https://www.lazada.co.id/',
      'link_shoppe':'https://shopee.co.id/shop/',
      'link_tokopedia':'https://www.tokopedia.com/',
      'link_blanjadotcom':'https://www.blanja.com/',
      'gambar':
          'http://www.creilpokerclub.fr/images/image/Casual%20Flock%20GRAY%20chaussures%20la%20mode%20pour%20femmes%20plats%20en%20fausse%20fourrure%20Flock%20ferm%20Toe%20Toe%20ronde%20Lettre%20Slip-On%2087618.jpg'
    },
  ];

  get data => _data;

  set data(var value) {
    _data = value;
    notifyListeners();
  }
}
