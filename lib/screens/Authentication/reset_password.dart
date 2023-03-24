import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ResetPassword extends StatefulWidget {
  const ResetPassword({Key? key}) : super(key: key);

  @override
  State createState() => _ResetPasswordState();
}

class _ResetPasswordState extends State<ResetPassword> {
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
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Column(
                  children: [
                    SizedBox(height: size.height * 0.05,),
                    Row(
                      children: [
                      GestureDetector(
                        onTap: (){
                          Get.back();
                        },
                          child: const Icon(Icons.arrow_back)
                      )
                    ],
                    ),
                    SizedBox(height: size.height * 0.02,),
                    Text("Recuperar cuenta", style: TextStyle(fontSize: size.width * 0.07, fontWeight: FontWeight.bold),),
                    SizedBox(height: size.height * 0.03,),
                    Text("Ingresa tu correo para cambiar tu\n contraseña",textAlign: TextAlign.center, style: TextStyle(fontSize: size.width * 0.04),),
                    SizedBox(height: size.height * 0.03,),
                    Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(size.width * 0.02),
                          border: Border.all(width: 1.5)
                      ),
                      child:  TextField(
                        decoration: InputDecoration(
                          hintText: "juansnchz@gmail.com",
                          contentPadding: EdgeInsets.all(size.width * 0.04),
                          focusedBorder: InputBorder.none,
                          disabledBorder: InputBorder.none,
                          enabledBorder: InputBorder.none,
                        ),
                      ),
                    ),
                    SizedBox(height: size.height * 0.03,),
                    Container(
                      width: size.width,
                      padding: EdgeInsets.all(size.width * 0.05),
                      decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(size.width * 0.02)
                      ),
                      child: Text("entrar".toUpperCase(),textAlign: TextAlign.center, style: TextStyle(fontSize: size.width * 0.04,color: Colors.white,fontWeight: FontWeight.w600),),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
