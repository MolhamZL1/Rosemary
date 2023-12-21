import 'package:flutter/material.dart';
import 'package:medecin_app/generated/l10n.dart';

class OrderPage extends StatelessWidget {
  const OrderPage({super.key});
  static String id = "OrderPage";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: Container(
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
        ),
        title: Text(S.of(context).My_Order),
      ),
    );
  }
}
