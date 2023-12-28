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
                    "assets/images/register.png",
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
    try {
      Map<String, dynamic> data = await Api().post(
        url: '$baseUrl/register',
        body: {
          "username": "$userName",
          "phone": "$phoneNumber",
          "password": "$password"
        },
      );
      await CacheNetwork.insertToCache(
          key: 'username', value: data['username']);
      await CacheNetwork.insertToCache(key: 'token', value: data['token']);
      Navigator.pop(context);
      Navigator.pushReplacementNamed(context, HomePage.id);
    } catch (e) {
      print(e.toString());
      showSnackBar(
        context,
        massege: getmessage(e.toString()),
        color: Colors.red,
      );
      Navigator.pop(context);
    }
  }

  getmessage(String message) {
    if (message ==
        "Exception: there is a problem with status code 400 with body {message: User already exists}")
      return S.of(context).not_Exist; //arabic
    else if (message ==
        "Exception: there is a problem with status code 400 with body {message: phone number must be 10 numbers}")
      return S.of(context).Numbers10; //arabic
    else if (message ==
        "Exception: there is a problem with status code 400 with body {message: password must be 8 char at least}")
      return S.of(context).Password8; //arabic
    else
      return message;
  }
}
