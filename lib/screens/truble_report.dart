import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:maps_de/screens/problem_screen.dart';
import 'package:maps_de/screens/store_name_part3.dart';

class TroubleReport extends StatefulWidget {
  const TroubleReport({Key? key}) : super(key: key);

  @override
  State createState() => _TroubleReportState();
}

class _TroubleReportState extends State<TroubleReport> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(left: size.width * 0.08,right: size.width * 0.08,top: size.width * 0.08),
              child: Column(
                children: [
                  SizedBox(height: size.height * 0.02,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: (){
                          Get.back();
                        },
                          child: const Icon(Icons.arrow_back)),
                      Text("NOMBRE DE TIENDA ", style: TextStyle(fontSize: size.width * 0.05,fontWeight: FontWeight.bold),),
                      SizedBox(width: size.width * 0.04,),
                    ],
                  ),
                  Text("ID Visita: 2089597", style: TextStyle(fontSize: size.width * 0.04),),
                  SizedBox(height: size.height * 0.02,),
                  Text("Selecciona la situación y/o completa\ncon tu comentario para una mayor solución",textAlign: TextAlign.center, style: TextStyle(fontSize: size.width * 0.04),),
                  SizedBox(height: size.height * 0.02,),
                ],
              ),
            ),
            const Divider(color: Colors.black,),
            Padding(
              padding: EdgeInsets.all(size.width * 0.05),
              child: Column(
                children: [
                  Row(
                    children: [
                      const Icon(Icons.radio_button_off_outlined),
                      SizedBox(width: size.width * 0.05,),
                      Text("Posible problema 1",style: TextStyle(fontSize: size.width * 0.045),)
                    ],
                  ),
                  SizedBox(height: size.height * 0.02,),
                  Row(
                    children: [
                      const Icon(Icons.radio_button_off_outlined),
                      SizedBox(width: size.width * 0.05,),
                      Text("Posible problema 2",style: TextStyle(fontSize: size.width * 0.045),)
                    ],
                  ),
                  SizedBox(height: size.height * 0.02,),
                  Row(
                    children: [
                      const Icon(Icons.radio_button_off_outlined),
                      SizedBox(width: size.width * 0.05,),
                      Text("Posible problema 3",style: TextStyle(fontSize: size.width * 0.045),)
                    ],
                  ),
                  SizedBox(height: size.height * 0.02,),
                  Row(
                    children: [
                      const Icon(Icons.radio_button_checked),
                      SizedBox(width: size.width * 0.05,),
                      Text("Otro",style: TextStyle(fontSize: size.width * 0.045),)
                    ],
                  ),
                ],
              ),
            ),
            const Divider(color: Colors.black,),
            Padding(
              padding: EdgeInsets.all(size.width * 0.05),
              child: Container(
                width: size.width,
                height: size.height * 0.2,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(size.width * 0.04),
                    border: Border.all(width: 1.5)
                ),
                child:  TextField(
                  decoration: InputDecoration(
                    hintText: "Describe con exactitud el problema",
                    contentPadding: EdgeInsets.all(size.width * 0.04),
                    focusedBorder: InputBorder.none,
                    disabledBorder: InputBorder.none,
                    enabledBorder: InputBorder.none,
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(size.width * 0.05),
              child: GestureDetector(
                onTap: (){
                  Get.to(() => const StoreNamePart3());
                },
                child: Container(
                  width: size.width,
                  padding: EdgeInsets.all(size.width * 0.04),
                  decoration: BoxDecoration(
                      color: const Color(0xffBDBDBD),
                      borderRadius: BorderRadius.circular(size.width * 0.02)
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Icon(Icons.camera_alt_outlined),
                      Text("agregar evidencia".toUpperCase(),textAlign: TextAlign.center, style: TextStyle(fontSize: size.width * 0.04,color: Colors.white,fontWeight: FontWeight.w600),),
                      const Icon(Icons.camera_alt_outlined,color: Colors.transparent,),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(size.width * 0.05),
              child: GestureDetector(
                onTap: (){
                  Get.to(() => const ProblemScreen());
                },
                child: Container(
                  width: size.width,
                  padding: EdgeInsets.all(size.width * 0.05),
                  decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(size.width * 0.02)
                  ),
                  child: Text("enviar reporte".toUpperCase(),textAlign: TextAlign.center, style: TextStyle(fontSize: size.width * 0.04,color: Colors.white,fontWeight: FontWeight.w600),),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
