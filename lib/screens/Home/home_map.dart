import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:maps_de/controllers/home_map_controller.dart';
import '../../models/visits.dart';
import '../store_name_part1.dart';
import 'home_calender.dart';
import 'home_chat.dart';
import 'home_profile.dart';

class HomeMap extends GetView<HomeMapController> {
  const HomeMap({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return GetBuilder<HomeMapController>(
        init: HomeMapController(),
        builder: (context) {
          return Scaffold(
            bottomNavigationBar: Container(
              height: size.height * 0.08,
              decoration: const BoxDecoration(color: Colors.white, boxShadow: [
                BoxShadow(
                    color: Colors.grey,
                    blurRadius: 2,
                    spreadRadius: 2,
                    offset: Offset(2, 2))
              ]),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  GestureDetector(
                      onTap: () {
                        Get.off(() => const HomeProfile());
                      },
                      child: SvgPicture.asset("images/profilecircle.svg")),
                  GestureDetector(
                      onTap: () {
                        Get.off(() => HomeCalender());
                      },
                      child: SvgPicture.asset("images/calendar.svg")),
                  SvgPicture.asset(
                    "images/documenttext.svg",
                    color: Colors.blue,
                  ),
                  GestureDetector(
                      onTap: () {
                        Get.off(() => const HomeChat());
                      },
                      child: SvgPicture.asset("images/messages3.svg")),
                ],
              ),
            ),
            appBar: AppBar(
              backgroundColor: Colors.transparent,
              elevation: 0.0,
              centerTitle: true,
              title: const Text(
                "TU ACTIVIDAD",
                style: TextStyle(color: Colors.black),
              ),
              actions: <Widget>[
                IconButton(
                  icon: const Icon(Icons.filter_alt, color: Colors.black),
                  onPressed: () {
                    showModalBottomSheet(
                      context: Get.context!,
                      builder: (BuildContext context) {
                        return Wrap(
                          children: [
                            Container(
                              height: size.height * 0.2,
                              color: Colors.white,
                              child: Column(
                                children: [
                                  SizedBox(
                                    height: size.height * 0.02,
                                  ),
                                  Text(
                                    "Filtrar por",
                                    style:
                                        TextStyle(fontSize: size.width * 0.05),
                                  ),
                                  const Divider(
                                    color: Colors.black,
                                  ),
                                  SizedBox(
                                    height: size.height * 0.02,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      Container(
                                        padding:
                                            EdgeInsets.all(size.width * 0.02),
                                        decoration: BoxDecoration(
                                            color: const Color(0xffD9D9D9),
                                            borderRadius: BorderRadius.circular(
                                                size.width * 0.01)),
                                        child: const Text("Todo"),
                                      ),
                                      const Text("Regiones"),
                                      const Text("Productos"),
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ],
                        );
                      },
                    );
                  },
                )
              ],
            ),
            body: SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    color: Colors.grey,
                    height: size.height * 0.27,
                    child: Obx(
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
                          polylines:
                              Set<Polyline>.of(controller.polylines.values),
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
                  ),
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
                    "17 de Enero del 2023",
                    style: TextStyle(fontSize: size.width * 0.04),
                  ),
                  SizedBox(
                    height: size.height * 0.01,
                  ),
                  Text(
                    "48 min - 30 km",
                    style: TextStyle(fontSize: size.width * 0.04),
                  ),
                  SizedBox(
                    height: size.height * 0.01,
                  ),
                  Container(
                    width: size.width * 0.9,
                    padding: EdgeInsets.all(size.width * 0.04),
                    decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(size.width * 0.02)),
                    child: Text(
                      "COMENZAR RUTA".toUpperCase(),
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: size.width * 0.04,
                          color: Colors.white,
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                  const Divider(
                    color: Colors.black,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: StreamBuilder<QuerySnapshot>(
                        stream: FirebaseFirestore.instance
                            .collection('routes')
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
                              physics: const NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              itemBuilder: (context, index) {
                                return Column(
                                  children: [
                                    SizedBox(
                                      height: size.height * 0.01,
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        Get.to(
                                          () => StoreNamePart1(
                                            visit: visits[index],
                                          ),
                                        );
                                      },
                                      child: Column(
                                        children: [
                                          Padding(
                                            padding: EdgeInsets.all(
                                                size.width * 0.03),
                                            child: Column(
                                              children: [
                                                Row(
                                                  children: [
                                                    Text(
                                                      "ID VISITA #${visits[index].visitId}",
                                                      style: TextStyle(
                                                          fontSize:
                                                              size.width * 0.04,
                                                          fontWeight:
                                                              FontWeight.bold),
                                                    ),
                                                  ],
                                                ),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.all(8.0),
                                                  child: IntrinsicHeight(
                                                    child: Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        Row(
                                                          children: [
                                                            const VerticalDivider(
                                                              color:
                                                                  Colors.black,
                                                              thickness: 2,
                                                            ),
                                                            Column(
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .start,
                                                              children: [
                                                                Text(
                                                                  "${visits[index].storeName}",
                                                                  style: TextStyle(
                                                                      fontSize:
                                                                          size.width *
                                                                              0.04),
                                                                ),
                                                                Text(
                                                                  "Navarrete #156 Col. Linda Vista",
                                                                  style: TextStyle(
                                                                      fontSize:
                                                                          size.width *
                                                                              0.04),
                                                                ),
                                                              ],
                                                            ),
                                                          ],
                                                        ),
                                                        const Icon(
                                                            Icons.navigate_next)
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          const Divider(
                                            color: Colors.black,
                                          ),
                                        ],
                                      ),
                                    )
                                  ],
                                );
                              });
                        }),
                  ),
                ],
              ),
            ),
          );
        });
  }
}
