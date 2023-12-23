import 'package:flutter/material.dart';
import 'package:medecin_app/models/medicine_model.dart';
import 'package:medecin_app/pages/porductsPage.dart';
import 'package:medecin_app/services/all_medicines_services.dart';

import '../generated/l10n.dart';

class CustomCategoryCard extends StatelessWidget {
  CustomCategoryCard({required this.category});
  String? category;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        Navigator.pushNamed(context, ProductsPage.id, arguments: category);
      },
      child: Container(
        height: 95,
        decoration: BoxDecoration(boxShadow: [
          BoxShadow(
              color: Colors.grey.withOpacity(0.6),
              blurRadius: 40,
              spreadRadius: 0,
              offset: const Offset(10, 10)),
        ]),
        child: Card(
            elevation: 10,
            color: const Color(0xFF3AAFB8),
            child: Column(
              children: [
                Expanded(
                  child: SizedBox(
                    width: double.infinity,
                    child: FittedBox(
                      fit: BoxFit.fill,
                      child: Row(
                        children: [
                          Image.asset(
                            getimage(),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Center(
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 15),
                    child: Text(
                      category!,
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    ),
                  ),
                )
              ],
            )),
      ),
    );
  }

  getimage() {
    if (category == "Analgesic")
      return "assets/images/Anti.jpg";
    else if (category == "Antibiotic")
      return "assets/images/R (1).jpg";
    else if (category == "Anti-inflammatory")
      return "assets/images/R (2).jpg";
    else if (category == "Antipyretic")
      return "assets/images/R.jpg";
    else if (category == "Antihistamine")
      return "assets/images/R (3).jpg";
    else
      return "assets/images/R (4).jpg";
  }
}
