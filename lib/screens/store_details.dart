import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:maps_de/screens/product_details.dart';

import '../models/visits.dart';

class StoreDetails extends StatefulWidget {
  final String storeId;
  final String storeAddress;
  const StoreDetails(
      {Key? key, required this.storeId, required this.storeAddress})
      : super(key: key);

  @override
  State createState() => _StoreDetailsState();
}

class _StoreDetailsState extends State<StoreDetails> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        body: SizedBox(
      height: size.height,
      child: StreamBuilder<QuerySnapshot>(
          stream: FirebaseFirestore.instance
              .collection('store_visits')
              .where("store_id", isEqualTo: widget.storeId)
              .snapshots(),
          builder:
              (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (snapshot.hasError) {
              return Text('Error: ${snapshot.error}');
            }
            if (!snapshot.hasData) {
              return Text('Loading...');
            }
            List<Visit> visits = snapshot.data!.docs
                .map((doc) => Visit.fromFirestoreMap(doc))
                .toList();

            return ListView.builder(
                itemCount: visits.length,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  DateTime dateTime = DateTime.fromMillisecondsSinceEpoch(
                      visits[index].createdAt!.seconds * 1000);

                  String formattedDate =
                      DateFormat('MMMM dd, yyyy').format(dateTime);
                  return Column(
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
                                  "${visits[index].storeName}",
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
                      Padding(
                        padding: EdgeInsets.only(
                            left: size.width * 0.05,
                            right: size.width * 0.05,
                            top: size.width * 0.05),
                        child: Row(
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  widget.storeAddress ?? "",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(fontSize: size.width * 0.04),
                                ),
                              ],
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
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Última visita - 10/01/23",
                              textAlign: TextAlign.center,
                              style: TextStyle(fontSize: size.width * 0.04),
                            ),
                            Row(
                              children: const [
                                Icon(Icons.star),
                                Icon(Icons.star),
                                Icon(Icons.star),
                                Icon(Icons.star),
                                Icon(Icons.star_border),
                              ],
                            ),
                          ],
                        ),
                      ),
                      const Divider(
                        color: Colors.black,
                      ),
                      ListView.builder(
                          itemCount: visits[index].dataInStore!.length,
                          shrinkWrap: true,
                          itemBuilder: (context, i) {
                            final data = visits[index].dataInStore!;
                            String key = data.keys.toList()[i];
                            dynamic value = data.values.toList()[i];
                            return Column(
                              children: [
                                ListTile(
                                  title: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        value[i]['product_name'].toString(),
                                        style: TextStyle(
                                            fontSize: size.width * 0.04,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Text("SKU 15364667",
                                          style: TextStyle(
                                              fontSize: size.width * 0.04)),
                                      Text(
                                          value[i]['shelf_inventory']
                                              .toString(),
                                          style: TextStyle(
                                              fontSize: size.width * 0.035)),
                                    ],
                                  ),
                                  trailing: GestureDetector(
                                      onTap: () {
                                        Get.to(() => ProductDetails(
                                              itemId: value[i]['item_id']
                                                  .toString(),
                                              storeId: widget.storeId,
                                            ));
                                      },
                                      child: const Icon(
                                        Icons.navigate_next,
                                        color: Colors.black,
                                      )),
                                  leading: Container(
                                    height: 50,
                                    width: 50,
                                    color: Colors.grey.shade300,
                                  ),
                                ),
                                const Divider(
                                  color: Colors.black,
                                ),
                              ],
                            );
                          })
                    ],
                  );
                });
          }),
    ));
  }
}
