import 'package:medecin_app/constants.dart';
import 'package:medecin_app/helper/api.dart';

class AllCategoriesService {
  Future<List<dynamic>> getAllCateogires() async {
    List<dynamic> data = await Api().get(url: '$baseUrl/categories');

    return data;
  }
}
