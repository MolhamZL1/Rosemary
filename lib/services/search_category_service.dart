import 'package:medecin_app/constants.dart';
import 'package:medecin_app/helper/api.dart';

class SearchCategoryService {
  Future<List<dynamic>> getSearchCategory({required String category}) async {
    List<dynamic> data =
        await Api().get(url: '$baseUrl/searchByCategory/$category');
    return data;
  }
}
