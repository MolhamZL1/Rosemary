import 'package:flutter/material.dart';
import 'package:medecin_app/generated/l10n.dart';
import 'package:medecin_app/models/medicine_model.dart';
import 'package:medecin_app/pages/productPage.dart';

class CustomCard extends StatelessWidget {
  CustomCard({required this.medicine});
  MedicineModel medicine;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, ProductPage.id, arguments: medicine);
      },
      child: Stack(clipBehavior: Clip.none, children: [
        Container(
          decoration: BoxDecoration(boxShadow: [
            BoxShadow(
                color: Colors.grey.withOpacity(0.6),
                blurRadius: 40,
                spreadRadius: 0,
                offset: Offset(10, 10)),
          ]),
          child: Card(
            elevation: 10,
            color: Color(0xFF3AAFB8),
            child: Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      padding: EdgeInsets.only(top: 5),
                      child: Text(
                        "${S.of(context).product_Name}"
                        ":"
                        " ${medicine.scientific_name.substring(0, 7)}",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 5),
                      child: Text(
                        "${S.of(context).factory} : ${medicine.manufacturer.substring(0, 7)}",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            '${S.of(context).price} : ${medicine.price}' r'$',
                            style: TextStyle(color: Colors.white),
                          ),
                          GestureDetector(
                            onTap: () {},
                            child: Icon(
                              Icons.favorite,
                              color: Colors.red,
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ]),
    );
  }
}
