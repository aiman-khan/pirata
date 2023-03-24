import 'package:flutter/material.dart';
import 'package:maps_de/utils/Colors.dart';
import '../utils/drawer.dart';
import 'package:get/get.dart';

class Screen4 extends StatefulWidget {
  const Screen4({Key? key}) : super(key: key);

  @override
  State createState() => _Screen4State();
}

class _Screen4State extends State<Screen4> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      drawer:  const Drawer(
          child: SideDrawer()
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.only(left: size.width * 0.08, right: size.width * 0.08,top: size.width * 0.01,bottom: size.width * 0.03),
        child: Container(
          width: size.width,
          padding: EdgeInsets.all(size.width * 0.04),
          decoration: BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.circular(size.width * 0.02)
          ),
          child: Text("GUARDAR CAMBIOS".toUpperCase(),textAlign: TextAlign.center, style: TextStyle(fontSize: size.width * 0.04,color: Colors.white,fontWeight: FontWeight.w600),),
        ),
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: size.height * 0.05,),
            Padding(
              padding: EdgeInsets.all(size.width * 0.04),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: (){
                      Get.back();
                    },
                      child: const Icon(Icons.arrow_back)),
                  Text("CHEQUEO DE PRODUCTO", style: TextStyle(color: Colors.black,fontSize: size.width * 0.045,fontWeight: FontWeight.bold),),
                  const Icon(Icons.arrow_back,color: Colors.transparent,),
                ],
              ),
            ),
            // SizedBox(height: size.height * 0.04,),
            const Divider(color: Color(0xffCFCFCF),),
            Padding(
              padding: EdgeInsets.only(left: size.width * 0.08, right: size.width * 0.08,top: size.width * 0.05,bottom: size.width * 0.03),
              child: Container(
                width: size.width,
                padding: EdgeInsets.all(size.width * 0.04),
                decoration: BoxDecoration(
                    color: const Color(0xffF5F5F5),
                    borderRadius: BorderRadius.circular(size.width * 0.01)
                ),
                child: Text("Bites Camu Camu", style: TextStyle(fontSize: size.width * 0.035),),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: size.width * 0.08, right: size.width * 0.08,top: size.width * 0.01,bottom: size.width * 0.03),
              child: Container(
                width: size.width,
                padding: EdgeInsets.all(size.width * 0.04),
                decoration: BoxDecoration(
                    color: const Color(0xffF5F5F5),
                    borderRadius: BorderRadius.circular(size.width * 0.01)
                ),
                child: Text("Caja", style: TextStyle(fontSize: size.width * 0.035),),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: size.width * 0.08, right: size.width * 0.08,top: size.width * 0.01,bottom: size.width * 0.03),
              child: Container(
                width: size.width,
                padding: EdgeInsets.all(size.width * 0.04),
                decoration: BoxDecoration(
                    color: const Color(0xffF5F5F5),
                    borderRadius: BorderRadius.circular(size.width * 0.01)
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Medidas", style: TextStyle(fontSize: size.width * 0.035),),
                    Text("14", style: TextStyle(fontSize: size.width * 0.035),),
                    Text("x", style: TextStyle(fontSize: size.width * 0.035),),
                    Text("52", style: TextStyle(fontSize: size.width * 0.035),),
                    Text("x", style: TextStyle(fontSize: size.width * 0.035),),
                    Text("25", style: TextStyle(fontSize: size.width * 0.035),),
                  ],
                ),
              ),
            ),
            const Divider(color: Color(0xffCFCFCF),),
            Padding(
              padding: EdgeInsets.only(left: size.width * 0.08, right: size.width * 0.08,top: size.width * 0.06,bottom: size.width * 0.03),
              child: Container(
                width: size.width,
                padding: EdgeInsets.all(size.width * 0.03),
                decoration: BoxDecoration(
                    color: buttonColor,
                    borderRadius: BorderRadius.circular(size.width * 0.02)
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    const Icon(Icons.image_outlined),
                    Text("PRODUCTO EN ALMACEN".toUpperCase(),textAlign: TextAlign.center, style: TextStyle(fontSize: size.width * 0.04,color: Colors.white,fontWeight: FontWeight.w600),),
                    const Icon(Icons.image_outlined,color: Colors.transparent,),
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: size.width * 0.08, right: size.width * 0.08,top: size.width * 0.01,bottom: size.width * 0.03),
              child: Container(
                width: size.width,
                padding: EdgeInsets.all(size.width * 0.03),
                decoration: BoxDecoration(
                    color: buttonColor,
                    borderRadius: BorderRadius.circular(size.width * 0.02)
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    const Icon(Icons.image_outlined),
                    Text("PRODUCTO EN MOSTRADOR".toUpperCase(),textAlign: TextAlign.center, style: TextStyle(fontSize: size.width * 0.04,color: Colors.white,fontWeight: FontWeight.w600),),
                    const Icon(Icons.image_outlined,color: Colors.transparent,),
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: size.width * 0.08, right: size.width * 0.08,top: size.width * 0.01,bottom: size.width * 0.06),
              child: Container(
                width: size.width,
                padding: EdgeInsets.all(size.width * 0.03),
                decoration: BoxDecoration(
                    color: buttonColor,
                    borderRadius: BorderRadius.circular(size.width * 0.02)
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    const Icon(Icons.image_outlined),
                    Text("lote y caducidad".toUpperCase(),textAlign: TextAlign.center, style: TextStyle(fontSize: size.width * 0.04,color: Colors.white,fontWeight: FontWeight.w600),),
                    const Icon(Icons.image_outlined,color: Colors.transparent,),
                  ],
                ),
              ),
            ),
            const Divider(color: Color(0xffCFCFCF),),
            SizedBox(height: size.height * 0.1,),
          ],
        ),
      ),
    );
  }
}
