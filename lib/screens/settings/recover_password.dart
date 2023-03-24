import 'package:flutter/material.dart';
import 'package:maps_de/utils/Colors.dart';
import 'package:get/get.dart';

class RecoverPassword extends StatefulWidget {
  const RecoverPassword({Key? key}) : super(key: key);

  @override
  State createState() => _RecoverPasswordState();
}

class _RecoverPasswordState extends State<RecoverPassword> {
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
                Text("Recuperar cuenta", style: TextStyle(fontSize: size.width * 0.07, fontWeight: FontWeight.bold),),
                SizedBox(height: size.height * 0.03,),
                Text("Ingresa tu correo para cambiar tu\n contraseña",textAlign: TextAlign.center, style: TextStyle(fontSize: size.width * 0.04),),
                SizedBox(height: size.height * 0.06,),
                Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(size.width * 0.02),
                      border: Border.all(width: 1.5)
                  ),
                  child:  TextField(
                    decoration: InputDecoration(
                      hintText: "jane@gmail.com",
                      contentPadding: EdgeInsets.all(size.width * 0.04),
                      focusedBorder: InputBorder.none,
                      disabledBorder: InputBorder.none,
                      enabledBorder: InputBorder.none,
                    ),
                  ),
                ),
                SizedBox(height: size.height * 0.03,),
                GestureDetector(
                  onTap: (){
                    // Get.to(() => const FilesUpload());
                  },
                  child: Container(
                    width: size.width,
                    padding: EdgeInsets.all(size.width * 0.05),
                    decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(size.width * 0.02)
                    ),
                    child: Text("enviar".toUpperCase(),textAlign: TextAlign.center, style: TextStyle(fontSize: size.width * 0.04,color: Colors.white,fontWeight: FontWeight.w600),),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
