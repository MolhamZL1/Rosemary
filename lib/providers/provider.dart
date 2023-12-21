import 'package:flutter/material.dart';

class dProvider extends ChangeNotifier {
  String language = 'en';

  void setLanguage(String ln) {
    language = ln;
    notifyListeners();
  }
}
