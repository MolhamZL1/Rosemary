import 'package:medecin_app/constants.dart';
import 'package:medecin_app/helper/api.dart';
import 'package:medecin_app/models/medicine_model.dart';

class allFavouriteMedicinesService {
  Future<List<MedicineModel>> getallFavouriteMedicines() async {
    List<dynamic> data = await Api().get(url: '$baseUrl/allfavorite/$token');

    List<MedicineModel> medicinesList = [];
    for (int i = 0; i < data.length; i++) {
      medicinesList.add(
        MedicineModel.fromJson(data[i]),
      );
    }
    return medicinesList;
  }
}
