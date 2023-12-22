import 'package:flutter/material.dart';

class CustomTextFild extends StatelessWidget {
  CustomTextFild(
      {super.key,
      this.hintText,
      this.icon,
      required this.obsecure,
      this.keyboardType,
      required this.onChanged,
      this.extraValidator});
  String? Function()? extraValidator;

  String? hintText;
  IconButton? icon;
  Function(String) onChanged;
  bool obsecure;
  TextInputType? keyboardType;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: (data) {
        if (data!.isEmpty) {
          return "Enter the $hintText";
        }
        if (extraValidator != null) {
          String? error = extraValidator!();
          return error;
        }
      },
      onChanged: onChanged,
      keyboardType: keyboardType,
      obscureText: obsecure,
      decoration: InputDecoration(
        suffixIcon: icon,
        hintText: hintText,
        hintStyle: const TextStyle(
          color: Color.fromARGB(172, 58, 176, 184),
          fontSize: 18,
        ),
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            color: Color(0xFF3AAFB8),
          ),
        ),
        border: const OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
