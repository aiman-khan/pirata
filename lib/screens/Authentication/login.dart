import 'package:flutter/material.dart';
import 'package:maps_de/screens/Authentication/registration.dart';
import 'package:maps_de/screens/Authentication/reset_password.dart';

import 'package:get/get.dart';
import 'package:maps_de/screens/Home/home_profile.dart';
import 'package:maps_de/screens/Home/main_home.dart';
import 'package:maps_de/utils/app_popups.dart';

import '../../common_widgets/custom_text_field.dart';
import '../../services/firebase_services.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: SizedBox(
          height: size.height,
          child: Padding(
            padding: EdgeInsets.all(size.width * 0.08),
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(
                    children: [
                      Text(
                        "Bienvenido",
                        style: TextStyle(
                            fontSize: size.width * 0.07,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: size.height * 0.03,
                      ),
                      Text(
                        "Lorem ipsum dolor sit amet,\n consectetur adipiscing elit. Nullam\n lorem magna",
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: size.width * 0.04),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      CustomTextField(
                          controller: _emailController,
                          size: size,
                          validator: (v) {
                            if (v!.isEmpty) {
                              return "This field is required.";
                            }
                            if (!v.isEmail) {
                              return 'Invalid email';
                            }

                            return null;
                          },
                          hintText: "juansnchz@gmail.com"),
                      SizedBox(
                        height: size.height * 0.015,
                      ),
                      CustomTextField(
                        controller: _passwordController,
                        size: size,
                        hintText: "*******",
                      ),
                      SizedBox(
                        height: size.height * 0.01,
                      ),
                      Row(
                        children: [
                          GestureDetector(
                              onTap: () {
                                Get.to(() => const ResetPassword());
                              },
                              child: Text(
                                "¿Olvidaste tu contraseña?",
                                style: TextStyle(fontSize: size.width * 0.04),
                              )),
                        ],
                      ),
                    ],
                  ),
                  GestureDetector(
                    onTap: () async {
                      if (_formKey.currentState!.validate()) {
                        AppPopUps().showProgressDialog(context: context);
                        try {
                          await signInUser(
                            _emailController.text,
                            _passwordController.text,
                            context,
                          );
                          AppPopUps().dissmissDialog(context);

                          Get.to(HomeProfile());
                        } catch (e) {}

                        // AppPopUps().dissmissDialog(context);
                      }
                    },
                    child: Container(
                      width: size.width,
                      padding: EdgeInsets.all(size.width * 0.05),
                      decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius:
                              BorderRadius.circular(size.width * 0.02)),
                      child: Text(
                        "entrar".toUpperCase(),
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: size.width * 0.04,
                            color: Colors.white,
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                  ),
                  Column(
                    children: [
                      Text(
                        "¿No tienes una cuenta?",
                        style: TextStyle(fontSize: size.width * 0.04),
                      ),
                      GestureDetector(
                          onTap: () {
                            Get.to(() => Registration());
                          },
                          child: Text(
                            "Regístrate",
                            style: TextStyle(
                                fontSize: size.width * 0.04,
                                color: Colors.blue),
                          )),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
