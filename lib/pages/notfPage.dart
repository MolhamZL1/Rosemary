import 'package:flutter/material.dart';

class NotficationsPage extends StatelessWidget {
  const NotficationsPage({super.key});
  static String id = "NotficationsPage";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Image.asset("assets/images/undraw_My_notifications_re_ehmk.png"),
      ),
    );
  }
}
