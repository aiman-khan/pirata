import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:maps_de/screens/problem_screen.dart';
import 'package:maps_de/screens/product_details.dart';
import 'package:maps_de/screens/store_name_part3.dart';

class StoreDetails extends StatefulWidget {
  final String? storeAddress;
  final String? items;
  const StoreDetails({Key? key, this.storeAddress, this.items})
      : super(key: key);

  @override
  State createState() => _StoreDetailsState();
}

class _StoreDetailsState extends State<StoreDetails> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Column(
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
                      "NOMBRE TIENDA",
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
                      widget.storeAddress!,
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
          Expanded(
            child: ListView.builder(
                itemCount: 10,
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      ListTile(
                        title: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Palomitas amaranto, linaza",
                              style: TextStyle(
                                  fontSize: size.width * 0.04,
                                  fontWeight: FontWeight.bold),
                            ),
                            Text("SKU 15364667",
                                style: TextStyle(fontSize: size.width * 0.04)),
                            Text("28 Bolsas",
                                style: TextStyle(fontSize: size.width * 0.035)),
                          ],
                        ),
                        trailing: GestureDetector(
                            onTap: () {
                              Get.to(() => const ProductDetails());
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
                }),
          )
        ],
      ),
    );
  }
}
