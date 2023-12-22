import 'package:medecin_app/constants.dart';
import 'package:medecin_app/helper/api.dart';

class AddOrderService {
  Future<Map<String, dynamic>> addOrderService(body) async {
    Map<String, dynamic> data = await Api()
        .post(url: '$baseUrl/addorder', body: body); //token and user name
    return data;
  }
}
