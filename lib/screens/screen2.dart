import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:maps_de/screens/Home/home_chat.dart';
import 'package:maps_de/utils/Colors.dart';
import '../utils/drawer.dart';
import 'package:get/get.dart';

class Screen2 extends StatefulWidget {
  const Screen2({Key? key}) : super(key: key);

  @override
  State createState() => _Screen2State();
}

class _Screen2State extends State<Screen2> {
  bool _switchValue = true;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      drawer:  const Drawer(
          child: SideDrawer()
      ),
      bottomNavigationBar: Container(
        width: size.width,
        height: 60,
        padding: EdgeInsets.all(size.width * 0.04),
        decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: const [
              BoxShadow(
                  spreadRadius: 2,
                  blurRadius: 4,
                  offset: Offset(1,2),
                  color: Colors.grey
              )
            ],
            borderRadius: BorderRadius.only(topLeft: Radius.circular(size.width * 0.02),topRight: Radius.circular(size.width * 0.02))
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            const Icon(Icons.person_pin_circle_outlined),
            const Icon(Icons.calendar_today_outlined),
            const Icon(Icons.note_outlined),
            GestureDetector(
              onTap: (){
                Get.to(() => const HomeChat());
              },
                child: const Icon(Icons.message_outlined)
            )
          ],
        ),
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: size.height * 0.09,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("NOMBRE DE TIENDA ", style: TextStyle(fontSize: size.width * 0.045, fontWeight: FontWeight.bold),),
              ],
            ),
            SizedBox(height: size.height * 0.01,),
            Text("ID Visita: 2089597",textAlign: TextAlign.center, style: TextStyle(fontSize: size.width * 0.035),),
            SizedBox(height: size.height * 0.05,),
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
                title: const Text("3 Cajas", style: TextStyle(fontWeight: FontWeight.bold),),
                subtitle: const Text("Bites Camu Camu"),
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
                title: const Text("5 Bolsas", style: TextStyle(fontWeight: FontWeight.bold),),
                subtitle: const Text("Palomitas chile limon"),
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
                title: const Text("5 Bolsas", style: TextStyle(fontWeight: FontWeight.bold),),
                subtitle: const Text("Palomitas chile limon"),
              ),
            ),
            const Divider(color: Color(0xffCFCFCF),),
            Padding(
              padding: EdgeInsets.only(left: size.width * 0.08, right: size.width * 0.08,top: size.width * 0.03,bottom: size.width * 0.03),
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
                    Text("FIRMA DE GERENTE".toUpperCase(),textAlign: TextAlign.center, style: TextStyle(fontSize: size.width * 0.04,color: Colors.white,fontWeight: FontWeight.w600),),
                    const Icon(Icons.image_outlined,color: Colors.transparent,),
                  ],
                ),
              ),
            ),
            const Divider(color: Color(0xffCFCFCF),),
            Padding(
              padding: EdgeInsets.only(left: size.width * 0.08, right: size.width * 0.08,top: size.width * 0.03,bottom: size.width * 0.03),
              child: Container(
                width: size.width,
                padding: EdgeInsets.all(size.width * 0.04),
                decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(size.width * 0.02)
                ),
                child: Text("CALIFICAR TIENDA".toUpperCase(),textAlign: TextAlign.center, style: TextStyle(fontSize: size.width * 0.04,color: Colors.white,fontWeight: FontWeight.w600),),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: size.width * 0.08, right: size.width * 0.08,top: size.width * 0.01,bottom: size.width * 0.03),
              child: Container(
                width: size.width,
                padding: EdgeInsets.all(size.width * 0.04),
                decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(size.width * 0.02)
                ),
                child: Text("REPORTAR UN PROBLEMA".toUpperCase(),textAlign: TextAlign.center, style: TextStyle(fontSize: size.width * 0.04,color: Colors.white,fontWeight: FontWeight.w600),),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: size.width * 0.08, right: size.width * 0.08,top: size.width * 0.01,bottom: size.width * 0.03),
              child: Container(
                width: size.width,
                padding: EdgeInsets.all(size.width * 0.04),
                decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(size.width * 0.02)
                ),
                child: Text("HABLAR CON ADMINISTRADOR".toUpperCase(),textAlign: TextAlign.center, style: TextStyle(fontSize: size.width * 0.04,color: Colors.white,fontWeight: FontWeight.w600),),
              ),
            ),
            const Divider(color: Color(0xffCFCFCF),),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text("CHECK OUT", style: TextStyle(fontWeight: FontWeight.bold,color: const Color(0xff009A0F),fontSize: size.width * 0.04),),
                  CupertinoSwitch(
                    value: _switchValue,
                    onChanged: (value) {
                      setState(() {
                        _switchValue = value;
                      });
                    },
                  ),
                ],
              ),
            ),
            SizedBox(height: size.height * 0.05,),
          ],
        ),
      ),
    );
  }
}
