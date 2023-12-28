import 'package:medecin_app/constants.dart';
import 'package:medecin_app/helper/api.dart';

class RemoveCartService {
  Future<Map<String, dynamic>> removeCartService(body) async {
    Map<String, dynamic> data = await Api()
        .post(url: '$baseUrl/removeFromCart', body: body); //token and id
    return data;
  }
}
