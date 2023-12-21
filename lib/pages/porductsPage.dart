import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:medecin_app/models/medicine_model.dart';
import 'package:medecin_app/pages/cartPage.dart';
import 'package:medecin_app/pages/searchPage.dart';
import 'package:medecin_app/services/all_medicines_services.dart';
import 'package:medecin_app/widgets/customCard.dart';
import 'package:flutter/foundation.dart' show kIsWeb;

class ProductsPage extends StatelessWidget {
  int getCrossAxisCount() {
    if (kIsWeb) return 6;
    return 2;
  }

  static String id = "ProductsPage";

  @override
  Widget build(BuildContext context) {
    String category = ModalRoute.of(context)!.settings.arguments as String;
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
        title: Text(category),
        actions: [
          IconButton(
              padding: EdgeInsets.symmetric(horizontal: 16),
              onPressed: () {
                Navigator.pushNamed(context, SearchPage.id);
              },
              icon: Icon(
                Icons.search,
              )),
          IconButton(
              padding: EdgeInsets.symmetric(horizontal: 16),
              onPressed: () {
                Navigator.pushNamed(context, CartPage.id);
              },
              icon: Icon(
                FontAwesomeIcons.cartPlus,
              ))
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 10, right: 10, top: 15),
        child: FutureBuilder<List<MedicineModel>>(
            future: AllMedicinesService().getAllMedicines(category: category),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                List<MedicineModel> medicines = snapshot.data!;
                return GridView.builder(
                    itemCount: medicines.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        childAspectRatio: 1.6,
                        crossAxisSpacing: 10,
                        mainAxisSpacing: 20),
                    itemBuilder: (context, index) {
                      return medicines != []
                          ? CustomCard(
                              medicine: medicines[index],
                            )
                          : Center(
                              child: Image.asset(
                                  "assets/images/undraw_Searching_re_3ra9.png"),
                            );
                    });
              } else {
                return Center(child: CircularProgressIndicator());
              }
            }),
      ),
    );
  }
}
