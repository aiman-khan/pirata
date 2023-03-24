import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:maps_de/screens/store_name_part3.dart';
import 'package:maps_de/screens/truble_report.dart';

class StoreNamePart2 extends StatefulWidget {
  const StoreNamePart2({Key? key}) : super(key: key);

  @override
  State createState() => _StoreNamePart2State();
}

class _StoreNamePart2State extends State<StoreNamePart2> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      bottomNavigationBar: Padding(
        padding: EdgeInsets.all(size.width * 0.05),
        child: GestureDetector(
          onTap: (){
            Get.to(() => const StoreNamePart3());
          },
          child: Container(
            width: size.width,
            padding: EdgeInsets.all(size.width * 0.05),
            decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.circular(size.width * 0.02)
            ),
            child: Text("siguiente".toUpperCase(),textAlign: TextAlign.center, style: TextStyle(fontSize: size.width * 0.04,color: Colors.white,fontWeight: FontWeight.w600),),
          ),
        ),
      ),
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
                      GestureDetector(
                          onTap: (){
                            showModalBottomSheet(
                                context: context,
                                builder: (context) {
                                  return Wrap(
                                    children: [
                                      Container(
                                        color: Colors.white,
                                        child: Column(
                                          children: [
                                            SizedBox(height: size.height * 0.02,),
                                            Text("¿Algo no funciona?", style: TextStyle(fontSize: size.width * 0.05,fontWeight: FontWeight.bold),),
                                            SizedBox(height: size.height * 0.01,),
                                            Text("Tus comentarios son importantes, envía tu reporte.", style: TextStyle(fontSize: size.width * 0.04),),
                                            const Divider(color: Colors.black,),
                                            GestureDetector(
                                              onTap: (){
                                                Get.to(() => const TroubleReport());
                                              },
                                              child: Padding(
                                                padding: EdgeInsets.all(size.width * 0.02),
                                                child: Row(
                                                  children: [
                                                    Image.asset("images/clipboardclose.png"),
                                                    SizedBox(width: size.width * 0.02,),
                                                    Text("Reportar un problema", style: TextStyle(fontSize: size.width * 0.045,fontWeight: FontWeight.bold)),
                                                  ],
                                                ),
                                              ),
                                            ),
                                            const Divider(color: Colors.black,),
                                            GestureDetector(
                                              onTap: (){
                                                Get.to(() => const TroubleReport());
                                              },
                                              child: Padding(
                                                padding: EdgeInsets.all(size.width * 0.02),
                                                child: Row(
                                                  children: [
                                                    Image.asset("images/Vector.png"),
                                                    SizedBox(width: size.width * 0.02,),
                                                    Text("Producto descatalogado", style: TextStyle(fontSize: size.width * 0.045,fontWeight: FontWeight.bold)),
                                                  ],
                                                ),
                                              ),
                                            ),
                                            const Divider(color: Colors.black,),
                                            GestureDetector(
                                              onTap: (){
                                                Get.to(() => const TroubleReport());
                                              },
                                              child: Padding(
                                                padding: EdgeInsets.all(size.width * 0.02),
                                                child: Row(
                                                  children: [
                                                    Image.asset("images/call.png"),
                                                    SizedBox(width: size.width * 0.02,),
                                                    Text("Hablar con el administrador", style: TextStyle(fontSize: size.width * 0.045,fontWeight: FontWeight.bold)),
                                                  ],
                                                ),
                                              ),
                                            ),
                                            const Divider(color: Colors.black,),
                                            SizedBox(height: size.height * 0.01,),
                                          ],
                                        ),
                                      ),
                                    ],
                                  );
                                });
                          },
                          child: const Icon(Icons.info_outline)),
                    ],
                  ),
                  Text("ID Visita: 2089597", style: TextStyle(fontSize: size.width * 0.04),),
                  SizedBox(height: size.height * 0.02,),
                  Text("PASO 2: PISO DE VENTA", style: TextStyle(fontSize: size.width * 0.05, fontWeight: FontWeight.bold),),
                  SizedBox(height: size.height * 0.02,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        width: size.width * 0.27,
                        height: 5,
                        decoration: BoxDecoration(
                            color: const Color(0xff009A0F),
                            borderRadius: BorderRadius.circular(size.width * 0.04)
                        ),
                      ),
                      Container(
                        width: size.width * 0.27,
                        height: 5,
                        decoration: BoxDecoration(
                            color: const Color(0xff009A0F),
                            borderRadius: BorderRadius.circular(size.width * 0.04)
                        ),
                      ),
                      Container(
                        width: size.width * 0.27,
                        height: 5,
                        decoration: BoxDecoration(
                            color: const Color(0xffD9D9D9),
                            borderRadius: BorderRadius.circular(size.width * 0.04)
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: size.height * 0.02,),
                ],
              ),
            ),
            const Divider(color: Colors.black,),
            Padding(
              padding: EdgeInsets.only(left: size.width * 0.05,right: size.width * 0.05),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: (){
                      showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              title: Wrap(
                                children: [
                                  Container(
                                    color: Colors.white,
                                    child: Column(
                                      // crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        SizedBox(height: size.height * 0.02,),
                                        Text("DETALLES DE PRODUCTO", style: TextStyle(fontSize: size.width * 0.05,fontWeight: FontWeight.bold),),
                                        const Divider(color: Colors.black,),
                                        Row(
                                          children: [
                                            Text("Foto de productos", style: TextStyle(fontSize: size.width * 0.035),),
                                          ],
                                        ),
                                        SizedBox(height: size.height * 0.01,),
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            Container(
                                                height: size.width * 0.15,
                                                width: size.width * 0.15,
                                                color: const Color(0xffBDBDBD)
                                            ),
                                            Container(
                                                height: size.width * 0.15,
                                                width: size.width * 0.15,
                                                color: const Color(0xffBDBDBD)
                                            ),
                                            Container(
                                                height: size.width * 0.15,
                                                width: size.width * 0.15,
                                                color: const Color(0xffBDBDBD)
                                            ),
                                          ],
                                        ),
                                        SizedBox(height: size.height * 0.01,),
                                        Container(
                                          width: size.width,
                                          padding: EdgeInsets.all(size.width * 0.02),
                                          decoration: BoxDecoration(
                                              color: Colors.grey.shade200,
                                              borderRadius: BorderRadius.circular(size.width * 0.01)
                                          ),
                                          child: Text("SKU",style: TextStyle(fontSize: size.width * 0.035),),
                                        ),
                                        SizedBox(height: size.height * 0.01,),
                                        Row(
                                          children: [
                                            Text("Medidas", style: TextStyle(fontSize: size.width * 0.035),),
                                          ],
                                        ),
                                        SizedBox(height: size.height * 0.01,),
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                                          children: [
                                            Container(
                                              width: size.width * 0.15,
                                              padding: EdgeInsets.all(size.width * 0.02),
                                              decoration: BoxDecoration(
                                                  color: Colors.grey.shade200,
                                                  borderRadius: BorderRadius.circular(size.width * 0.01)
                                              ),
                                              child: Text("Largo",textAlign: TextAlign.center,style: TextStyle(fontSize: size.width * 0.03),),
                                            ),
                                            Text("X"),
                                            Container(
                                              width: size.width * 0.15,
                                              padding: EdgeInsets.all(size.width * 0.02),
                                              decoration: BoxDecoration(
                                                  color: Colors.grey.shade200,
                                                  borderRadius: BorderRadius.circular(size.width * 0.01)
                                              ),
                                              child: Text("Alto",textAlign: TextAlign.center,style: TextStyle(fontSize: size.width * 0.03),),
                                            ),
                                            Text("X"),
                                            Container(
                                              width: size.width * 0.15,
                                              padding: EdgeInsets.all(size.width * 0.02),
                                              decoration: BoxDecoration(
                                                  color: Colors.grey.shade200,
                                                  borderRadius: BorderRadius.circular(size.width * 0.01)
                                              ),
                                              child: Text("Ancho",textAlign: TextAlign.center,style: TextStyle(fontSize: size.width * 0.03),),
                                            ),
                                          ],
                                        ),
                                        SizedBox(height: size.height * 0.01,),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            );
                          });
                    },
                    child: Container(
                      padding: EdgeInsets.all(size.width * 0.02),
                      decoration: BoxDecoration(
                          color: Colors.grey.shade300,
                          borderRadius: BorderRadius.circular(size.width * 0.02)
                      ),
                      child: const Icon(Icons.remove_red_eye,color: Colors.white,),
                    ),
                  ),
                  Text("Palomitas amaranto, linaza",style: TextStyle(fontSize: size.width * 0.045),),
                  const Icon(Icons.arrow_drop_down_circle_outlined)
                ],
              ),
            ),
            const Divider(color: Colors.black,),
            Container(
              padding: EdgeInsets.all(size.width * 0.05),
              color: Colors.grey.shade200,
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Datos en sistema",style: TextStyle(fontSize: size.width * 0.045,fontWeight: FontWeight.bold),),
                      Text("Datos en tienda",style: TextStyle(fontSize: size.width * 0.045,fontWeight: FontWeight.bold),),
                    ],
                  ),
                  SizedBox(height: size.height * 0.01,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: size.width * 0.6,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(
                                width: size.width * 0.25,
                                child: Text("Inventario en\nanaquel",style: TextStyle(fontSize: size.width * 0.045),)),
                            Container(
                              width: size.width * 0.2,
                              padding: EdgeInsets.all(size.width * 0.03),
                              decoration: BoxDecoration(
                                  color: Colors.grey.shade500,
                                  borderRadius: BorderRadius.circular(size.width * 0.02)
                              ),
                              child: Text("10",textAlign: TextAlign.center,style: TextStyle(fontSize: size.width * 0.045,fontWeight: FontWeight.bold),),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        width: size.width * 0.25,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(size.width * 0.02),
                            border: Border.all(width: 1.5)
                        ),
                        child:  TextField(
                          decoration: InputDecoration(
                            hintText: "9",
                            contentPadding: EdgeInsets.all(size.width * 0.04),
                            focusedBorder: InputBorder.none,
                            disabledBorder: InputBorder.none,
                            enabledBorder: InputBorder.none,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: size.height * 0.01,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: size.width * 0.6,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(
                                width: size.width * 0.25,
                                child: Text("Precio",style: TextStyle(fontSize: size.width * 0.045),)),
                            Container(
                              width: size.width * 0.2,
                              padding: EdgeInsets.all(size.width * 0.03),
                              decoration: BoxDecoration(
                                  color: Colors.grey.shade500,
                                  borderRadius: BorderRadius.circular(size.width * 0.02)
                              ),
                              child: Text("\$20",textAlign: TextAlign.center,style: TextStyle(fontSize: size.width * 0.045,fontWeight: FontWeight.bold),),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        width: size.width * 0.25,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(size.width * 0.02),
                            border: Border.all(width: 1.5)
                        ),
                        child:  TextField(
                          decoration: InputDecoration(
                            hintText: "\$20",
                            contentPadding: EdgeInsets.all(size.width * 0.04),
                            focusedBorder: InputBorder.none,
                            disabledBorder: InputBorder.none,
                            enabledBorder: InputBorder.none,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: size.height * 0.01,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: size.width * 0.6,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(
                                width: size.width * 0.25,
                                child: Text("Lugar de\nexhibición",style: TextStyle(fontSize: size.width * 0.045),)),
                            Container(
                              width: size.width * 0.2,
                              padding: EdgeInsets.all(size.width * 0.03),
                              decoration: BoxDecoration(
                                  color: Colors.grey.shade500,
                                  borderRadius: BorderRadius.circular(size.width * 0.02)
                              ),
                              child: Text("Área de\norgánicos",textAlign: TextAlign.center,style: TextStyle(fontSize: size.width * 0.035,fontWeight: FontWeight.bold),),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        width: size.width * 0.25,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(size.width * 0.02),
                            border: Border.all(width: 1.5)
                        ),
                        child:  TextField(
                          decoration: InputDecoration(
                            hintText: "Orgánicos",
                            contentPadding: EdgeInsets.all(size.width * 0.04),
                            focusedBorder: InputBorder.none,
                            disabledBorder: InputBorder.none,
                            enabledBorder: InputBorder.none,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: size.height * 0.01,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: size.width * 0.6,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(
                                width: size.width * 0.25,
                                child: Text("Caducidad",style: TextStyle(fontSize: size.width * 0.045),)),
                          ],
                        ),
                      ),
                      Container(
                        width: size.width * 0.25,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(size.width * 0.02),
                            border: Border.all(width: 1.5)
                        ),
                        child:  TextField(
                          decoration: InputDecoration(
                            hintText: "Orgánicos",
                            contentPadding: EdgeInsets.all(size.width * 0.04),
                            focusedBorder: InputBorder.none,
                            disabledBorder: InputBorder.none,
                            enabledBorder: InputBorder.none,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: size.height * 0.01,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: size.width * 0.6,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(
                                width: size.width * 0.25,
                                child: Text("LOTE",style: TextStyle(fontSize: size.width * 0.045),)),
                          ],
                        ),
                      ),
                      Container(
                        width: size.width * 0.25,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(size.width * 0.02),
                            border: Border.all(width: 1.5)
                        ),
                        child:  TextField(
                          decoration: InputDecoration(
                            hintText: "Orgánicos",
                            contentPadding: EdgeInsets.all(size.width * 0.04),
                            focusedBorder: InputBorder.none,
                            disabledBorder: InputBorder.none,
                            enabledBorder: InputBorder.none,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: size.height * 0.01,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: size.width * 0.6,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(
                                width: size.width * 0.25,
                                child: Text("Incidencia",style: TextStyle(fontSize: size.width * 0.045),)),
                          ],
                        ),
                      ),
                      Container(
                        width: size.width * 0.25,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(size.width * 0.02),
                            border: Border.all(width: 1.5)
                        ),
                        child:  TextField(
                          decoration: InputDecoration(
                            hintText: "Ninguna",
                            contentPadding: EdgeInsets.all(size.width * 0.04),
                            focusedBorder: InputBorder.none,
                            disabledBorder: InputBorder.none,
                            enabledBorder: InputBorder.none,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: size.height * 0.01,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        // width: size.width * 0.5,
                        padding: EdgeInsets.all(size.width * 0.02),
                        decoration: BoxDecoration(
                            color: Colors.grey.shade300,
                            borderRadius: BorderRadius.circular(size.width * 0.02)
                        ),
                        child: Row(
                          children: [
                            const Icon(Icons.camera_alt_outlined),
                            SizedBox(width: size.width * 0.02,),
                            Text("Foto de exhibición",style: TextStyle(fontSize: size.width * 0.04),)
                          ],
                        ),
                      ),
                      Container(
                        // width: size.width * 0.5,
                        padding: EdgeInsets.all(size.width * 0.02),
                        decoration: BoxDecoration(
                            color: Colors.grey.shade300,
                            borderRadius: BorderRadius.circular(size.width * 0.02)
                        ),
                        child: Row(
                          children: [
                            const Icon(Icons.camera_alt_outlined),
                            SizedBox(width: size.width * 0.02,),
                            Text("Lote y Caducidad",style: TextStyle(fontSize: size.width * 0.04),)
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: size.height * 0.01,),
                  Text("Registrar exhibición aidcional",style: TextStyle(fontSize: size.width * 0.04,color: Colors.blue),),
                ],
              ),
            ),

            const Divider(color: Colors.black,),
            Padding(
              padding: EdgeInsets.only(left: size.width * 0.05,right: size.width * 0.05),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    children: [
                      Container(
                        padding: EdgeInsets.all(size.width * 0.02),
                        decoration: BoxDecoration(
                            color: Colors.grey.shade300,
                            borderRadius: BorderRadius.circular(size.width * 0.02)
                        ),
                        child: const Icon(Icons.camera_alt_outlined,color: Colors.transparent,),
                      ),
                      SizedBox(width: size.width * 0.03,),
                      Text("Bites Camu Camu",style: TextStyle(fontSize: size.width * 0.04),),
                    ],
                  ),
                  const Icon(Icons.arrow_drop_down_circle_outlined)
                ],
              ),
            ),
            const Divider(color: Colors.black,),
            Padding(
              padding: EdgeInsets.only(left: size.width * 0.05,right: size.width * 0.05),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    children: [
                      Container(
                        padding: EdgeInsets.all(size.width * 0.02),
                        decoration: BoxDecoration(
                            color: Colors.grey.shade300,
                            borderRadius: BorderRadius.circular(size.width * 0.02)
                        ),
                        child: const Icon(Icons.camera_alt_outlined,color: Colors.transparent,),
                      ),
                      SizedBox(width: size.width * 0.03,),
                      Text("Palomitas chile limón",style: TextStyle(fontSize: size.width * 0.04),),
                    ],
                  ),
                  const Icon(Icons.arrow_drop_down_circle_outlined)
                ],
              ),
            ),
            const Divider(color: Colors.black,),
            Padding(
              padding: EdgeInsets.only(left: size.width * 0.05,right: size.width * 0.05),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    children: [
                      Container(
                        padding: EdgeInsets.all(size.width * 0.02),
                        decoration: BoxDecoration(
                            color: Colors.grey.shade300,
                            borderRadius: BorderRadius.circular(size.width * 0.02)
                        ),
                        child: const Icon(Icons.camera_alt_outlined,color: Colors.transparent,),
                      ),
                      SizedBox(width: size.width * 0.03,),
                      Text("Bites Colageno",style: TextStyle(fontSize: size.width * 0.04),),
                    ],
                  ),
                  const Icon(Icons.arrow_drop_down_circle_outlined)
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
