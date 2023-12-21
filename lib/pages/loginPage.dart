import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:medecin_app/helper/api.dart';
import 'package:medecin_app/helper/showSnackBar.dart';
import 'package:medecin_app/pages/homePage.dart';
import 'package:medecin_app/pages/registerPage.dart';
import 'package:medecin_app/shared/shared.dart';
import '../constants.dart';
import '../generated/l10n.dart';
import '../widgets/customButton.dart';
import '../widgets/customTextFild.dart';

class LogInPage extends StatefulWidget {
  static String id = "LogInPage";

  @override
  State<LogInPage> createState() => _LogInPageState();
}

class _LogInPageState extends State<LogInPage> {
  String? phoneNumber, password;
  bool isobsecure = true;
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
                height: 75,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    "assets/images/undraw_Login_re_4vu2.png",
                    height: 200,
                  )
                ],
              ),
              const SizedBox(height: 100),
              Text(
                S.of(context).title_login,
                style: TextStyle(
                  fontSize: 25,
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 12),
              CustomTextFild(
                keyboardType: TextInputType.phone,
                onChanged: (value) {
                  setState(() {
                    phoneNumber = value;
                  });
                },
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
                    await login(context);
                  }
                },
                text: S.of(context).title_login,
              ),
              const SizedBox(height: 12),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    S.of(context).Read_login,
                    style: TextStyle(color: Colors.black),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, RegisterPage.id);
                    },
                    child: Text(
                      S.of(context).Register,
                      style: TextStyle(
                        color: Color(0xFF3AAFB8),
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

  Future<void> login(BuildContext context) async {
    try {
      Map<String, dynamic> data = await Api().post(
        url: '$baseUrl/login',
        body: {"phone": "$phoneNumber", "password": "$password"},
      );

      await CacheNetwork.insertToCache(key: 'token', value: data['token']);
      Navigator.pop(context);
      Navigator.pushReplacementNamed(context, HomePage.id);
    } catch (e) {
      print(e.toString());
      Navigator.pop(context);
      showSnackBar(
        context,
        massege: e.toString() ==
                "Exception: there is a problem with status code 401 with body {message: phone number is incorrect}"
            ? "phone number is incorrect"
            : "password is incorrect",
        color: Colors.red,
      );
    }
  }
}
