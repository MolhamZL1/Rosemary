import 'package:flutter/material.dart';
import 'package:medecin_app/models/OrderModel.dart';

import '../generated/l10n.dart';

class CustomOrder extends StatelessWidget {
  CustomOrder({required this.order});
  OrderModel? order;

  Widget build(BuildContext context) {
    getTextpaid() {
      return order!.paid == "Not Paid"
          ? S.of(context).not_paid
          : S.of(context).Paid;
    }

    getText() {
      if (order!.status == "preparing")
        return S.of(context).preparing;
      else if (order!.paid == "sending")
        return S.of(context).sending;
      else
        return S.of(context).recived;
    }

    return GestureDetector(
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          gradient: const LinearGradient(
            colors: [
              Color(0xFF0F919E),
              Color(0xFF3AAFB8),
              Color(0xFF63CAD1),
            ],
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
          ),
        ),
        height: 180,
        child: Padding(
          padding: EdgeInsets.all(16),
          child: FittedBox(
            fit: BoxFit.scaleDown,
            alignment: Alignment.centerRight,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "${S.of(context).Order_Number} : ${order!.ordernumber}",
                  style: TextStyle(fontSize: 20, color: Colors.white),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "${S.of(context).state} : ${getText()}",
                  style: TextStyle(fontSize: 20, color: Colors.white),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "${order!.date.year}"
                  "/"
                  "${order!.date.month}"
                  "/"
                  "${order!.date.day}",
                  style: TextStyle(fontSize: 20, color: Colors.white),
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "${getTextpaid()}",
                      style: TextStyle(fontSize: 20, color: Colors.white),
                    ),
                    SizedBox(
                      width: 220,
                    ),
                    Text(
                      r"$" "${order!.total_price.toString()}",
                      style: TextStyle(fontSize: 20, color: Colors.white),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
