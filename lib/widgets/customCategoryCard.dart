import 'package:flutter/material.dart';
import 'package:medecin_app/generated/l10n.dart';
import 'package:medecin_app/pages/porductsPage.dart';

class CustomCategoryCard extends StatefulWidget {
  CustomCategoryCard({required this.category});
  String? category;

  @override
  State<CustomCategoryCard> createState() => _CustomCategoryCardState();
}

class _CustomCategoryCardState extends State<CustomCategoryCard> {
  @override
  List<dynamic>? favourite;
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        Navigator.pushNamed(
          context,
          ProductsPage.id,
          arguments: widget.category,
        );
      },
      child: Container(
        height: 95,
        decoration: BoxDecoration(boxShadow: [
          BoxShadow(
              color: Colors.grey.withOpacity(0.6),
              blurRadius: 40,
              spreadRadius: 0,
              offset: const Offset(10, 10)),
        ]),
        child: Card(
            elevation: 10,
            color: const Color(0xFF3AAFB8),
            child: Column(
              children: [
                Expanded(
                  child: SizedBox(
                    width: double.infinity,
                    child: FittedBox(
                      fit: BoxFit.fill,
                      child: Row(
                        children: [
                          Image.asset(
                            getimage(),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Center(
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 15),
                    child: Text(
                      getText(),
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    ),
                  ),
                )
              ],
            )),
      ),
    );
  }

  getimage() {
    if (widget.category == "Analgesic")
      return "assets/images/Anti.jpg";
    else if (widget.category == "Antibiotic")
      return "assets/images/R (2).jpg";
    else if (widget.category == "Anti-inflammatory")
      return "assets/images/R (1).jpg";
    else if (widget.category == "Antipyretic")
      return "assets/images/R.jpg";
    else if (widget.category == "Antihistamine")
      return "assets/images/R (3).jpg";
    else
      return "assets/images/R (4).jpg";
  }

  getText() {
    if (widget.category == "Analgesic")
      return S.of(context).Analgesic;
    else if (widget.category == "Antibiotic")
      return S.of(context).Antibiotic;
    else if (widget.category == "Anti-inflammatory")
      return S.of(context).Anti;
    else if (widget.category == "Antipyretic")
      return S.of(context).Antipyretic;
    else if (widget.category == "Antihistamine")
      return S.of(context).Antihistamine;
    else
      return S.of(context).others;
  }
}
