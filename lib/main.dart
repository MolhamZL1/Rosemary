import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:medecin_app/generated/l10n.dart';
import 'package:medecin_app/pages/cartPage.dart';
import 'package:medecin_app/pages/favouritPage.dart';
import 'package:medecin_app/pages/homePage.dart';
import 'package:medecin_app/pages/loginPage.dart';
import 'package:medecin_app/pages/logoPage.dart';
import 'package:medecin_app/pages/notfPage.dart';
import 'package:medecin_app/pages/porductsPage.dart';
import 'package:medecin_app/pages/productPage.dart';
import 'package:medecin_app/pages/registerPage.dart';
import 'package:medecin_app/pages/searchPage.dart';
import 'package:medecin_app/providers/provider.dart';
import 'package:provider/provider.dart';

void main() async {
  runApp(ChangeNotifierProvider(
      create: (context) {
        return dProvider();
      },
      child: MedecinApp()));
}

class MedecinApp extends StatefulWidget {
  MedecinApp({super.key});

  @override
  State<MedecinApp> createState() => _MedecinAppState();
}

class _MedecinAppState extends State<MedecinApp> {
  @override
  Widget build(BuildContext context) {
    return MediaQuery(
      data: MediaQueryData.fromView(WidgetsBinding.instance.window),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: {
          RegisterPage.id: (context) => RegisterPage(),
          LogInPage.id: (context) => LogInPage(),
          LogoPage.id: (context) => LogoPage(),
          ProductsPage.id: (context) => ProductsPage(),
          HomePage.id: (context) => HomePage(),
          SearchPage.id: (context) => SearchPage(),
          CartPage.id: (context) => CartPage(),
          ProductPage.id: (context) => ProductPage(),
          FavouritesPage.id: (context) => FavouritesPage(),
          NotficationsPage.id: (context) => NotficationsPage(),
        },
        initialRoute: LogoPage.id, //show your working screen here
        locale: Locale(Provider.of<dProvider>(context).language),
        localizationsDelegates: [
          S.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: S.delegate.supportedLocales,
      ),
    );
  }
}
