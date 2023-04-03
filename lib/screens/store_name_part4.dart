import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:maps_de/models/visits.dart';
import 'package:maps_de/screens/store_name_final.dart';

class StoreNamePart4 extends StatelessWidget {
  final Visit visit;
  const StoreNamePart4({Key? key, required this.visit}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      bottomNavigationBar: Padding(
        padding: EdgeInsets.only(
            left: size.width * 0.08,
            right: size.width * 0.08,
            top: size.width * 0.01,
            bottom: size.width * 0.03),
        child: GestureDetector(
          onTap: () {
            Get.to(() => StoreNameFinal(
                  visit: visit,
                ));
          },
          child: Container(
            width: size.width,
            padding: EdgeInsets.all(size.width * 0.04),
            decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.circular(size.width * 0.02)),
            child: Text(
              "guardar".toUpperCase(),
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: size.width * 0.04,
                  color: Colors.white,
                  fontWeight: FontWeight.w600),
            ),
          ),
        ),
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
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
                        GestureDetector(
                            onTap: () {
                              Get.back();
                            },
                            child: const Icon(Icons.arrow_back)),
                        Text(
                          "${visit.storeName} ",
                          style: TextStyle(
                              fontSize: size.width * 0.05,
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          width: size.width * 0.07,
                        ),
                      ],
                    ),
                    Text(
                      "ID Visita: ${visit.visitId}",
                      style: TextStyle(fontSize: size.width * 0.04),
                    ),
                    SizedBox(
                      height: size.height * 0.02,
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: size.height * 0.02,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    padding: EdgeInsets.all(size.width * 0.03),
                    decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(size.width * 0.05)),
                    child: Text(
                      "Inventario",
                      style: TextStyle(
                          fontSize: size.width * 0.045, color: Colors.white),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(size.width * 0.03),
                    decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                              blurRadius: 2,
                              spreadRadius: 1,
                              color: Colors.grey.shade300)
                        ],
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(size.width * 0.05)),
                    child: Text(
                      "Desabasto",
                      style: TextStyle(
                          fontSize: size.width * 0.045, color: Colors.black),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(size.width * 0.03),
                    decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                              blurRadius: 2,
                              spreadRadius: 1,
                              color: Colors.grey.shade300)
                        ],
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(size.width * 0.05)),
                    child: Text(
                      "Sobreinventario",
                      style: TextStyle(
                          fontSize: size.width * 0.045, color: Colors.black),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: size.height * 0.02,
              ),
              Table(
                columnWidths: const {
                  1: FlexColumnWidth(1.5),
                },
                border: TableBorder.all(
                  color: Colors.grey,
                ),
                children: [
                  TableRow(children: [
                    Text(
                      "SKU",
                      style: TextStyle(
                          fontSize: size.width * 0.045,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      "Producto",
                      style: TextStyle(
                          fontSize: size.width * 0.045,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      "Inventario Sistema",
                      style: TextStyle(
                          fontSize: size.width * 0.045,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      "Inventario Almacén",
                      style: TextStyle(
                          fontSize: size.width * 0.045,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      "Inventario Anaquel",
                      style: TextStyle(
                          fontSize: size.width * 0.045,
                          fontWeight: FontWeight.bold),
                    ),
                  ]),
                  for (int i = 0; i < visit.dataInStore!.length; i++)
                    TableRow(children: [
                      Text(
                        "${visit.dataInStore!['items'][i]['item_id']}",
                        style: TextStyle(fontSize: size.width * 0.045),
                      ),
                      Text(
                        "${visit.dataInStore!['items'][i]['product_name']}",
                        style: TextStyle(fontSize: size.width * 0.045),
                      ),
                      Text(
                        "${visit.dataInStore!['items'][i]['shelf_inventory']}",
                        style: TextStyle(fontSize: size.width * 0.045),
                      ),
                      Text(
                        "${visit.dataInStore!['items'][i]['shelf_inventory_in_system']}",
                        style: TextStyle(fontSize: size.width * 0.045),
                      ),
                      Text(
                        "${visit.dataInStore!['items'][i]['shelf_inventory_in_system']}",
                        style: TextStyle(fontSize: size.width * 0.045),
                      ),
                    ]),
                ],
              ),
              SizedBox(
                height: size.height * 0.02,
              ),
              Text("Promotor:",
                  style: TextStyle(
                      fontSize: size.width * 0.045, color: Colors.black)),
              Text("${visit.promoterId}:",
                  style: TextStyle(
                      fontSize: size.width * 0.045,
                      fontWeight: FontWeight.bold)),
              SizedBox(
                height: size.height * 0.02,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(
                    children: [
                      Text("Nombre del encargado::",
                          style: TextStyle(
                              fontSize: size.width * 0.045,
                              color: Colors.black)),
                      Container(
                        width: size.width * 0.4,
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
                  Column(
                    children: [
                      Text("Puesto:",
                          style: TextStyle(
                              fontSize: size.width * 0.045,
                              color: Colors.black)),
                      Container(
                        width: size.width * 0.4,
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
                ],
              ),
              SizedBox(
                height: size.height * 0.01,
              ),
              const Divider(
                color: Colors.black,
              ),
              Text("Firma del encargado:",
                  style: TextStyle(
                      fontSize: size.width * 0.045, color: Colors.black)),
              Container(
                width: size.width,
                height: size.height * 0.3,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(size.width * 0.02),
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
        ),
      ),
    );
  }
}
