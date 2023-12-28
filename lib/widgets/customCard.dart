import 'package:flutter/material.dart';
import 'package:medecin_app/constants.dart';
import 'package:medecin_app/generated/l10n.dart';
import 'package:medecin_app/models/medicine_model.dart';
import 'package:medecin_app/pages/productPage.dart';
import 'package:medecin_app/services/add_favourite_service.dart';

class CustomCard extends StatefulWidget {
  CustomCard({required this.medicine, required this.isfavourite});
  MedicineModel medicine;
  bool isfavourite;
  @override
  State<CustomCard> createState() => _CustomCardState();
}

class _CustomCardState extends State<CustomCard> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, ProductPage.id,
            arguments: widget.medicine);
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
                        " ${widget.medicine.scientific_name.substring(0, 7)}",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 5),
                      child: Text(
                        "${S.of(context).factory}: ${widget.medicine.manufacturer.substring(0, 7)}",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            '${S.of(context).price}: ${widget.medicine.price}'
                            r'$',
                            style: TextStyle(color: Colors.white),
                          ),
                          GestureDetector(
                            onTap: () {
                              if (widget.isfavourite!) {
                                AddFavouriteService().addFavouriteService({
                                  "id": widget.medicine.id,
                                  "token": token,
                                });
                                widget.isfavourite = false;

                                setState(() {});
                              } else {
                                AddFavouriteService().addFavouriteService({
                                  "id": widget.medicine.id,
                                  "token": token,
                                });
                                widget.isfavourite = true;

                                setState(() {});
                              }
                            },
                            child: geticon(),
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

  geticon() {
    return widget.isfavourite! == true
        ? Icon(Icons.favorite, color: Colors.red)
        : Icon(Icons.favorite_outline, color: Colors.white);
  }
}
