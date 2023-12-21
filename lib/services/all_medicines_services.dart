import 'package:medecin_app/constants.dart';
import 'package:medecin_app/helper/api.dart';
import 'package:medecin_app/models/medicine_model.dart';

class AllMedicinesService {
  Future<List<MedicineModel>> getAllMedicines(
      {required String category}) async {
    List<dynamic> data = await Api().get(url: '$baseUrl/medicines/$category');

    List<MedicineModel> medicinesList = [];
    for (int i = 0; i < data.length; i++) {
      medicinesList.add(
        MedicineModel.fromJson(data[i]),
      );
    }
    return medicinesList;
  }
}
