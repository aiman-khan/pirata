import 'package:flutter/material.dart';
import 'package:maps_de/screens/Authentication/registration.dart';
import 'package:maps_de/screens/Authentication/reset_password.dart';

import 'package:get/get.dart';

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
                      Text("Bienvenido", style: TextStyle(fontSize: size.width * 0.07, fontWeight: FontWeight.bold),),
                      SizedBox(height: size.height * 0.03,),
                      Text("Lorem ipsum dolor sit amet,\n consectetur adipiscing elit. Nullam\n lorem magna",textAlign: TextAlign.center, style: TextStyle(fontSize: size.width * 0.04),),
                    ],
                  ),
                  Column(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(size.width * 0.02),
                            border: Border.all(width: 1.5)
                        ),
                        child:  TextFormField(
                          controller: _emailController,
                          decoration: InputDecoration(
                            hintText: "juansnchz@gmail.com",
                            contentPadding: EdgeInsets.all(size.width * 0.04),
                            focusedBorder: InputBorder.none,
                            disabledBorder: InputBorder.none,
                            enabledBorder: InputBorder.none,
                          ),
                        ),
                      ),
                      SizedBox(height: size.height * 0.015,),
                      Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(size.width * 0.02),
                            border: Border.all(width: 1.5)
                        ),
                        child:  TextFormField(
                          controller: _passwordController,
                          decoration: InputDecoration(
                            hintText: "*******",
                            contentPadding: EdgeInsets.all(size.width * 0.04),
                            focusedBorder: InputBorder.none,
                            disabledBorder: InputBorder.none,
                            enabledBorder: InputBorder.none,
                          ),
                        ),
                      ),
                      SizedBox(height: size.height * 0.01,),
                      Row(
                        children: [
                          GestureDetector(
                            onTap: (){
                              Get.to(() => const ResetPassword());
                            },
                              child: Text("¿Olvidaste tu contraseña?", style: TextStyle(fontSize: size.width * 0.04),)
                          ),
                        ],
                      ),
                    ],
                  ),
                  GestureDetector(
                    onTap: ()async{
                      await signInUser(
                          _emailController.text,
                          _passwordController.text,

                          context,
                      );
                    },
                    child: Container(
                      width: size.width,
                      padding: EdgeInsets.all(size.width * 0.05),
                      decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(size.width * 0.02)
                      ),
                      child: Text("entrar".toUpperCase(),textAlign: TextAlign.center, style: TextStyle(fontSize: size.width * 0.04,color: Colors.white,fontWeight: FontWeight.w600),),
                    ),
                  ),
                  Column(
                    children: [
                      Text("¿No tienes una cuenta?", style: TextStyle(fontSize: size.width * 0.04),),
                      GestureDetector(
                        onTap: (){
                          Get.to(() => const Registration());
                        },
                          child: Text("Regístrate", style: TextStyle(fontSize: size.width * 0.04,color: Colors.blue),)
                      ),
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
