import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:maps_de/screens/store_name_part2.dart';
import 'package:maps_de/screens/truble_report.dart';

import '../models/visits.dart';

class StoreNamePart1 extends StatelessWidget {
  final Visit visit;

  StoreNamePart1({Key? key, required this.visit}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      bottomNavigationBar: Padding(
        padding: EdgeInsets.all(size.width * 0.05),
        child: GestureDetector(
          onTap: () {
            Get.to(() => StoreNamePart2(visit: visit));
          },
          child: Container(
            width: size.width,
            padding: EdgeInsets.all(size.width * 0.05),
            decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.circular(size.width * 0.02)),
            child: Text(
              "siguiente".toUpperCase(),
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: size.width * 0.04,
                  color: Colors.white,
                  fontWeight: FontWeight.w600),
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(
                  left: size.width * 0.08,
                  right: size.width * 0.08,
                  top: size.width * 0.08),
              child: Column(
                children: [
                  SizedBox(
                    height: size.height * 0.02,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        width: size.width * 0.07,
                      ),
                      Text(
                        visit.storeName!.toUpperCase(),
                        style: TextStyle(
                            fontSize: size.width * 0.05,
                            fontWeight: FontWeight.bold),
                      ),
                      GestureDetector(
                          onTap: () {
                            showModalBottomSheet(
                                context: context,
                                builder: (context) {
                                  return Wrap(
                                    children: [
                                      Container(
                                        color: Colors.white,
                                        child: Column(
                                          children: [
                                            SizedBox(
                                              height: size.height * 0.02,
                                            ),
                                            Text(
                                              "¿Algo no funciona?",
                                              style: TextStyle(
                                                  fontSize: size.width * 0.05,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            SizedBox(
                                              height: size.height * 0.01,
                                            ),
                                            Text(
                                              "Tus comentarios son importantes, envía tu reporte.",
                                              style: TextStyle(
                                                  fontSize: size.width * 0.04),
                                            ),
                                            const Divider(
                                              color: Colors.black,
                                            ),
                                            GestureDetector(
                                              onTap: () {
                                                Get.to(() =>
                                                    const TroubleReport());
                                              },
                                              child: Padding(
                                                padding: EdgeInsets.all(
                                                    size.width * 0.02),
                                                child: Row(
                                                  children: [
                                                    Image.asset(
                                                        "images/clipboardclose.png"),
                                                    SizedBox(
                                                      width: size.width * 0.02,
                                                    ),
                                                    Text("Reportar un problema",
                                                        style: TextStyle(
                                                            fontSize:
                                                                size.width *
                                                                    0.045,
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold)),
                                                  ],
                                                ),
                                              ),
                                            ),
                                            const Divider(
                                              color: Colors.black,
                                            ),
                                            GestureDetector(
                                              onTap: () {
                                                Get.to(() =>
                                                    const TroubleReport());
                                              },
                                              child: Padding(
                                                padding: EdgeInsets.all(
                                                    size.width * 0.02),
                                                child: Row(
                                                  children: [
                                                    Image.asset(
                                                        "images/Vector.png"),
                                                    SizedBox(
                                                      width: size.width * 0.02,
                                                    ),
                                                    Text(
                                                        "Producto descatalogado",
                                                        style: TextStyle(
                                                            fontSize:
                                                                size.width *
                                                                    0.045,
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold)),
                                                  ],
                                                ),
                                              ),
                                            ),
                                            const Divider(
                                              color: Colors.black,
                                            ),
                                            GestureDetector(
                                              onTap: () {
                                                Get.to(() =>
                                                    const TroubleReport());
                                              },
                                              child: Padding(
                                                padding: EdgeInsets.all(
                                                    size.width * 0.02),
                                                child: Row(
                                                  children: [
                                                    Image.asset(
                                                        "images/call.png"),
                                                    SizedBox(
                                                      width: size.width * 0.02,
                                                    ),
                                                    Text(
                                                        "Hablar con el administrador",
                                                        style: TextStyle(
                                                            fontSize:
                                                                size.width *
                                                                    0.045,
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold)),
                                                  ],
                                                ),
                                              ),
                                            ),
                                            const Divider(
                                              color: Colors.black,
                                            ),
                                            SizedBox(
                                              height: size.height * 0.01,
                                            ),
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
                  Text(
                    "ID Visita: #${visit.visitId}",
                    style: TextStyle(fontSize: size.width * 0.04),
                  ),
                  SizedBox(
                    height: size.height * 0.02,
                  ),
                  Text(
                    "PASO 1: ALMACÉN",
                    style: TextStyle(
                        fontSize: size.width * 0.05,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: size.height * 0.02,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        width: size.width * 0.27,
                        height: 5,
                        decoration: BoxDecoration(
                            color: const Color(0xff009A0F),
                            borderRadius:
                                BorderRadius.circular(size.width * 0.04)),
                      ),
                      Container(
                        width: size.width * 0.27,
                        height: 5,
                        decoration: BoxDecoration(
                            color: const Color(0xffD9D9D9),
                            borderRadius:
                                BorderRadius.circular(size.width * 0.04)),
                      ),
                      Container(
                        width: size.width * 0.27,
                        height: 5,
                        decoration: BoxDecoration(
                            color: const Color(0xffD9D9D9),
                            borderRadius:
                                BorderRadius.circular(size.width * 0.04)),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: size.height * 0.02,
                  ),
                ],
              ),
            ),
            const Divider(
              color: Colors.black,
            ),
            Padding(
              padding: EdgeInsets.all(size.width * 0.05),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "Productos",
                    style: TextStyle(
                        fontSize: size.width * 0.045,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "Fotografía\nen almacén",
                    style: TextStyle(
                        fontSize: size.width * 0.045,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "Inventario\nen sistema",
                    style: TextStyle(
                        fontSize: size.width * 0.045,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "Inventario\nen almacén",
                    style: TextStyle(
                        fontSize: size.width * 0.045,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            const Divider(
              color: Colors.black,
            ),
            ListView.separated(
                itemCount: visit.dataInStore!.length,
                shrinkWrap: true,
                padding: EdgeInsets.zero,
                separatorBuilder: (context, index) {
                  return const Divider(
                    color: Colors.black,
                  );
                },
                itemBuilder: (context, index) {
                  var item = visit.dataInStore!['items'][index];
                  return Padding(
                    padding: EdgeInsets.all(size.width * 0.05),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(
                            width: size.width * 0.23,
                            child: Text(
                              "${item['product_name']}",
                              style: TextStyle(fontSize: size.width * 0.045),
                            )),
                        Container(
                          padding: EdgeInsets.all(size.width * 0.02),
                          decoration: BoxDecoration(
                              color: Colors.grey.shade300,
                              borderRadius:
                                  BorderRadius.circular(size.width * 0.02)),
                          child: const Icon(Icons.camera_alt_outlined),
                        ),
                        Container(
                          width: size.width * 0.2,
                          padding: EdgeInsets.all(size.width * 0.03),
                          decoration: BoxDecoration(
                              color: Colors.grey.shade300,
                              borderRadius:
                                  BorderRadius.circular(size.width * 0.02)),
                          child: Text(
                            "${item['shelf_inventory_in_system']}",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: size.width * 0.045,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        Container(
                          width: size.width * 0.2,
                          decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.circular(size.width * 0.02),
                              border: Border.all(width: 1.5)),
                          child: TextField(
                            decoration: InputDecoration(
                              hintText: "",
                              contentPadding: EdgeInsets.all(size.width * 0.04),
                              focusedBorder: InputBorder.none,
                              disabledBorder: InputBorder.none,
                              enabledBorder: InputBorder.none,
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                }),
          ],
        ),
      ),
    );
  }
}
