import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:maps_de/screens/Authentication/login.dart';
import 'package:maps_de/screens/Home/main_home.dart';
import 'package:table_calendar/table_calendar.dart';
import '../../../utils/drawer.dart';
import 'package:get/get.dart';

import 'change_password.dart';
import 'editor_screen.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({Key? key}) : super(key: key);

  @override
  State createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(size.width * 0.05),
          child: Column(
            children: [
              SizedBox(height: size.height * 0.07,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                      onTap: (){
                        Get.back();
                      },
                      child: const Icon(Icons.arrow_back)
                  ),
                  Text("CONFIGURACIÓN", style: TextStyle(color: Colors.black,fontSize: size.width * 0.05,fontWeight: FontWeight.bold),),
                  SizedBox(width: size.width * 0.05,)
                ],
              ),
              SizedBox(height: size.height * 0.07,),
              Row(
                children: [
                  Text("Editar datos de contacto", style: TextStyle(fontWeight: FontWeight.bold,fontSize: size.width * 0.05),),
                ],
              ),
              SizedBox(height: size.height * 0.05,),
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(size.width * 0.02),
                    border: Border.all(width: 1.5)
                ),
                child:  TextField(
                  decoration: InputDecoration(
                    hintText: "Juan Carlos Pérez Sánchez",
                    contentPadding: EdgeInsets.all(size.width * 0.04),
                    focusedBorder: InputBorder.none,
                    disabledBorder: InputBorder.none,
                    enabledBorder: InputBorder.none,
                  ),
                ),
              ),
              SizedBox(height: size.height * 0.02,),
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(size.width * 0.02),
                    border: Border.all(width: 1.5)
                ),
                child:  TextField(
                  decoration: InputDecoration(
                    hintText: "JuanSnchz@gmail.com",
                    contentPadding: EdgeInsets.all(size.width * 0.04),
                    focusedBorder: InputBorder.none,
                    disabledBorder: InputBorder.none,
                    enabledBorder: InputBorder.none,
                  ),
                ),
              ),
              SizedBox(height: size.height * 0.02,),
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(size.width * 0.02),
                    border: Border.all(width: 1.5)
                ),
                child:  TextField(
                  decoration: InputDecoration(
                    hintText: "776 095 0045",
                    contentPadding: EdgeInsets.all(size.width * 0.04),
                    focusedBorder: InputBorder.none,
                    disabledBorder: InputBorder.none,
                    enabledBorder: InputBorder.none,
                  ),
                ),
              ),
              SizedBox(height: size.height * 0.02,),
              GestureDetector(
                onTap: (){
                  // Get.to(() => const MainHome());
                },
                child: Container(
                  width: size.width,
                  padding: EdgeInsets.all(size.width * 0.05),
                  decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(size.width * 0.02)
                  ),
                  child: Text("GUARDAR CAMBIOS".toUpperCase(),textAlign: TextAlign.center, style: TextStyle(fontSize: size.width * 0.04,color: Colors.white,fontWeight: FontWeight.w600),),
                ),
              ),
              SizedBox(height: size.height * 0.02,),
              const Divider(color: Colors.black,),
              SizedBox(height: size.height * 0.02,),
              GestureDetector(
                onTap: (){
                  Get.to(() => const ChangePassword());
                },
                child: Row(
                  children: [
                    Image.asset("images/key.png"),
                    SizedBox(width: size.width * 0.05,),
                    Text("Cambiar contrasena",style: TextStyle(fontSize: size.width * 0.045),)
                  ],
                ),
              ),
              SizedBox(height: size.height * 0.02,),
              const Divider(color: Colors.black,),
              SizedBox(height: size.height * 0.02,),
              GestureDetector(
                onTap: (){
                  Get.to(() => const EditScreen());
                },
                child: Row(
                  children: [
                    Image.asset("images/map1.png"),
                    SizedBox(width: size.width * 0.05,),
                    Text("Editar tu dirección",style: TextStyle(fontSize: size.width * 0.045),)
                  ],
                ),
              ),
              SizedBox(height: size.height * 0.02,),
              const Divider(color: Colors.black,),
              SizedBox(height: size.height * 0.02,),
              GestureDetector(
                onTap: (){
                  AwesomeDialog(
                    context: context,
                    animType: AnimType.scale,
                    dialogType: DialogType.noHeader,
                    body: Column(
                      children: [
                        SizedBox(height: size.height * 0.02,),
                        Text("CERRAR SESIÓN",style: TextStyle(fontSize: size.width * 0.06),),
                        SizedBox(height: size.height * 0.03,),
                        Text("¿Estás seguro de\n cerrar sesión?",textAlign: TextAlign.center,style: TextStyle(fontSize: size.width * 0.04),),
                        SizedBox(height: size.height * 0.03,),
                        const Divider(color: Colors.black,thickness: 2,),
                        IntrinsicHeight(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              GestureDetector(
                                  onTap: (){
                                    Get.back();
                                  },
                                  child: Text("Cancelar",style: TextStyle(fontSize: size.width * 0.06,fontWeight: FontWeight.bold),)
                              ),
                              const VerticalDivider(color: Colors.black,thickness: 2),
                              GestureDetector(
                                onTap: (){
                                  Get.offAll(() => const LoginScreen());
                                },
                                  child: Text("Aceptar",style: TextStyle(fontSize: size.width * 0.06,fontWeight: FontWeight.bold),)
                              ),
                            ],),
                        ),
                        SizedBox(height: size.height * 0.015,),
                      ],
                    ),
                  ).show();
                },
                child: Row(
                  children: [
                    Image.asset("images/logincurve.png"),
                    SizedBox(width: size.width * 0.05,),
                    Text("Cerrar sesión",style: TextStyle(fontSize: size.width * 0.045),)
                  ],
                ),
              ),
              SizedBox(height: size.height * 0.02,),
              const Divider(color: Colors.black,),
              SizedBox(height: size.height * 0.05,),
            ],
          ),
        ),
      ),
    );
  }
}
