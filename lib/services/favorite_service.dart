import 'package:medecin_app/constants.dart';
import 'package:medecin_app/helper/api.dart';

class FavoriteService {
  Future<List<dynamic>> getFavorite() async {
    List<String> data = await Api().get(url: '$baseUrl/favorite');

    return data;
  }
}
