import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:medecin_app/helper/api.dart';
import 'package:medecin_app/helper/showSnackBar.dart';

import 'package:medecin_app/pages/homePage.dart';
import 'package:medecin_app/shared/shared.dart';
import '../constants.dart';
import '../generated/l10n.dart';
import '../widgets/customButton.dart';
import '../widgets/customTextFild.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});
  static String id = "RegisterPage";

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  bool isobsecure = true;
  String? userName, password, phoneNumber;
  GlobalKey<FormState> formKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: Form(
          key: formKey,
          child: ListView(
            children: [
              const SizedBox(
                height: 70,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    "assets/images/undraw_Mobile_login_re_9ntv.png",
                    height: 200,
                  )
                ],
              ),
              const SizedBox(height: 30),
              Text(
                S.of(context).Register,
                style: TextStyle(
                  fontSize: 25,
                  color: Colors.black,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              CustomTextFild(
                onChanged: (value) {
                  setState(() {
                    userName = value;
                  });
                },
                obsecure: false,
                hintText: S.of(context).UserName,
              ),
              const SizedBox(height: 12),
              CustomTextFild(
                extraValidator: () {
                  if (phoneNumber?.length != 10 ||
                      phoneNumber![0] != '0' ||
                      phoneNumber![1] != '9') {
                    return "The Phone Number you entered is wrong";
                  }
                },
                onChanged: (value) {
                  setState(() {
                    phoneNumber = value;
                  });
                },
                keyboardType: TextInputType.number,
                obsecure: false,
                hintText: S.of(context).phoneNumber,
              ),
              const SizedBox(height: 12),
              CustomTextFild(
                extraValidator: () {
                  if (password!.length < 6) {
                    return "The password should be at least 6 digit";
                  }
                },
                onChanged: (value) {
                  setState(() {
                    password = value;
                  });
                },
                obsecure: isobsecure,
                icon: IconButton(
                    onPressed: () {
                      if (isobsecure == false)
                        isobsecure = true;
                      else
                        isobsecure = false;
                      setState(() {});
                    },
                    color: kcolor,
                    icon: Icon(isobsecure == false
                        ? FontAwesomeIcons.eye
                        : FontAwesomeIcons.eyeSlash)),
                hintText: S.of(context).password,
              ),
              const SizedBox(height: 20),
              CustomButton(
                onTap: () async {
                  if (formKey.currentState!.validate()) {
                    showDialog(
                        context: context,
                        builder: (context) {
                          return Center(child: CircularProgressIndicator());
                        });
                    await register(context);
                  }
                },
                text: S.of(context).Register,
              ),
              const SizedBox(height: 12),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    S.of(context).Read_register,
                    style: TextStyle(color: Colors.black),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Text(
                      S.of(context).title_login,
                      style: TextStyle(
                        color: kcolor,
                        fontSize: 18,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> register(BuildContext context) async {
    Map<String, dynamic> data = await Api().post(
      url: '$baseUrl/register',
      body: {
        "username": "$userName",
        "phone": "$phoneNumber",
        "password": "$password"
      },
    );
    if (data['message'] == "Registration successful") {
      await CacheNetwork.insertToCache(key: 'token', value: data['token']);
      Navigator.pop(context);
      Navigator.pushReplacementNamed(context, HomePage.id);
    } else {
      showSnackBar(
        context,
        massege: data["message"],
        color: Colors.red,
      );
      Navigator.pop(context);
    }
  }
}
