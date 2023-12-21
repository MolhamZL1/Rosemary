import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:medecin_app/constants.dart';
import 'package:medecin_app/generated/l10n.dart';
import 'package:medecin_app/helper/showSnackBar.dart';
import 'package:medecin_app/models/medicine_model.dart';
import 'package:medecin_app/services/add_to_cart_service.dart';
import 'package:medecin_app/widgets/customMedicin.dart';

import 'cartPage.dart';

class ProductPage extends StatefulWidget {
  ProductPage({super.key});

  static String id = "ProductPage";

  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  String? quantity;
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
              onPressed: () {},
              icon: Icon(
                Icons.favorite_outline,
              )),
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
      backgroundColor: Color(0xFFECE6E6),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: ListView(
                children: [
                  CustomMedicine(
                      upper: S.of(context).scientificName,
                      lower: medicin.scientific_name),
                  Row(
                    children: [
                      Expanded(
                        child: CustomMedicine(
                          upper: S.of(context).category,
                          lower: medicin.category,
                        ),
                      ),
                      Expanded(
                          child: CustomMedicine(
                        upper: S.of(context).factory,
                        lower: medicin.manufacturer,
                      ))
                    ],
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: CustomMedicine(
                          upper: S.of(context).price,
                          lower: medicin.price.toString(),
                        ),
                      ),
                      Expanded(
                          child: CustomMedicine(
                        upper: S.of(context).quantity,
                        lower: medicin.quantity_available.toString(),
                      )),
                    ],
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: CustomMedicine(
                          upper: S.of(context).DateTime,
                          lower: "${medicin.expiry_date.year}"
                              "/"
                              "${medicin.expiry_date.month}"
                              "/"
                              "${medicin.expiry_date.day}",
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                style: TextStyle(fontFamily: 'Kanit', color: Color(0xff51BEC4)),
                keyboardType: TextInputType.number,
                onChanged: (data) {
                  quantity = data;
                },
                onSubmitted: (data) {
                  quantity = data;
                },
                decoration: InputDecoration(
                    hintText: S.of(context).Enter_the_quantity,
                    suffixIcon: IconButton(
                      padding: EdgeInsets.only(right: 15),
                      onPressed: () async {
                        try {
                          await AddToCartService().addToCartService({
                            "id": medicin.id,
                            "quantity": quantity,
                            "token": token
                          });
                        } on Exception catch (e) {
                          showSnackBar(context,
                              massege: "الكمية المطلوبة غير متاحة",
                              color: Colors.red);
                        }
                      },
                      icon: Icon(FontAwesomeIcons.cartPlus),
                      color: kcolor,
                    ),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: BorderSide(color: kcolor)),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: BorderSide(color: kcolor))),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
