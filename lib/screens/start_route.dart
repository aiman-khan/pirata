import 'package:get/get.dart';
import 'package:flutter/material.dart';

import 'check_in.dart';

class StartRoute extends StatefulWidget {
  const StartRoute({Key? key}) : super(key: key);

  @override
  State createState() => _StartRouteState();
}

class _StartRouteState extends State<StartRoute> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              alignment: Alignment.bottomCenter,
              children: [
                Container(
                  color: Colors.grey,
                  height: size.height,
                  // child: GoogleMap(
                  //   mapType: MapType.hybrid,
                  //   initialCameraPosition: _kGooglePlex,
                  //   onMapCreated: (GoogleMapController controller) {
                  //     _controller.complete(controller);
                  //   },
                  // ),
                ),
                Positioned(
                  child: Padding(
                    padding: EdgeInsets.only(left: size.width * 0.04,right: size.width * 0.04),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(topRight: Radius.circular(size.width * 0.04), topLeft: Radius.circular(size.width * 0.04))
                      ),
                      height: size.height / 4,
                      width: size.width,
                      child: Column(
                        children: [
                          SizedBox(height: size.height * 0.02,),
                          Column(
                            children: [
                              SizedBox(height: size.height * 0.01,),
                              Text("10:35",style: TextStyle(fontSize: size.width * 0.08,fontWeight: FontWeight.bold),),
                              SizedBox(height: size.height * 0.01,),
                              Text("5 TIENDAS POR VISITAR",style: TextStyle(fontSize: size.width * 0.05,fontWeight: FontWeight.bold)),
                              SizedBox(height: size.height * 0.01,),
                              Text("48 min - 30 km",style: TextStyle(fontSize: size.width * 0.04, color: Colors.blue)),
                              SizedBox(height: size.height * 0.02,),
                            ],
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: size.width * 0.08, right: size.width * 0.08,top: size.width * 0.01,bottom: size.width * 0.03),
                            child: GestureDetector(
                              onTap: (){
                                Get.to(() => const CheckIn());
                              },
                              child: Container(
                                width: size.width,
                                padding: EdgeInsets.all(size.width * 0.04),
                                decoration: BoxDecoration(
                                    color: Colors.black,
                                    borderRadius: BorderRadius.circular(size.width * 0.02)
                                ),
                                child: Text("COMENZAR RUTA".toUpperCase(),textAlign: TextAlign.center, style: TextStyle(fontSize: size.width * 0.04,color: Colors.white,fontWeight: FontWeight.w600),),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
