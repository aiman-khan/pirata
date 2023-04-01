import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../models/visits.dart';

class ProductDetails extends StatefulWidget {
  final String itemId;
  final String storeId;

  const ProductDetails({Key? key, required this.itemId, required this.storeId})
      : super(key: key);

  @override
  State createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(
                  left: size.width * 0.08,
                  right: size.width * 0.08,
                  top: size.width * 0.1),
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
                        "PRODUCTO",
                        style: TextStyle(
                            fontSize: size.width * 0.05,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        width: size.width * 0.04,
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(
              height: size.height * 0.02,
            ),
            const Divider(
              color: Colors.black,
            ),
            SizedBox(
              height: size.height * 0.02,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                    height: size.width * 0.2,
                    width: size.width * 0.2,
                    color: const Color(0xffBDBDBD)),
                Container(
                    height: size.width * 0.2,
                    width: size.width * 0.2,
                    color: const Color(0xffBDBDBD)),
                Container(
                    height: size.width * 0.2,
                    width: size.width * 0.2,
                    color: const Color(0xffBDBDBD)),
              ],
            ),
            SizedBox(
              height: size.height * 0.02,
            ),
            const Divider(
              color: Colors.black,
            ),
            StreamBuilder<QuerySnapshot>(
                stream: FirebaseFirestore.instance
                    .collection('store_visits')
                    .where("store_id", isEqualTo: widget.storeId)
                    .snapshots(),
                builder: (BuildContext context,
                    AsyncSnapshot<QuerySnapshot> snapshot) {
                  if (snapshot.hasError) {
                    return Text('Error: ${snapshot.error}');
                  }
                  if (!snapshot.hasData) {
                    return const Center(
                        child: CircularProgressIndicator(
                      color: Colors.black,
                    ));
                  }
                  List<Visit> visits = snapshot.data!.docs
                      .map((doc) => Visit.fromFirestoreMap(doc))
                      .toList();

                  return ListView.builder(
                      itemCount: visits.length,
                      itemBuilder: (context, i) {
                        final data = visits[i].dataInStore!;
                        String key = data.keys.toList()[i];
                        dynamic value = data.values.toList()[i];
                        return Padding(
                          padding: EdgeInsets.all(size.width * 0.05),
                          child: Column(
                            children: [
                              Container(
                                width: size.width,
                                padding: EdgeInsets.all(size.width * 0.02),
                                decoration: BoxDecoration(
                                    color: Colors.grey.shade200,
                                    borderRadius: BorderRadius.circular(
                                        size.width * 0.01)),
                                child: Text(
                                  "Nombre del producto",
                                  style: TextStyle(fontSize: size.width * 0.04),
                                ),
                              ),
                              SizedBox(
                                height: size.height * 0.02,
                              ),
                              Container(
                                width: size.width,
                                padding: EdgeInsets.all(size.width * 0.02),
                                decoration: BoxDecoration(
                                    color: Colors.grey.shade200,
                                    borderRadius: BorderRadius.circular(
                                        size.width * 0.01)),
                                child: Text(
                                  "SKU",
                                  style: TextStyle(fontSize: size.width * 0.04),
                                ),
                              ),
                              SizedBox(
                                height: size.height * 0.02,
                              ),
                              Container(
                                width: size.width,
                                padding: EdgeInsets.all(size.width * 0.02),
                                decoration: BoxDecoration(
                                    color: Colors.grey.shade200,
                                    borderRadius: BorderRadius.circular(
                                        size.width * 0.01)),
                                child: Text(
                                  "Presentación",
                                  style: TextStyle(fontSize: size.width * 0.04),
                                ),
                              ),
                              SizedBox(
                                height: size.height * 0.02,
                              ),
                              Container(
                                width: size.width,
                                padding: EdgeInsets.all(size.width * 0.02),
                                decoration: BoxDecoration(
                                    color: Colors.grey.shade200,
                                    borderRadius: BorderRadius.circular(
                                        size.width * 0.01)),
                                child: Text(
                                  "Precio",
                                  style: TextStyle(fontSize: size.width * 0.04),
                                ),
                              ),
                            ],
                          ),
                        );
                      });
                }),
            const Divider(
              color: Colors.black,
            ),
            Padding(
              padding: EdgeInsets.all(size.width * 0.05),
              child: Row(
                children: [
                  Text(
                    "Medidas",
                    style: TextStyle(fontSize: size.width * 0.05),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                  left: size.width * 0.05,
                  right: size.width * 0.05,
                  bottom: size.width * 0.05),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    width: size.width * 0.25,
                    padding: EdgeInsets.all(size.width * 0.04),
                    decoration: BoxDecoration(
                        color: Colors.grey.shade200,
                        borderRadius: BorderRadius.circular(size.width * 0.01)),
                    child: Text(
                      "Largo",
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: size.width * 0.04),
                    ),
                  ),
                  Text("X"),
                  Container(
                    width: size.width * 0.25,
                    padding: EdgeInsets.all(size.width * 0.04),
                    decoration: BoxDecoration(
                        color: Colors.grey.shade200,
                        borderRadius: BorderRadius.circular(size.width * 0.01)),
                    child: Text(
                      "Alto",
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: size.width * 0.04),
                    ),
                  ),
                  Text("X"),
                  Container(
                    width: size.width * 0.25,
                    padding: EdgeInsets.all(size.width * 0.04),
                    decoration: BoxDecoration(
                        color: Colors.grey.shade200,
                        borderRadius: BorderRadius.circular(size.width * 0.01)),
                    child: Text(
                      "Ancho",
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: size.width * 0.04),
                    ),
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
                children: [
                  Text(
                    "Lugar de exhibición:",
                    style: TextStyle(fontSize: size.width * 0.05),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                  left: size.width * 0.05,
                  right: size.width * 0.05,
                  bottom: size.width * 0.05),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    width: size.width,
                    padding: EdgeInsets.all(size.width * 0.02),
                    decoration: BoxDecoration(
                        color: Colors.grey.shade200,
                        borderRadius: BorderRadius.circular(size.width * 0.01)),
                    child: Text(
                      "Área de orgánicos",
                      style: TextStyle(fontSize: size.width * 0.04),
                    ),
                  ),
                  SizedBox(
                    height: size.height * 0.02,
                  ),
                  Container(
                    width: size.width,
                    padding: EdgeInsets.all(size.width * 0.02),
                    decoration: BoxDecoration(
                        color: Colors.grey.shade200,
                        borderRadius: BorderRadius.circular(size.width * 0.01)),
                    child: Text(
                      "Área de botanas",
                      style: TextStyle(fontSize: size.width * 0.04),
                    ),
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
                children: [
                  Text(
                    "Sobreinventario cuando sea igual o mayor a:",
                    style: TextStyle(fontSize: size.width * 0.05),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                  left: size.width * 0.05,
                  right: size.width * 0.05,
                  bottom: size.width * 0.05),
              child: Container(
                width: size.width,
                padding: EdgeInsets.all(size.width * 0.02),
                decoration: BoxDecoration(
                    color: Colors.grey.shade200,
                    borderRadius: BorderRadius.circular(size.width * 0.01)),
                child: Text(
                  "40 Piezas",
                  style: TextStyle(fontSize: size.width * 0.04),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(size.width * 0.05),
              child: Row(
                children: [
                  Text(
                    "Desabasto cuando sea igual o menor a:",
                    style: TextStyle(fontSize: size.width * 0.05),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                  left: size.width * 0.05,
                  right: size.width * 0.05,
                  bottom: size.width * 0.05),
              child: Container(
                width: size.width,
                padding: EdgeInsets.all(size.width * 0.02),
                decoration: BoxDecoration(
                    color: Colors.grey.shade200,
                    borderRadius: BorderRadius.circular(size.width * 0.01)),
                child: Text(
                  "5 Piezas",
                  style: TextStyle(fontSize: size.width * 0.04),
                ),
              ),
            ),
            const Divider(
              color: Colors.black,
            ),
          ],
        ),
      ),
    );
  }
}
