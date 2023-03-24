import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:maps_de/screens/splash_screen.dart';
import '../utils/Colors.dart';

class NoInternetPage extends StatefulWidget {
  const NoInternetPage({Key? key}) : super(key: key);

  @override
  State createState() => _NoInternetPageState();
}

class _NoInternetPageState extends State<NoInternetPage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                  color: backGroundColor,
                  borderRadius: BorderRadius.circular(10)
              ),
              // width: size.width * 0.5,
              child: Text("LOGO",style: TextStyle(fontSize: size.width * 0.05,color: Colors.white),)
          ),
          const SizedBox(height: 20,),
          InkWell(
            onTap: (){
              Get.offAll(const FadeTransitionSample());
            },
            child: Container(
                width: size.width * 0.3,
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                    color: backGroundColor,
                    borderRadius: BorderRadius.circular(10)
                ),
                child: const Icon(Icons.refresh,color: Colors.white,size: 30,)
            ),
          ),
          const SizedBox(height: 10,),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("No internet connection",style: TextStyle(fontSize: size.width * 0.05),),
            ],
          ),
        ],
      ),
    );
  }
}