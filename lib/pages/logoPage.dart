import 'dart:async';

import 'package:flutter/material.dart';
import 'package:medecin_app/constants.dart';
import 'package:medecin_app/generated/l10n.dart';
import 'package:medecin_app/pages/homePage.dart';
import 'package:medecin_app/pages/loginPage.dart';
import 'package:medecin_app/providers/provider.dart';
import 'package:medecin_app/shared/shared.dart';
import 'package:provider/provider.dart';

//import '../shared/shared.dart';

class LogoPage extends StatefulWidget {
  const LogoPage({super.key});
  static String id = "LogoPage";

  @override
  State<LogoPage> createState() => _LogoPageState();
}

class _LogoPageState extends State<LogoPage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getToken();

    Timer(
        const Duration(seconds: 2),
        () => Navigator.pushReplacementNamed(
            context, token != null ? HomePage.id : LogInPage.id));
  }

  Future<void> getToken() async {
    await CacheNetwork.cacheInitialization();
    token = await CacheNetwork.getCacheData(key: 'token');
    username = await CacheNetwork.getCacheData(key: 'username');
    String? language = await CacheNetwork.getCacheData(key: 'language');
    if (language != null)
      Provider.of<dProvider>(context, listen: false).setLanguage(language);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
            gradient: LinearGradient(
          colors: [
            Color(0xFF0F919E),
            Color(0xFF3AAFB8),
            Color(0xFF63CAD1),
          ],
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
        )),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircleAvatar(
                    radius: 100,
                    backgroundImage: AssetImage(
                      klogo,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Text(S.of(context).title_logo,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 35,
                  fontFamily: 'Pacifico',
                )),
          ],
        ),
      ),
    );
  }
}
