import 'package:flutter/material.dart';
import 'package:medecin_app/constants.dart';
import 'package:medecin_app/generated/l10n.dart';
import 'package:medecin_app/helper/showSnackBar.dart';
import 'package:medecin_app/models/medicine_model.dart';
import 'package:medecin_app/pages/productPage.dart';
import 'package:medecin_app/services/remove_cart_service.dart';

class CustomCardCart extends StatefulWidget {
  CustomCardCart({required this.medecine, required this.fun});
  MedicineModel medecine;
  Function? fun;

  @override
  State<CustomCardCart> createState() => _CustomCardCartState();
}

class _CustomCardCartState extends State<CustomCardCart> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, ProductPage.id,
            arguments: widget.medecine);
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
                    Padding(
                      padding: const EdgeInsets.only(top: 5),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "${S.of(context).product_Name}"
                            ":"
                            " ${widget.medecine.scientific_name.substring(0, 7)}",
                            style: TextStyle(color: Colors.white),
                          ),
                          GestureDetector(
                              onTap: () async {
                                try {
                                  await RemoveCartService().removeCartService({
                                    "id": widget.medecine.id,
                                    "token": token
                                  });

                                  showSnackBar(context,
                                      massege: S.of(context).deleted,
                                      color: Colors.green);
                                } on Exception catch (e) {
                                  showSnackBar(context,
                                      massege: e.toString(), color: Colors.red);
                                }
                                widget.fun!();
                              },
                              child: Icon(Icons.delete))
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 5),
                      child: Text(
                        "${S.of(context).factory} : ${widget.medecine.manufacturer.substring(0, 7)}",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            '${S.of(context).price} : ${widget.medecine.price}'
                            r'$',
                            style: TextStyle(color: Colors.white),
                          ),
                          Text(
                            widget.medecine.quantity_available
                                .toString(), //medecine.quantityRequired
                            style: TextStyle(color: Colors.white),
                          )
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
