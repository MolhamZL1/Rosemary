import 'package:flutter/material.dart';
import 'package:medecin_app/constants.dart';
import 'package:medecin_app/models/medicine_model.dart';
import 'package:medecin_app/services/search_category_service.dart';
import 'package:medecin_app/services/search_medicin.dart';
import 'package:medecin_app/widgets/customCard.dart';
import 'package:medecin_app/widgets/customCategoryCard.dart';
import '../generated/l10n.dart';

class SearchPage extends StatefulWidget {
  static String id = 'SearchPage';

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  String dropdownvalue = "category";
  String? searchingInput;
  axiscount() {
    if (dropdownvalue == "category")
      return 1.2;
    else
      return 1.6;
  }

  @override
  Widget build(BuildContext context) {
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
          title: TextField(
            decoration: InputDecoration(
              iconColor: Colors.white,
              prefixIcon: Icon(Icons.search),
              enabledBorder: InputBorder.none,
              border: InputBorder.none,
            ),
            onSubmitted: (value) {
              print(value);
              searchingInput = value;
              setState(() {});
            },
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.only(top: 5),
              child: DropdownButton<String>(
                  dropdownColor: kcolor,
                  value: dropdownvalue,
                  icon: Icon(Icons.filter_list),
                  style: TextStyle(color: Colors.white),
                  items: [
                    DropdownMenuItem<String>(
                        value: "category",
                        child: Text(
                          S.of(context).category,
                          style: TextStyle(fontSize: 20),
                        )),
                    DropdownMenuItem<String>(
                        value: "medicin",
                        child: Text(S.of(context).medicin,
                            style: TextStyle(fontSize: 20))),
                  ],
                  onChanged: (value) {
                    setState(() {
                      dropdownvalue = value!;
                    });
                  }),
            )
          ],
        ),
        body: searchingInput != null
            ? Padding(
                padding: const EdgeInsets.only(left: 10, right: 10, top: 15),
                child: dropdownvalue == "category"
                    ? FutureBuilder<List<dynamic>>(
                        future: SearchCategoryService()
                            .getSearchCategory(category: searchingInput!),
                        builder: (context, snapshot) {
                          if (snapshot.hasData) {
                            List<dynamic> categories = snapshot.data!;
                            return GridView.builder(
                                itemCount: categories.length,
                                gridDelegate:
                                    SliverGridDelegateWithFixedCrossAxisCount(
                                        crossAxisCount: 2,
                                        childAspectRatio: 1.2,
                                        crossAxisSpacing: 10,
                                        mainAxisSpacing: 20),
                                itemBuilder: (context, index) {
                                  return CustomCategoryCard(
                                    category: categories[index],
                                  );
                                });
                          }
                          //put a nice image here
                          else {
                            return Center(child: CircularProgressIndicator());
                          }
                        })
                    : FutureBuilder<List<MedicineModel>>(
                        future: SearchMedicinesService()
                            .getSearchMedicines(medicine: searchingInput!),
                        builder: (context, snapshot) {
                          if (snapshot.hasData) {
                            List<MedicineModel> medicines = snapshot.data!;
                            return GridView.builder(
                                itemCount: medicines.length,
                                gridDelegate:
                                    SliverGridDelegateWithFixedCrossAxisCount(
                                        crossAxisCount: 2,
                                        childAspectRatio: 1.6,
                                        crossAxisSpacing: 10,
                                        mainAxisSpacing: 20),
                                itemBuilder: (context, index) {
                                  return CustomCard(
                                    medicine: medicines[index],
                                  );
                                });
                          } //put a nice image here
                          else {
                            return Center(child: CircularProgressIndicator());
                          }
                        }),
              )
            : Center(
                child: Image.asset(
                  "assets/images/undraw_Searching_re_3ra9.png",
                  height: 10,
                ),
              ) //put a nice image here,
        );
  }
}
