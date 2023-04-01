import 'dart:async';

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:intl/intl.dart';
import 'package:maps_de/screens/start_route.dart';
import 'package:maps_de/screens/store_details.dart';

import '../controllers/home_map_controller.dart';
import '../controllers/visit_details_controller.dart';
import '../models/visits.dart';

class VisitDetails extends GetView<VisitDetailsController> {
  final String storeAddress;
  const VisitDetails({Key? key, required this.storeAddress}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        centerTitle: true,
        title: const Text(
          "DETALLES DE VISITA",
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: GetBuilder<VisitDetailsController>(
          init: VisitDetailsController(),
          builder: (context) {
            return SingleChildScrollView(
              child: Column(
                children: [
                  Obx(
                    () => SizedBox(
                      // color: Colors.grey,
                      height: size.height * 0.2,
                      child: GoogleMap(
                        initialCameraPosition:
                            controller.currentCameraPosition ??
                                controller.kGooglePlex,
                        myLocationButtonEnabled: false,
                        myLocationEnabled: true,
                        compassEnabled: false,
                        polylines: <Polyline>{controller.polyline},
                        markers: Set<Marker>.of(controller.markerList.values),
                        onMapCreated: (mapController) {
                          controller.mapCompleter.complete(mapController);
                          if (controller.mapCompleter.isCompleted) {
                            controller.googleMapController = mapController;
                            if (controller.googleMapController != null) {
                              Future.delayed(const Duration(seconds: 3), () {
                                controller.moveCameraToCurrentLocation();
                              });
                            }
                          }
                        },
                      ),
                    ),
                  ),
                  Container(
                    color: Colors.white,
                    height: 500,
                    child: Padding(
                      padding: EdgeInsets.all(size.width * 0.05),
                      child: StreamBuilder<QuerySnapshot>(
                          stream: FirebaseFirestore.instance
                              .collection('store_visits')
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
                                itemBuilder: (context, index) {
                                  DateTime dateTime =
                                      DateTime.fromMillisecondsSinceEpoch(
                                          visits[index].createdAt!.seconds *
                                              1000);

                                  String formattedDate =
                                      DateFormat('MMMM dd, yyyy')
                                          .format(dateTime);
                                  return Column(
                                    children: [
                                      SizedBox(
                                        height: size.height * 0.02,
                                      ),
                                      Text(
                                        "RUTA OPTIMA PROGRAMADA",
                                        style: TextStyle(
                                            fontSize: size.width * 0.05,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      SizedBox(
                                        height: size.height * 0.01,
                                      ),
                                      Text(
                                        formattedDate,
                                        style: TextStyle(
                                            fontSize: size.width * 0.04),
                                      ),
                                      SizedBox(
                                        height: size.height * 0.01,
                                      ),
                                      GestureDetector(
                                        onTap: () {
                                          AwesomeDialog(
                                            context: context,
                                            animType: AnimType.scale,
                                            dialogType: DialogType.noHeader,
                                            body: Column(
                                              children: [
                                                SizedBox(
                                                  height: size.height * 0.02,
                                                ),
                                                Padding(
                                                  padding: EdgeInsets.all(
                                                      size.width * 0.01),
                                                  child: Text(
                                                    "Verifica tu documentación",
                                                    style: TextStyle(
                                                        fontSize:
                                                            size.width * 0.05,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),
                                                ),
                                                // SizedBox(height: size.height * 0.02,),
                                                const Divider(
                                                  color: Colors.black,
                                                ),
                                                Padding(
                                                  padding: EdgeInsets.only(
                                                      left: size.width * 0.1,
                                                      right: size.width * 0.1),
                                                  child: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Text(
                                                        "Tienda 1",
                                                        style: TextStyle(
                                                            fontSize:
                                                                size.width *
                                                                    0.04,
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold),
                                                      ),
                                                      SizedBox(
                                                        height:
                                                            size.height * 0.01,
                                                      ),
                                                      Row(
                                                        children: [
                                                          const Icon(
                                                              Icons
                                                                  .check_box_outline_blank,
                                                              color:
                                                                  Colors.grey),
                                                          SizedBox(
                                                            width: size.width *
                                                                0.02,
                                                          ),
                                                          Text(
                                                            "Documento 1",
                                                            style: TextStyle(
                                                                fontSize:
                                                                    size.width *
                                                                        0.03),
                                                          ),
                                                        ],
                                                      ),
                                                      Row(
                                                        children: [
                                                          const Icon(
                                                              Icons
                                                                  .check_box_outline_blank,
                                                              color:
                                                                  Colors.grey),
                                                          SizedBox(
                                                            width: size.width *
                                                                0.02,
                                                          ),
                                                          Text(
                                                            "Documento 2",
                                                            style: TextStyle(
                                                                fontSize:
                                                                    size.width *
                                                                        0.03),
                                                          ),
                                                        ],
                                                      ),
                                                      Row(
                                                        children: [
                                                          const Icon(
                                                            Icons
                                                                .check_box_outline_blank,
                                                            color: Colors.grey,
                                                          ),
                                                          SizedBox(
                                                            width: size.width *
                                                                0.02,
                                                          ),
                                                          Text(
                                                            "Documento 3",
                                                            style: TextStyle(
                                                                fontSize:
                                                                    size.width *
                                                                        0.03),
                                                          ),
                                                        ],
                                                      )
                                                    ],
                                                  ),
                                                ),
                                                const Divider(
                                                  color: Colors.black,
                                                ),
                                                Padding(
                                                  padding: EdgeInsets.only(
                                                      left: size.width * 0.1,
                                                      right: size.width * 0.1),
                                                  child: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Text(
                                                        "Tienda 2",
                                                        style: TextStyle(
                                                            fontSize:
                                                                size.width *
                                                                    0.04,
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold),
                                                      ),
                                                      SizedBox(
                                                        height:
                                                            size.height * 0.01,
                                                      ),
                                                      Row(
                                                        children: [
                                                          const Icon(
                                                              Icons
                                                                  .check_box_outline_blank,
                                                              color:
                                                                  Colors.grey),
                                                          SizedBox(
                                                            width: size.width *
                                                                0.02,
                                                          ),
                                                          Text(
                                                            "Documento 1",
                                                            style: TextStyle(
                                                                fontSize:
                                                                    size.width *
                                                                        0.03),
                                                          ),
                                                        ],
                                                      ),
                                                      Row(
                                                        children: [
                                                          const Icon(
                                                              Icons
                                                                  .check_box_outline_blank,
                                                              color:
                                                                  Colors.grey),
                                                          SizedBox(
                                                            width: size.width *
                                                                0.02,
                                                          ),
                                                          Text(
                                                            "Documento 2",
                                                            style: TextStyle(
                                                                fontSize:
                                                                    size.width *
                                                                        0.03),
                                                          ),
                                                        ],
                                                      ),
                                                      Row(
                                                        children: [
                                                          const Icon(
                                                            Icons
                                                                .check_box_outline_blank,
                                                            color: Colors.grey,
                                                          ),
                                                          SizedBox(
                                                            width: size.width *
                                                                0.02,
                                                          ),
                                                          Text(
                                                            "Documento 3",
                                                            style: TextStyle(
                                                                fontSize:
                                                                    size.width *
                                                                        0.03),
                                                          ),
                                                        ],
                                                      )
                                                    ],
                                                  ),
                                                ),
                                                const Divider(
                                                  color: Colors.black,
                                                ),
                                                Padding(
                                                  padding: EdgeInsets.only(
                                                      left: size.width * 0.1,
                                                      right: size.width * 0.1),
                                                  child: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Text(
                                                        "Tienda 3",
                                                        style: TextStyle(
                                                            fontSize:
                                                                size.width *
                                                                    0.04,
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold),
                                                      ),
                                                      SizedBox(
                                                        height:
                                                            size.height * 0.01,
                                                      ),
                                                      Row(
                                                        children: [
                                                          const Icon(
                                                              Icons
                                                                  .check_box_outline_blank,
                                                              color:
                                                                  Colors.grey),
                                                          SizedBox(
                                                            width: size.width *
                                                                0.02,
                                                          ),
                                                          Text(
                                                            "Documento 1",
                                                            style: TextStyle(
                                                                fontSize:
                                                                    size.width *
                                                                        0.03),
                                                          ),
                                                        ],
                                                      ),
                                                      Row(
                                                        children: [
                                                          const Icon(
                                                              Icons
                                                                  .check_box_outline_blank,
                                                              color:
                                                                  Colors.grey),
                                                          SizedBox(
                                                            width: size.width *
                                                                0.02,
                                                          ),
                                                          Text(
                                                            "Documento 2",
                                                            style: TextStyle(
                                                                fontSize:
                                                                    size.width *
                                                                        0.03),
                                                          ),
                                                        ],
                                                      ),
                                                      Row(
                                                        children: [
                                                          const Icon(
                                                            Icons
                                                                .check_box_outline_blank,
                                                            color: Colors.grey,
                                                          ),
                                                          SizedBox(
                                                            width: size.width *
                                                                0.02,
                                                          ),
                                                          Text(
                                                            "Documento 3",
                                                            style: TextStyle(
                                                                fontSize:
                                                                    size.width *
                                                                        0.03),
                                                          ),
                                                        ],
                                                      )
                                                    ],
                                                  ),
                                                ),
                                                const Divider(
                                                  color: Colors.black,
                                                ),
                                                Padding(
                                                  padding: EdgeInsets.only(
                                                      left: size.width * 0.1,
                                                      right: size.width * 0.1),
                                                  child: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Text(
                                                        "Tienda 4",
                                                        style: TextStyle(
                                                            fontSize:
                                                                size.width *
                                                                    0.04,
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold),
                                                      ),
                                                      SizedBox(
                                                        height:
                                                            size.height * 0.01,
                                                      ),
                                                      Row(
                                                        children: [
                                                          const Icon(
                                                              Icons
                                                                  .check_box_outline_blank,
                                                              color:
                                                                  Colors.grey),
                                                          SizedBox(
                                                            width: size.width *
                                                                0.02,
                                                          ),
                                                          Text(
                                                            "Documento 1",
                                                            style: TextStyle(
                                                                fontSize:
                                                                    size.width *
                                                                        0.03),
                                                          ),
                                                        ],
                                                      ),
                                                      Row(
                                                        children: [
                                                          const Icon(
                                                              Icons
                                                                  .check_box_outline_blank,
                                                              color:
                                                                  Colors.grey),
                                                          SizedBox(
                                                            width: size.width *
                                                                0.02,
                                                          ),
                                                          Text(
                                                            "Documento 2",
                                                            style: TextStyle(
                                                                fontSize:
                                                                    size.width *
                                                                        0.03),
                                                          ),
                                                        ],
                                                      ),
                                                      Row(
                                                        children: [
                                                          const Icon(
                                                            Icons
                                                                .check_box_outline_blank,
                                                            color: Colors.grey,
                                                          ),
                                                          SizedBox(
                                                            width: size.width *
                                                                0.02,
                                                          ),
                                                          Text(
                                                            "Documento 3",
                                                            style: TextStyle(
                                                                fontSize:
                                                                    size.width *
                                                                        0.03),
                                                          ),
                                                        ],
                                                      )
                                                    ],
                                                  ),
                                                ),
                                                const Divider(
                                                  color: Colors.black,
                                                ),
                                                SizedBox(
                                                  height: size.height * 0.02,
                                                ),
                                                GestureDetector(
                                                  onTap: () {
                                                    Get.to(() =>
                                                        const StartRoute());
                                                  },
                                                  child: Container(
                                                    width: size.width * 0.7,
                                                    padding: EdgeInsets.all(
                                                        size.width * 0.04),
                                                    decoration: BoxDecoration(
                                                        color: Colors.black,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(
                                                                    size.width *
                                                                        0.02)),
                                                    child: Text(
                                                      "CONFIRMAR "
                                                          .toUpperCase(),
                                                      textAlign:
                                                          TextAlign.center,
                                                      style: TextStyle(
                                                          fontSize:
                                                              size.width * 0.04,
                                                          color: Colors.white,
                                                          fontWeight:
                                                              FontWeight.w600),
                                                    ),
                                                  ),
                                                ),
                                                SizedBox(
                                                  height: size.height * 0.02,
                                                ),
                                              ],
                                            ),
                                          ).show();
                                        },
                                        child: Container(
                                          width: size.width,
                                          padding:
                                              EdgeInsets.all(size.width * 0.04),
                                          decoration: BoxDecoration(
                                              color: Colors.black,
                                              borderRadius:
                                                  BorderRadius.circular(
                                                      size.width * 0.02)),
                                          child: Text(
                                            "ver ruta optima".toUpperCase(),
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                                fontSize: size.width * 0.04,
                                                color: Colors.white,
                                                fontWeight: FontWeight.w600),
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        height: size.height * 0.01,
                                      ),
                                      const Divider(
                                        color: Colors.black,
                                      ),
                                      GestureDetector(
                                        onTap: () {
                                          Get.to(() => StoreDetails(
                                                storeId:
                                                    visits[index].storeId ?? "",
                                                storeAddress: storeAddress,
                                              ));
                                        },
                                        child: ListView.builder(
                                            itemCount: visits.length,
                                            shrinkWrap: true,
                                            itemBuilder: (context, index) {
                                              return Column(
                                                children: [
                                                  Padding(
                                                    padding: EdgeInsets.all(
                                                        size.width * 0.03),
                                                    child: Column(
                                                      children: [
                                                        Row(
                                                          children: [
                                                            Text(
                                                              "${visits[index].storeName}",
                                                              style: TextStyle(
                                                                  fontSize:
                                                                      size.width *
                                                                          0.04,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold),
                                                            ),
                                                          ],
                                                        ),
                                                        Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                  .all(8.0),
                                                          child: Row(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .spaceBetween,
                                                            children: [
                                                              Row(
                                                                children: [
                                                                  Column(
                                                                    crossAxisAlignment:
                                                                        CrossAxisAlignment
                                                                            .start,
                                                                    children: [
                                                                      Text(
                                                                        "${storeAddress ?? ""}",
                                                                        style: TextStyle(
                                                                            fontSize:
                                                                                size.width * 0.04),
                                                                      ),
                                                                      Text(
                                                                        "${visits[index].dataInStore!.length} productos",
                                                                        style: TextStyle(
                                                                            fontSize:
                                                                                size.width * 0.04),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ],
                                                              ),
                                                              const Icon(Icons
                                                                  .navigate_next)
                                                            ],
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  const Divider(
                                                    color: Colors.black,
                                                  ),
                                                ],
                                              );
                                            }),
                                      )
                                    ],
                                  );
                                });
                          }),
                    ),
                  ),
                ],
              ),
            );
          }),
    );
  }
}
