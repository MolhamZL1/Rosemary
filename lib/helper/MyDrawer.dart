import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:medecin_app/constants.dart';
import 'package:medecin_app/generated/l10n.dart';
import 'package:medecin_app/pages/loginPage.dart';
import 'package:medecin_app/providers/provider.dart';
import 'package:medecin_app/shared/shared.dart';
import 'package:provider/provider.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.white,
      child: ListView(
        children: [
          DrawerHeader(
              margin: EdgeInsets.only(bottom: 0),
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                colors: [
                  Color(0xFF0F919E),
                  Color(0xFF3AAFB8),
                  Color(0xFF63CAD1),
                ],
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
              )),
              child: Center(
                  child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircleAvatar(
                      radius: 50,
                      backgroundImage:
                          AssetImage(klogo)), //put the logo app here
                  Row(
                    children: [
                      Text(
                        username!,
                        style: TextStyle(
                            color: Colors.white,
                            fontFamily: "Pacifico",
                            fontSize: 20),
                      ),
                    ],
                  )
                ],
              ))),
          ListTile(
            onTap: () {
              showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                        actions: [
                          TextButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: Text(S.of(context).Close),
                          )
                        ],
                        title: Text(S.of(context).Language),
                        contentPadding: EdgeInsets.all(20),
                        content: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            TextButton(
                                onPressed: () async {
                                  Provider.of<dProvider>(context, listen: false)
                                      .setLanguage('ar');
                                  await CacheNetwork.insertToCache(
                                      key: 'language', value: "ar");
                                  Navigator.pop(context);
                                },
                                child: Text(
                                  S.of(context).Arabic,
                                  style: TextStyle(color: kcolor),
                                )),
                            TextButton(
                                onPressed: () async {
                                  Provider.of<dProvider>(context, listen: false)
                                      .setLanguage('en');
                                  await CacheNetwork.insertToCache(
                                      key: 'language', value: "en");
                                  Navigator.pop(context);
                                },
                                child: Text(
                                  S.of(context).English,
                                  style: TextStyle(color: kcolor),
                                ))
                          ],
                        ),
                      ));
            },
            leading: Icon(FontAwesomeIcons.language),
            title: Text(
              S.of(context).Language,
              style: TextStyle(color: Colors.black, fontSize: 15),
            ),
          ),
          ListTile(
            onTap: () {
              showDialog(
                context: context,
                builder: (context) => AlertDialog(
                  actions: [
                    TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Row(
                        children: [
                          TextButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: Text(S.of(context).No),
                          ),
                          TextButton(
                            onPressed: () async {
                              await CacheNetwork.deleteCacheItem(key: "token");
                              Navigator.pushReplacementNamed(
                                  context, LogInPage.id);
                            },
                            child: Text(S.of(context).Yes),
                          ),
                        ],
                      ),
                    )
                  ],
                  title: Text(S.of(context).Log_Out),
                  contentPadding: EdgeInsets.all(20),
                  content: Text(
                    S.of(context).AreYouSure,
                    style: TextStyle(color: kcolor),
                  ),
                ),
              );
            },
            leading: Icon(Icons.logout),
            title: Text(
              S.of(context).Log_Out,
              style: TextStyle(color: Colors.black, fontSize: 15),
            ),
          ),
        ],
      ),
    );
  }
}
