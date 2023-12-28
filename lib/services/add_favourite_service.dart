import 'package:medecin_app/constants.dart';
import 'package:medecin_app/helper/api.dart';

class AddFavouriteService {
  Future<Map<String, dynamic>> addFavouriteService(body) async {
    Map<String, dynamic> data = await Api()
        .post(url: '$baseUrl/addfavorite', body: body); //token and id
    return data;
  }
}
