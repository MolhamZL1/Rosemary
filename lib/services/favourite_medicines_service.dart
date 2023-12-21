import 'package:medecin_app/helper/api.dart';
import 'package:medecin_app/models/medicine_model.dart';

class FavouriteMedicinesService {
  Future<List<MedicineModel>> getFavouriteMedicines(
      {required String token}) async {
    List<dynamic> data = await Api()
        .get(url: 'put the get url here with category', token: token);

    List<MedicineModel> medicinesList = [];
    for (int i = 0; i < data.length; i++) {
      medicinesList.add(
        MedicineModel.fromJson(data[i]),
      );
    }
    return medicinesList;
  }
}
