import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:maps_de/models/store.dart';
import 'package:maps_de/screens/Home/home_profile.dart';
import 'package:maps_de/services/firebase_services.dart';
import 'package:maps_de/utils/globals.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:get/get.dart';
// import 'main_home.dart';
import '../store_details.dart';
import '../visit_details.dart';
import 'home_chat.dart';
import 'home_map.dart';

class HomeCalender extends StatefulWidget {
  const HomeCalender({Key? key}) : super(key: key);

  @override
  State createState() => _HomeCalenderState();
}

class _HomeCalenderState extends State<HomeCalender> {
  // static final _myTabbedPageKey = new GlobalKey<_MainHomeState>();
  FirebaseServices firebaseServices = FirebaseServices();
  final CollectionReference storesRef =
      FirebaseFirestore.instance.collection('stores');
  final CollectionReference storesToVisitRef =
      FirebaseFirestore.instance.collection('store_visits');

  DocumentSnapshot? visits;

  String userId = "";

  @override
  void initState() {
    super.initState();
    getUserId();
    firebaseServices.getVisits(Globals().userId).then((result) {
      setState(() {
        visits = result;
      });
    });
  }

  void getUserId() {
    userId = FirebaseAuth.instance.currentUser!.uid;
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
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
            SvgPicture.asset(
              "images/calendar.svg",
              color: Colors.blue,
            ),
            GestureDetector(
                onTap: () {
                  Get.off(() => const HomeMap());
                },
                child: SvgPicture.asset("images/documenttext.svg")),
            GestureDetector(
                onTap: () {
                  Get.off(() => const HomeChat());
                },
                child: SvgPicture.asset("images/messages3.svg")),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: StreamBuilder<QuerySnapshot>(
            stream: FirebaseFirestore.instance
                .collection("routes")
                .where("promoter_id",
                    isEqualTo: FirebaseAuth.instance.currentUser!.uid)
                .snapshots(),
            builder: (context, snapshot) {
              if (!snapshot.hasData) {
                return const Center(
                    child: CircularProgressIndicator(
                  color: Colors.black,
                ));
              }

              QueryDocumentSnapshot document = snapshot.data!.docs.first;

              // final store =
              //     "${(document.data() as dynamic)['stores_to_visit']}";

              List<dynamic> storesToVisit =
                  (document.data() as dynamic)["stores_to_visit"];

              return Padding(
                padding: EdgeInsets.all(size.width * 0.05),
                child: Column(
                  children: [
                    SizedBox(
                      height: size.height * 0.05,
                    ),
                    Text(
                      "TUS VISITAS",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: size.width * 0.06,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: size.height * 0.02,
                    ),
                    Container(
                      decoration: BoxDecoration(
                          borderRadius:
                              BorderRadius.circular(size.width * 0.02),
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                              blurRadius: 2,
                              spreadRadius: 3,
                              offset: const Offset(2, 3),
                              color: Colors.grey.shade300,
                            )
                          ]),
                      child: TableCalendar(
                        firstDay: DateTime.utc(2010, 10, 16),
                        lastDay: DateTime.utc(2030, 3, 14),
                        focusedDay: DateTime.now(),
                      ),
                    ),
                    SizedBox(
                      height: size.height * 0.03,
                    ),
                    Container(
                        width: size.width,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.grey.shade300,
                                  blurRadius: 1,
                                  spreadRadius: 2,
                                  offset: const Offset(1, 2))
                            ],
                            borderRadius:
                                BorderRadius.circular(size.width * 0.02)),
                        padding: EdgeInsets.all(size.width * 0.04),
                        child: StreamBuilder<QuerySnapshot>(
                            stream: storesRef.snapshots(),
                            builder: (BuildContext context,
                                AsyncSnapshot<QuerySnapshot> snapshot) {
                              if (snapshot.hasError) {
                                return Text('Error: ${snapshot.error}');
                              }
                              if (!snapshot.hasData) {
                                return Text('Loading...');
                              }
                              List<Store> stores = snapshot.data!.docs
                                  .map((doc) => Store.fromFirestore(doc))
                                  .toList();
                              return ListView.builder(
                                  itemCount: 1,
                                  shrinkWrap: true,
                                  physics: NeverScrollableScrollPhysics(),
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    return Column(
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              "Visita programada",
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                  fontSize: size.width * 0.045,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            Text(
                                              "18/01/23",
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                  fontSize: size.width * 0.04),
                                            ),
                                          ],
                                        ),
                                        const Divider(),
                                        // SizedBox(
                                        //   height: size.height * 0.01,
                                        // ),
                                        StreamBuilder<QuerySnapshot>(
                                          stream: storesRef.snapshots(),
                                          builder: (BuildContext context,
                                              AsyncSnapshot<QuerySnapshot>
                                                  snapshot) {
                                            if (snapshot.hasError) {
                                              return Text(
                                                  'Error: ${snapshot.error}');
                                            }
                                            if (!snapshot.hasData) {
                                              return Text('Loading...');
                                            }
                                            List<Store> stores = snapshot
                                                .data!.docs
                                                .map((doc) =>
                                                    Store.fromFirestore(doc))
                                                .toList();
                                            return ListView.builder(
                                              itemCount: stores.length,
                                              shrinkWrap: true,
                                              physics:
                                                  NeverScrollableScrollPhysics(),
                                              itemBuilder:
                                                  (BuildContext context,
                                                      int index) {
                                                return Padding(
                                                  padding:
                                                      const EdgeInsets.all(8.0),
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      Column(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          Text(
                                                            "${stores[index].name}",
                                                            textAlign: TextAlign
                                                                .center,
                                                            style: TextStyle(
                                                                fontSize:
                                                                    size.width *
                                                                        0.04,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold),
                                                          ),
                                                          Text(
                                                            "${stores[index].address}",
                                                            textAlign: TextAlign
                                                                .center,
                                                            style: TextStyle(
                                                                fontSize:
                                                                    size.width *
                                                                        0.04),
                                                          ),
                                                        ],
                                                      ),
                                                      StreamBuilder<
                                                          QuerySnapshot>(
                                                        stream: storesToVisitRef
                                                            .snapshots(),
                                                        builder: (BuildContext
                                                                context,
                                                            AsyncSnapshot<
                                                                    QuerySnapshot>
                                                                snapshot) {
                                                          if (snapshot
                                                              .hasError) {
                                                            return Text(
                                                                'Error: ${snapshot.error}');
                                                          }
                                                          if (!snapshot
                                                              .hasData) {
                                                            return Text(
                                                                'Loading...');
                                                          }

                                                          QueryDocumentSnapshot
                                                              storesToVisitDoc =
                                                              snapshot.data!
                                                                  .docs.first;

                                                          return GestureDetector(
                                                            onTap: () {
                                                              Get.to(() =>
                                                                  StoreDetails(
                                                                    storeId:
                                                                        stores[index].storeId ??
                                                                            "",
                                                                    storeAddress:
                                                                        "${stores[index].address}",
                                                                  ));
                                                            },
                                                            child: Container(
                                                              decoration: BoxDecoration(
                                                                  color: const Color(
                                                                      0xffD9D9D9),
                                                                  borderRadius:
                                                                      BorderRadius.circular(
                                                                          size.width *
                                                                              0.02)),
                                                              padding:
                                                                  EdgeInsets.all(
                                                                      size.width *
                                                                          0.01),
                                                              child: Column(
                                                                children: [
                                                                  Text(
                                                                    "${(storesToVisitDoc)['total_items']}",
                                                                    textAlign:
                                                                        TextAlign
                                                                            .center,
                                                                    style: TextStyle(
                                                                        fontSize:
                                                                            size.width *
                                                                                0.04),
                                                                  ),
                                                                  Text(
                                                                    "items",
                                                                    textAlign:
                                                                        TextAlign
                                                                            .center,
                                                                    style: TextStyle(
                                                                        fontSize:
                                                                            size.width *
                                                                                0.04),
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                          );
                                                        },
                                                      ),
                                                    ],
                                                  ),
                                                );
                                              },
                                            );
                                          },
                                        ),
                                        SizedBox(
                                          height: size.height * 0.02,
                                        ),
                                        const Divider(),
                                        SizedBox(
                                          height: size.height * 0.01,
                                        ),
                                        GestureDetector(
                                            onTap: () {
                                              Get.to(() => VisitDetails(
                                                    storeAddress:
                                                        "${stores[index].address}",
                                                  ));
                                            },
                                            child: Text(
                                              "ver detalles".toUpperCase(),
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                  fontSize: size.width * 0.04,
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.blue),
                                            )),
                                      ],
                                    );
                                  });
                            }))
                  ],
                ),
              );
            }),
      ),
    );
  }
}
