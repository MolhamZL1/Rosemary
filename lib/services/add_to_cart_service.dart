import 'package:medecin_app/constants.dart';
import 'package:medecin_app/helper/api.dart';

class AddToCartService {
  Future<Map<String, dynamic>> addToCartService(body) async {
    Map<String, dynamic> data =
        await Api().post(url: '$baseUrl/addToCart', body: body);

    return data;
  }
}
