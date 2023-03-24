import 'package:flutter/material.dart';
import 'package:maps_de/screens/Authentication/registration.dart';
import 'package:maps_de/utils/Colors.dart';
import 'package:get/get.dart';

class ProblemScreen extends StatefulWidget {
  const ProblemScreen({Key? key}) : super(key: key);

  @override
  State createState() => _ProblemScreenState();
}

class _ProblemScreenState extends State<ProblemScreen> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.all(size.width * 0.08),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Registro Exitoso", style: TextStyle(fontSize: size.width * 0.07, fontWeight: FontWeight.bold),),
            SizedBox(height: size.height * 0.02,),
            Text("ID Visita: 2089597",textAlign: TextAlign.center, style: TextStyle(fontSize: size.width * 0.04),),
            SizedBox(height: size.height * 0.05,),
            Icon(Icons.cloud_done,color: Colors.green,size: size.width * 0.3,),
            // Image.asset("name"),
            SizedBox(height: size.height * 0.05,),
            Text("Gracias por reportar el problema\ndaremos solución lo antes posiblle",textAlign: TextAlign.center, style: TextStyle(fontSize: size.width * 0.04),),
            SizedBox(height: size.height * 0.02,),
            Text("FOLIO: 9199544",textAlign: TextAlign.center, style: TextStyle(fontSize: size.width * 0.04),),
            SizedBox(height: size.height * 0.05,),
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
                child: Text("aceptar".toUpperCase(),textAlign: TextAlign.center, style: TextStyle(fontSize: size.width * 0.04,color: Colors.white,fontWeight: FontWeight.w600),),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
