import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:maps_de/screens/successfull_check_in.dart';

class CheckIn extends StatefulWidget {
  const CheckIn({Key? key}) : super(key: key);

  @override
  State createState() => _CheckInState();
}

class _CheckInState extends State<CheckIn> {
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
                              Text("NOMBRE DE TIENDA ",style: TextStyle(fontSize: size.width * 0.04,fontWeight: FontWeight.bold)),
                              SizedBox(height: size.height * 0.005,),
                              Text("Navarrete #156 Col. Linda Vista",style: TextStyle(fontSize: size.width * 0.035)),
                              SizedBox(height: size.height * 0.01,),
                              Text("48 min - 30 km",style: TextStyle(fontSize: size.width * 0.04, color: Colors.green)),
                              SizedBox(height: size.height * 0.02,),
                            ],
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: size.width * 0.08, right: size.width * 0.08,top: size.width * 0.01,bottom: size.width * 0.03),
                            child: GestureDetector(
                              onTap: (){
                                Get.to(() => const SuccessFullCheckIn());
                              },
                              child: Container(
                                width: size.width,
                                padding: EdgeInsets.all(size.width * 0.04),
                                decoration: BoxDecoration(
                                    color: Colors.black,
                                    borderRadius: BorderRadius.circular(size.width * 0.02)
                                ),
                                child: Text("check in".toUpperCase(),textAlign: TextAlign.center, style: TextStyle(fontSize: size.width * 0.04,color: Colors.white,fontWeight: FontWeight.w600),),
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
