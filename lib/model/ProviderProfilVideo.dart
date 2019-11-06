import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class ProviderProfilVideo with ChangeNotifier {
  var _videoProfil=[
    {
      'id': 1,
      'link': 'https://youtu.be/9iY_Lm8eRRw?list=RD9iY_Lm8eRRw',
      'title': 'Video 1',
    },
    {
      'id': 2,
      'link': 'https://youtu.be/9iY_Lm8eRRw?list=RD9iY_Lm8eRRw',
      'title': 'Video 2',
    },
    {
      'id': 3,
      'link': 'https://youtu.be/9iY_Lm8eRRw?list=RD9iY_Lm8eRRw',
      'title': 'Video 3',
    },
  ];
  

  get videoProfil => _videoProfil;


  
  set videoProfil(var value) {
    _videoProfil = value;
    notifyListeners();
  }

}
