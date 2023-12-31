import 'package:flutter/material.dart';
import 'package:medecin_app/constants.dart';
import 'package:medecin_app/generated/l10n.dart';
import 'package:medecin_app/helper/showSnackBar.dart';
import 'package:medecin_app/models/medicine_model.dart';
import 'package:medecin_app/services/add_order_service.dart';
import 'package:medecin_app/services/cart_medicine_service.dart';
import 'package:medecin_app/widgets/customButton.dart';
import 'package:medecin_app/widgets/customCardCart.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});
  static String id = "CartPage";

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  updateUi() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
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
        title: Text(S.of(context).Cart),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 10, right: 10, top: 15),
        child: FutureBuilder<List<MedicineModel>>(
            future: CartMedicineService().getAllCartMedicine(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                List<MedicineModel> medicines = snapshot.data!;
                return medicines.isEmpty
                    ? Center(child: Image.asset("assets/images/empty_cart.png"))
                    : Column(
                        children: [
                          Expanded(
                            child: GridView.builder(
                                clipBehavior: Clip.none,
                                itemCount: medicines.length,
                                gridDelegate:
                                    SliverGridDelegateWithFixedCrossAxisCount(
                                        crossAxisCount: 2,
                                        childAspectRatio: 1.5,
                                        crossAxisSpacing: 10,
                                        mainAxisSpacing: 20),
                                itemBuilder: (context, index) {
                                  return CustomCardCart(
                                    medecine: medicines[index],
                                    fun: updateUi,
                                  );
                                }),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 15, vertical: 20),
                            child: CustomButton(
                                onTap: () async {
                                  await AddOrderService().addOrderService({
                                    "token": token,
                                    "username": username,
                                    "date": DateTime.now().toString()
                                  });

                                  showSnackBar(context,
                                      massege: S.of(context).succes,
                                      color: Colors.green);
                                  setState(() {});
                                },
                                text: S.of(context).Buy),
                          )
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
