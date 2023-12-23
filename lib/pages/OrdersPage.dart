import 'package:flutter/material.dart';
import 'package:medecin_app/models/OrderModel.dart';
import 'package:medecin_app/services/all_orders_service.dart';
import 'package:medecin_app/widgets/customOrder.dart';

class OrdersPage extends StatelessWidget {
  const OrdersPage({super.key});
  static String id = "OrdersPage";
  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.only(left: 16, right: 16, top: 20),
        child: FutureBuilder<List<OrderModel>>(
            future: AllOrdersService().getAllOrders(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                List<OrderModel> orders = snapshot.data!;
                return Column(
                  children: [
                    Image.asset("assets/images/undraw_delivery_truck_vt6p.png"),
                    Expanded(
                      child: ListView.builder(
                          itemCount: orders.length,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: EdgeInsets.only(bottom: 16),
                              child: CustomOrder(
                                order: orders[index],
                              ),
                            );
                          }),
                    ),
                  ],
                );
              } else {
                return Center(child: CircularProgressIndicator());
              }
            }),
      ),
    );
  }
}
