import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:medecin_app/constants.dart';
import 'package:medecin_app/generated/l10n.dart';
import 'package:medecin_app/helper/showSnackBar.dart';
import 'package:medecin_app/models/medicine_model.dart';
import 'package:medecin_app/services/add_to_cart_service.dart';

import 'cartPage.dart';

class ProductPage extends StatefulWidget {
  ProductPage({super.key});

  static String id = "ProductPage";

  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  int _quantity = 0;
  @override
  Widget build(BuildContext context) {
    MedicineModel medicin =
        ModalRoute.of(context)!.settings.arguments as MedicineModel;
    return Scaffold(
        appBar: AppBar(
          flexibleSpace: Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
              colors: [
                Color(0xFF0F919E),
                Color(0xFF3AAFB8),
                Color(0xFF63CAD1),
              ],
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
            )),
          ),
          title: Text(medicin.trade_name),
          actions: [
            IconButton(
                padding: EdgeInsets.symmetric(horizontal: 16),
                onPressed: () {
                  Navigator.pushNamed(context, CartPage.id);
                },
                icon: Icon(
                  FontAwesomeIcons.cartPlus,
                ))
          ],
        ),
        backgroundColor: Colors.white,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Image.asset(
              "assets/images/undraw_medicine_b1ol.png",
              height: 250,
            ),
            Container(
              height: 400,
              width: double.infinity,
              decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                        color: Colors.grey.withOpacity(0.9),
                        blurRadius: 40,
                        spreadRadius: 20,
                        offset: Offset(10, 10)),
                  ],
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(55),
                      topRight: Radius.circular(55))),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 25, vertical: 16),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "${S.of(context).product_Name} : "
                          "${medicin.scientific_name}",
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.bold),
                        ),
                        Container(
                          height: 60,
                          width: 100,
                          child: Center(
                              child: Text(
                            r"$" "${medicin.price}",
                            style: TextStyle(color: Colors.white, fontSize: 20),
                          )),
                          decoration: BoxDecoration(
                              color: kcolor,
                              borderRadius: BorderRadius.circular(20)),
                        )
                      ],
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 22, vertical: 10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(
                                  "${S.of(context).category} : "
                                  "${medicin.category}",
                                  style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 22, vertical: 10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(
                                  "${S.of(context).factory} : "
                                  "${medicin.manufacturer}",
                                  style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 22, vertical: 10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(
                                  "${S.of(context).DateTime} : "
                                  "${medicin.expiry_date.year}/${medicin.expiry_date.month}/${medicin.expiry_date.day}",
                                  style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 22, vertical: 10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(
                                  "${S.of(context).quantity} : "
                                  "${medicin.quantity_available}",
                                  style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 8),
                          height: 60,
                          width: 150,
                          decoration: BoxDecoration(
                              color: Colors.grey.shade300,
                              borderRadius: BorderRadius.circular(55)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              GestureDetector(
                                onTap: () {
                                  if (_quantity != 0) {
                                    _quantity--;
                                    setState(() {});
                                  }
                                },
                                child: CircleAvatar(
                                  radius: 22,
                                  backgroundColor: kcolor,
                                  child: Center(
                                    child: Icon(
                                      Icons.remove,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ),
                              Text(
                                "${_quantity}",
                                style: TextStyle(fontSize: 20),
                              ),
                              GestureDetector(
                                onTap: () {
                                  _quantity++;
                                  setState(() {});
                                },
                                child: CircleAvatar(
                                  radius: 22,
                                  backgroundColor: kcolor,
                                  child: Center(
                                    child: Icon(
                                      Icons.add,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        ElevatedButton(
                            style: ButtonStyle(
                                shape: MaterialStateProperty.all(
                                  RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(22),
                                  ),
                                ),
                                fixedSize:
                                    MaterialStateProperty.all(Size(180, 60)),
                                backgroundColor:
                                    MaterialStateProperty.all(kcolor)),
                            onPressed: () async {
                              if (_quantity != 0) {
                                try {
                                  await AddToCartService().addToCartService({
                                    "id": medicin.id,
                                    "quantity": _quantity.toString(),
                                    "token": token
                                  });

                                  showSnackBar(context,
                                      massege: S.of(context).added,
                                      color: Colors.green);
                                  _quantity = 0;
                                  setState(() {});
                                } on Exception catch (e) {
                                  showSnackBar(context,
                                      massege: S.of(context).Not_available,
                                      color: Colors.red);
                                }
                              } else
                                showSnackBar(context,
                                    massege: S.of(context).Insert_Quantity,
                                    color: Colors.red);
                            },
                            child: Text(S.of(context).AddTOCArt))
                      ],
                    ),
                  )
                ],
              ),
            ),
          ],
        ));
  }
}
