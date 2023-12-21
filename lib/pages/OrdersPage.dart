import 'package:flutter/material.dart';
import 'package:medecin_app/widgets/customOrder.dart';

class OrdersPage extends StatelessWidget {
  const OrdersPage({super.key});
  static String id = "OrdersPage";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
          padding: const EdgeInsets.only(left: 16, right: 16, top: 20),
          child:
              // FutureBuilder(
              //     //future: AllOrdersService().getAllOrders(),
              //     builder: (context, snapshot) {
              //       if (snapshot.hasData) {
              //  List<String> orders = snapshot.data!;
              //return
              Expanded(
            child: ListView.builder(
                //  itemCount: orders.length,

                itemBuilder: (context, index) {
              return const Padding(
                padding: EdgeInsets.only(bottom: 16),
                child: CustomOrder(
                    //  order: orders[index],
                    ),
              );
            }),
          ) //;
          //  }else {
          //   return Center(child: CircularProgressIndicator());
          //}
          //  }
          //),
          ),
    );
  }
}
