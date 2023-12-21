import 'dart:convert';

import 'package:medecin_app/constants.dart';
import 'package:medecin_app/helper/api.dart';
import 'package:medecin_app/models/medicine_model.dart';

class SearchMedicinesService {
  Future<List<MedicineModel>> getSearchMedicines(
      {required String medicine}) async {
    List<dynamic> data =
        await Api().get(url: '$baseUrl/searchMedicine/$medicine');

    List<MedicineModel> medicinesList = [];
    for (int i = 0; i < data.length; i++) {
      medicinesList.add(
        MedicineModel.fromJson(data[i]),
      );
    }
    return medicinesList;
  }
}
