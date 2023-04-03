import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:maps_de/screens/store_name_part4.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import '../models/visits.dart';
import 'package:get/get.dart';

import 'truble_report.dart';

class StoreNamePart3 extends StatefulWidget {
  final Visit? visit;
  StoreNamePart3({Key? key, this.visit}) : super(key: key);

  @override
  State<StoreNamePart3> createState() => _StoreNamePart3State();
}

class _StoreNamePart3State extends State<StoreNamePart3> {
  bool _switchValue = true;

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
            Get.to(() => StoreNamePart4(visit: widget.visit!));
          },
          child: Container(
            width: size.width,
            padding: EdgeInsets.all(size.width * 0.04),
            decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.circular(size.width * 0.02)),
            child: Text(
              "finalizar".toUpperCase(),
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
                      GestureDetector(
                          onTap: () {
                            Get.back();
                          },
                          child: const Icon(Icons.arrow_back)),
                      Text(
                        "NOMBRE DE TIENDA ",
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
                    "ID Visita: 2089597",
                    style: TextStyle(fontSize: size.width * 0.04),
                  ),
                  SizedBox(
                    height: size.height * 0.02,
                  ),
                  Text(
                    "PASO 3: CALIFICACIÓN",
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
                            color: const Color(0xff009A0F),
                            borderRadius:
                                BorderRadius.circular(size.width * 0.04)),
                      ),
                      Container(
                        width: size.width * 0.27,
                        height: 5,
                        decoration: BoxDecoration(
                            color: const Color(0xff009A0F),
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
            Padding(
              padding: EdgeInsets.all(size.width * 0.04),
              child: Text(
                "Tu opinión es muy importante.\nResponde lo más honesto posible.",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: size.width * 0.04),
              ),
            ),
            const Divider(
              color: Color(0xffCFCFCF),
            ),
            SizedBox(
              height: size.height * 0.02,
            ),
            Text(
              "Disponibilidad",
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: size.width * 0.04, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: size.height * 0.01,
            ),
            RatingBar.builder(
              initialRating: 3,
              minRating: 1,
              direction: Axis.horizontal,
              allowHalfRating: true,
              itemCount: 5,
              itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
              itemBuilder: (context, _) => const Icon(
                Icons.star_border,
                color: Colors.amber,
              ),
              onRatingUpdate: (rating) {
                print(rating);
              },
            ),
            SizedBox(
              height: size.height * 0.04,
            ),
            Text(
              "Amabilidad",
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: size.width * 0.04, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: size.height * 0.01,
            ),
            RatingBar.builder(
              initialRating: 5,
              minRating: 1,
              direction: Axis.horizontal,
              allowHalfRating: true,
              itemCount: 5,
              itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
              itemBuilder: (context, _) => const Icon(
                Icons.star_border,
                color: Colors.amber,
              ),
              onRatingUpdate: (rating) {
                print(rating);
              },
            ),
            SizedBox(
              height: size.height * 0.04,
            ),
            Text(
              "Limpieza",
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: size.width * 0.04, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: size.height * 0.01,
            ),
            RatingBar.builder(
              initialRating: 1,
              minRating: 1,
              direction: Axis.horizontal,
              allowHalfRating: true,
              itemCount: 5,
              itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
              itemBuilder: (context, _) => const Icon(
                Icons.star_border,
                color: Colors.amber,
              ),
              onRatingUpdate: (rating) {
                print(rating);
              },
            ),
            SizedBox(
              height: size.height * 0.04,
            ),
            Text(
              "Normas de seguridad",
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: size.width * 0.04, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: size.height * 0.01,
            ),
            RatingBar.builder(
              initialRating: 4,
              minRating: 1,
              direction: Axis.horizontal,
              allowHalfRating: true,
              itemCount: 5,
              itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
              itemBuilder: (context, _) => const Icon(
                Icons.star_border,
                color: Colors.amber,
              ),
              onRatingUpdate: (rating) {
                print(rating);
              },
            ),
            SizedBox(
              height: size.height * 0.02,
            ),
            const Divider(
              color: Color(0xffCFCFCF),
            ),
            Padding(
              padding: EdgeInsets.all(size.width * 0.05),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Gerente presente",
                    style: TextStyle(fontSize: size.width * 0.035),
                  ),
                  CupertinoSwitch(
                    activeColor: Colors.grey,
                    thumbColor: Colors.black,
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
            const Divider(
              color: Color(0xffCFCFCF),
            ),
            SizedBox(
              height: size.height * 0.05,
            ),
          ],
        ),
      ),
    );
  }
}
