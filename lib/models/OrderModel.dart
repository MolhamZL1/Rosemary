import 'package:medecin_app/models/medicine_model.dart';

class OrderModel {
  final dynamic ordernumber;
  final String username;
  final String status;
  final dynamic total_price;
  final dynamic total_quantity;
  final String paid;
  final dynamic medicines;
  OrderModel({
    required this.ordernumber,
    required this.username,
    required this.status,
    required this.total_price,
    required this.total_quantity,
    required this.paid,
    required this.medicines,
  });

  factory OrderModel.fromJson(Map<String, dynamic> json) {
    return OrderModel(
        ordernumber: json["ordernumber"],
        username: json["username"],
        status: json["status"],
        total_price: json["total_price"],
        total_quantity: json["total_quantity"],
        paid: json["paid"],
        medicines: json["medicines"]);
  }
}
