import 'package:flutter/material.dart';
import 'package:medecin_app/models/medicine_model.dart';
import 'package:medecin_app/services/all_medicines_services.dart';
import 'package:medecin_app/widgets/customCard.dart';
import 'package:flutter/foundation.dart' show kIsWeb;

class FavouritesPage extends StatelessWidget {
  const FavouritesPage({super.key});
  static String id = "FavouritesPage";
  int getCrossAxisCount() {
    if (kIsWeb) return 6;
    return 2;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(left: 10, right: 10, top: 15),
        child: FutureBuilder<List<MedicineModel>>(
            future:
                AllMedicinesService().getAllMedicines(category: "Analgesic"),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                List<MedicineModel> medicines = snapshot.data!;
                return GridView.builder(
                    itemCount: medicines.length,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            childAspectRatio: 1.6,
                            crossAxisSpacing: 10,
                            mainAxisSpacing: 10),
                    itemBuilder: (context, index) {
                      return CustomCard(
                        medicine: medicines[index],
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
