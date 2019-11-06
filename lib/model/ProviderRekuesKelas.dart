import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class ProviderRekuesKelas with ChangeNotifier{
  String _kelas;
  String _namaakun;
 
 
  // Future<List<Data>> get responseJson => _responseJson;
  String get kelas => _kelas;
  String get namaakun => _namaakun;

 
  set kelas(String value ){
    _kelas = value;
    notifyListeners();
  }

  set namaakun(String value ){
    _namaakun = value;
    notifyListeners();
  }




}