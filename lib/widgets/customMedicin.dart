import 'package:flutter/material.dart';

class CustomMedicine extends StatelessWidget {
  const CustomMedicine({
    super.key,
    required this.upper,
    required this.lower,
  });

  final String upper;
  final String lower;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15),
      child: Container(
        decoration: BoxDecoration(
          gradient: const LinearGradient(
            colors: [
              Color(0xFF0F919E),
              Color(0xFF3AAFB8),
              Color(0xFF63CAD1),
            ],
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
          ),
          borderRadius: BorderRadius.circular(15),
        ),
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            children: [
              Text(
                upper,
                style: const TextStyle(
                    fontSize: 15,
                    fontFamily: 'Merriweather',
                    fontStyle: FontStyle.italic,
                    fontWeight: FontWeight.w800),
              ),
              Text(lower,
                  style: const TextStyle(
                      fontSize: 25,
                      fontFamily: 'Kanit',
                      fontWeight: FontWeight.bold,
                      color: Colors.white)),
            ],
          ),
        ),
      ),
    );
  }
}
