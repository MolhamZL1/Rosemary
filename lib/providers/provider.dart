import 'package:flutter/material.dart';
import 'package:medecin_app/constants.dart';

class dProvider extends ChangeNotifier {
  String language = "en";
  void setLanguage(String ln) {
    language = ln;
    notifyListeners();
  }
}
