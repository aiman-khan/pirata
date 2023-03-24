import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import '../utils/drawer.dart';
import 'package:get/get.dart';

class Screen7 extends StatefulWidget {
  const Screen7({Key? key}) : super(key: key);

  @override
  State createState() => _Screen7State();
}

class _Screen7State extends State<Screen7> {
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
                  Text("AGENDAR VISITA", style: TextStyle(color: Colors.black,fontSize: size.width * 0.05,fontWeight: FontWeight.bold),),
                  const Icon(Icons.filter_b_and_w_rounded,color: Colors.transparent,),
                ],
              ),
            ),
            SizedBox(height: size.height * 0.02,),
            const Divider(color: Color(0xffCFCFCF),),
            SizedBox(height: size.height * 0.02,),
            Padding(
              padding: EdgeInsets.only(left: size.width * 0.05),
              child: Row(
                children: [
                  Text("Listado de tiendas", style: TextStyle(color: Colors.black,fontSize: size.width * 0.05,fontWeight: FontWeight.bold),),
                ],
              ),
            ),
            const ListTile(
              leading: Icon(Icons.card_giftcard,color: Colors.black,),
              title: Text("Nombre de la tienda", style: TextStyle(fontWeight: FontWeight.bold),),
              subtitle: Text("# de la tienda"),
            ),
            const ListTile(
              leading: Icon(Icons.card_giftcard,color: Colors.black,),
              title: Text("Nombre de la tienda", style: TextStyle(fontWeight: FontWeight.bold),),
              subtitle: Text("# de la tienda"),
            ),
            Padding(
              padding: EdgeInsets.only(left: size.width * 0.08, right: size.width * 0.08,top: size.width * 0.01,bottom: size.width * 0.03),
              child: Container(
                width: size.width,
                padding: EdgeInsets.all(size.width * 0.04),
                decoration: BoxDecoration(
                    color: const Color(0xffF5F5F5),
                    borderRadius: BorderRadius.circular(size.width * 0.02)
                ),
                child: Text("Agregar tienda a la ruta",textAlign: TextAlign.center, style: TextStyle(fontSize: size.width * 0.04,color: Colors.black,fontWeight: FontWeight.w600),),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: size.width * 0.08, right: size.width * 0.08,top: size.width * 0.01,bottom: size.width * 0.05),
              child: Container(
                width: size.width,
                padding: EdgeInsets.all(size.width * 0.04),
                decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(size.width * 0.02)
                ),
                child: Text("VER RUTA OPTIMA",textAlign: TextAlign.center, style: TextStyle(fontSize: size.width * 0.04,color: Colors.white,fontWeight: FontWeight.w600),),
              ),
            ),
            const Divider(color: Color(0xffCFCFCF),),
            Padding(
              padding: EdgeInsets.only(left: size.width * 0.05,top: size.height * 0.01),
              child: Row(
                children: [
                  Text("Asigna un promotor", style: TextStyle(color: Colors.black,fontSize: size.width * 0.05,fontWeight: FontWeight.bold),),
                ],
              ),
            ),
            ListTile(
              leading: Container(
                width: size.width * 0.12,
                decoration: const BoxDecoration(
                  color: Colors.grey,
                  shape: BoxShape.circle
                ),
              ),
              title: const Text("Rev Shawn", style: TextStyle(fontWeight: FontWeight.bold),),
              subtitle: const Text("Ver perfil"),
              trailing: const Icon(Icons.radio_button_checked,color: Colors.black,),
            ),
            ListTile(
              leading: Container(
                width: size.width * 0.12,
                decoration: const BoxDecoration(
                    color: Colors.grey,
                    shape: BoxShape.circle
                ),
              ),
              title: const Text("Rev Shawn", style: TextStyle(fontWeight: FontWeight.bold),),
              subtitle: const Text("Ver perfil"),
              trailing: const Icon(Icons.radio_button_off_outlined,color: Colors.black,),
            ),
            ListTile(
              leading: Container(
                width: size.width * 0.12,
                decoration: const BoxDecoration(
                    color: Colors.grey,
                    shape: BoxShape.circle
                ),
              ),
              title: const Text("Rev Shawn", style: TextStyle(fontWeight: FontWeight.bold),),
              subtitle: const Text("Ver perfil"),
              trailing: const Icon(Icons.radio_button_checked,color: Colors.black,),
            ),
            ListTile(
              leading: Container(
                width: size.width * 0.12,
                decoration: const BoxDecoration(
                    color: Colors.grey,
                    shape: BoxShape.circle
                ),
              ),
              title: const Text("Rev Shawn", style: TextStyle(fontWeight: FontWeight.bold),),
              subtitle: const Text("Ver perfil"),
              trailing: const Icon(Icons.radio_button_off_outlined,color: Colors.black,),
            ),
            const Divider(color: Color(0xffCFCFCF),),
            Padding(
              padding: EdgeInsets.only(left: size.width * 0.05,top: size.height * 0.01),
              child: Row(
                children: [
                  Text("Asigna una fecha", style: TextStyle(color: Colors.black,fontSize: size.width * 0.05,fontWeight: FontWeight.bold),),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.all(size.width * 0.05),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(size.width * 0.02),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                        blurRadius: 2,
                      spreadRadius: 3,
                      offset: const Offset(2, 3),
                      color: Colors.grey.shade300,
                    )
                  ]
                ),
                child: TableCalendar(
                  firstDay: DateTime.utc(2010, 10, 16),
                  lastDay: DateTime.utc(2030, 3, 14),
                  focusedDay: DateTime.now(),
                ),
              ),
            ),

            SizedBox(height: size.height * 0.05,),
          ],
        ),
      ),
    );
  }
}
