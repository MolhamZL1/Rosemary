import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';

const klogo = "assets/images/logo.png";
const kcolor = Color(0xFF3AAFB8); //127.0.0.1
const String baseUrl =
    kIsWeb ? "http://127.0.0.1:8000/api" : "http://10.0.2.2:8000/api";
String? token;
String? username;
