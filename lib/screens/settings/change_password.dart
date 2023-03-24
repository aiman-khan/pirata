import 'package:flutter/material.dart';
import 'package:maps_de/screens/settings/recover_password.dart';
import 'package:table_calendar/table_calendar.dart';
import '../../../utils/drawer.dart';
import 'package:get/get.dart';

class ChangePassword extends StatefulWidget {
  const ChangePassword({Key? key}) : super(key: key);

  @override
  State createState() => _ChangePasswordState();
}

class _ChangePasswordState extends State<ChangePassword> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      bottomNavigationBar: Padding(
        padding: EdgeInsets.all(size.width * 0.05),
        child: GestureDetector(
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
            child: Text("guardar".toUpperCase(),textAlign: TextAlign.center, style: TextStyle(fontSize: size.width * 0.04,color: Colors.white,fontWeight: FontWeight.w600),),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(size.width * 0.05),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
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
                  Text("CAMBIAR CONTRASEÑA", style: TextStyle(color: Colors.black,fontSize: size.width * 0.05,fontWeight: FontWeight.bold),),
                  SizedBox(width: size.width * 0.05,)
                ],
              ),
              SizedBox(height: size.height * 0.02,),
              Text("La contraseña debe tener al menos 6 caracteres e incluir una combinación de números y letras.",textAlign: TextAlign.center, style: TextStyle(color: Colors.black,fontSize: size.width * 0.04),),
              SizedBox(height: size.height * 0.07,),
              Row(
                children: [
                  Text("Contraseña Actual", style: TextStyle(fontSize: size.width * 0.045),),
                ],
              ),
              SizedBox(height: size.height * 0.01,),
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(size.width * 0.02),
                    border: Border.all(width: 1.5)
                ),
                child:  TextField(
                  decoration: InputDecoration(
                    // hintText: "juansnchz@gmail.com",
                    contentPadding: EdgeInsets.all(size.width * 0.04),
                    focusedBorder: InputBorder.none,
                    disabledBorder: InputBorder.none,
                    enabledBorder: InputBorder.none,
                  ),
                ),
              ),
              SizedBox(height: size.height * 0.02,),
              Row(
                children: [
                  Text("Contraseña Actual", style: TextStyle(fontSize: size.width * 0.045),),
                ],
              ),
              SizedBox(height: size.height * 0.01,),
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(size.width * 0.02),
                    border: Border.all(width: 1.5)
                ),
                child:  TextField(
                  decoration: InputDecoration(
                    // hintText: "juansnchz@gmail.com",
                    contentPadding: EdgeInsets.all(size.width * 0.04),
                    focusedBorder: InputBorder.none,
                    disabledBorder: InputBorder.none,
                    enabledBorder: InputBorder.none,
                  ),
                ),
              ),
              SizedBox(height: size.height * 0.02,),
              Row(
                children: [
                  Text("Contraseña Actual", style: TextStyle(fontSize: size.width * 0.045),),
                ],
              ),
              SizedBox(height: size.height * 0.01,),
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(size.width * 0.02),
                    border: Border.all(width: 1.5)
                ),
                child:  TextField(
                  decoration: InputDecoration(
                    // hintText: "juansnchz@gmail.com",
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
                  Get.to(() => const RecoverPassword());
                },
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Si olvidaste tu contraseña puedes", style: TextStyle(color: Colors.black,fontSize: size.width * 0.04),),
                    Text("restablecerla aquí", style: TextStyle(color: Colors.blue,fontSize: size.width * 0.04,),),
                  ],
                ),
              ),
              SizedBox(height: size.height * 0.02,),
            ],
          ),
        ),
      ),
    );
  }
}
