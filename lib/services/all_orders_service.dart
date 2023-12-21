import 'package:medecin_app/helper/api.dart';

class AllOrdersService {
  Future<List<dynamic>> getAllOrders({required String token}) async {
    List<dynamic> data =
        await Api().get(url: 'put the get url here with token');

    return data;
  }
}
