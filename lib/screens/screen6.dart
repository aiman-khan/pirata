import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:maps_de/utils/Colors.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import '../utils/drawer.dart';
import 'package:get/get.dart';

class Screen6 extends StatefulWidget {
  const Screen6({Key? key}) : super(key: key);

  @override
  State createState() => _Screen6State();
}

class _Screen6State extends State<Screen6> {
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
          child: Text("AGENDAR VISITA".toUpperCase(),textAlign: TextAlign.center, style: TextStyle(fontSize: size.width * 0.04,color: Colors.white,fontWeight: FontWeight.w600),),
        ),
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: size.height * 0.05,),
            Padding(
              padding: EdgeInsets.only(left: size.width * 0.04, right: size.width * 0.04,top: size.width * 0.05,bottom: size.width * 0.01),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                      onTap: (){
                        Get.back();
                      },
                      child: const Icon(Icons.arrow_back)),
                  Text("NOMBRE TIENDA", style: TextStyle(color: Colors.black,fontSize: size.width * 0.05,fontWeight: FontWeight.bold),),
                  const Icon(Icons.filter_b_and_w_rounded),
                ],
              ),
            ),
            SizedBox(height: size.height * 0.02,),
            const Divider(color: Color(0xffCFCFCF),),
            Padding(
              padding: EdgeInsets.all(size.width * 0.05),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(size.width * 0.02),
                  border: Border.all(width: 2)
                ),
                child:  TextField(
                  decoration: InputDecoration(
                    hintText: "Buscar producto",
                    contentPadding: EdgeInsets.all(size.width * 0.04),
                    hintStyle: const TextStyle(color: Colors.black),
                    suffixIcon: const Icon(Icons.search,color: Colors.black,),
                    focusedBorder: InputBorder.none,
                    disabledBorder: InputBorder.none,
                    enabledBorder: InputBorder.none,
                  ),
                ),
              ),
            ),
            const Divider(color: Color(0xffCFCFCF),),
            Padding(
              padding: EdgeInsets.only(left: size.width * 0.05),
              child: ListTile(
                leading: Container(
                  height: size.width * 0.1,
                  width: size.width * 0.1,
                  color: const Color(0xffF5F5F5),
                ),
                title: const Text("0 Cajas", style: TextStyle(fontWeight: FontWeight.bold,color: Colors.red),),
                subtitle: const Text("Bites Camu Camu",style: TextStyle(color: Colors.red),),
                trailing: const Icon(Icons.delete_outline,color: Colors.black,),
              ),
            ),
            const Divider(color: Color(0xffCFCFCF),),
            Padding(
              padding: EdgeInsets.only(left: size.width * 0.05),
              child: ListTile(
                leading: Container(
                  height: size.width * 0.1,
                  width: size.width * 0.1,
                  color: const Color(0xffF5F5F5),
                ),
                title: const Text("0 Bolsas", style: TextStyle(fontWeight: FontWeight.bold,color: Colors.red),),
                subtitle: const Text("Tostaditas Chile limon",style: TextStyle(color: Colors.red),),
                trailing: const Icon(Icons.delete_outline,color: Colors.black,),
              ),
            ),
            const Divider(color: Color(0xffCFCFCF),),
            Padding(
              padding: EdgeInsets.only(left: size.width * 0.05),
              child: ListTile(
                leading: Container(
                  height: size.width * 0.1,
                  width: size.width * 0.1,
                  color: const Color(0xffF5F5F5),
                ),
                title: const Text("11 Cajas", style: TextStyle(fontWeight: FontWeight.bold),),
                subtitle: const Text("Bites Camu Camu"),
                trailing: Icon(Icons.delete_outline,color: Colors.black,),
              ),
            ),
            const Divider(color: Color(0xffCFCFCF),),
            Padding(
              padding: EdgeInsets.only(left: size.width * 0.05),
              child: ListTile(
                leading: Container(
                  height: size.width * 0.1,
                  width: size.width * 0.1,
                  color: const Color(0xffF5F5F5),
                ),
                title: const Text("11 Cajas", style: TextStyle(fontWeight: FontWeight.bold),),
                subtitle: const Text("Bites Camu Camu"),
                trailing: Icon(Icons.delete_outline,color: Colors.black,),
              ),
            ),
            const Divider(color: Color(0xffCFCFCF),),
            Padding(
              padding: EdgeInsets.only(left: size.width * 0.05),
              child: ListTile(
                leading: Container(
                  height: size.width * 0.1,
                  width: size.width * 0.1,
                  color: const Color(0xffF5F5F5),
                ),
                title: const Text("11 Cajas", style: TextStyle(fontWeight: FontWeight.bold),),
                subtitle: const Text("Bites Camu Camu"),
                trailing: Icon(Icons.delete_outline,color: Colors.black,),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: size.width * 0.05),
              child: ListTile(
                title: Text("Última visita", style: TextStyle( fontSize: size.width * 0.04),),
                subtitle: Text("10 / Enero / 2023",style: TextStyle(fontSize: size.width * 0.05),),
                trailing: Container(
                  padding: EdgeInsets.all(size.width * 0.03),
                    decoration: BoxDecoration(
                      color: Color(0xffD9D9D9),
                      borderRadius: BorderRadius.circular(size.width * 0.01)
                    ),
                    child: const Icon(Icons.note_alt_outlined,color: Colors.black,)),
              ),
            ),
            SizedBox(height: size.height * 0.05,),
          ],
        ),
      ),
    );
  }
}
