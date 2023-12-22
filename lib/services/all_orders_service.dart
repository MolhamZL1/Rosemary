import 'package:medecin_app/constants.dart';
import 'package:medecin_app/helper/api.dart';
import 'package:medecin_app/models/OrderModel.dart';

class AllOrdersService {
  Future<List<OrderModel>> getAllOrders() async {
    List<dynamic> data = await Api().get(url: '$baseUrl/orders/$token');

    List<OrderModel> ordersList = [];
    for (int i = 0; i < data.length; i++) {
      ordersList.add(
        OrderModel.fromJson(data[i]),
      );
    }
    return ordersList;
  }
}
