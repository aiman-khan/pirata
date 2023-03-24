import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:maps_de/screens/Home/home_calender.dart';

import 'home_map.dart';
import 'home_profile.dart';

class HomeChat extends StatefulWidget {
  const HomeChat({Key? key}) : super(key: key);

  @override
  State createState() => _HomeChatState();
}

class _HomeChatState extends State<HomeChat> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      bottomNavigationBar: Container(
        height: size.height * 0.08,
        decoration: const BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                  color: Colors.grey,
                  blurRadius: 2,
                  spreadRadius: 2,
                  offset: Offset(2, 2)
              )
            ]
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            GestureDetector(
                onTap: (){
                  Get.off(() => const HomeProfile());
                },
                child: SvgPicture.asset("images/profilecircle.svg")),
            GestureDetector(
                onTap: (){
                  Get.off(() => const HomeCalender());
                },
                child: SvgPicture.asset("images/calendar.svg")),
            GestureDetector(
                onTap: (){
                  Get.off(() => const HomeMap());
                },
                child: SvgPicture.asset("images/documenttext.svg")),
            SvgPicture.asset("images/messages3.svg",color: Colors.blue,),
          ],
        ),
      ),
      // backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: size.height * 0.05,),
            Padding(
              padding: EdgeInsets.only(left: size.width * 0.04, right: size.width * 0.04,top: size.width * 0.05,bottom: size.width * 0.01),
              child: Text("MENSAJES", style: TextStyle(color: Colors.black,fontSize: size.width * 0.05,fontWeight: FontWeight.bold),),
            ),
            SizedBox(height: size.height * 0.02,),
            const Divider(color: Color(0xffCFCFCF),),
            // SizedBox(height: size.height * 0.02,),
            ListTile(
              leading: Container(
                width: size.width * 0.12,
                decoration: const BoxDecoration(
                    color: Colors.grey,
                    shape: BoxShape.circle
                ),
              ),
              title: const Text("James", style: TextStyle(fontWeight: FontWeight.bold),),
              subtitle: const Text("Thank you! That was very helpful!"),
            ),
            const Divider(color: Color(0xffCFCFCF),),
            ListTile(
              leading: Container(
                width: size.width * 0.12,
                decoration: const BoxDecoration(
                    color: Colors.grey,
                    shape: BoxShape.circle
                ),
              ),
              title: const Text("Will Kenny", style: TextStyle(fontWeight: FontWeight.bold),),
              subtitle: const Text("I know... I’m trying to get the funds."),
            ),
            const Divider(color: Color(0xffCFCFCF),),
            ListTile(
              leading: Container(
                width: size.width * 0.12,
                decoration: const BoxDecoration(
                    color: Colors.grey,
                    shape: BoxShape.circle
                ),
              ),
              title: const Text("Beth Williams", style: TextStyle(fontWeight: FontWeight.bold),),
              subtitle: const Text("I’m looking for tips around capturing the milky way. I have a 6D with a 24-100mm..."),
            ),
            const Divider(color: Color(0xffCFCFCF),),
            ListTile(
              leading: Container(
                width: size.width * 0.12,
                decoration: const BoxDecoration(
                    color: Colors.grey,
                    shape: BoxShape.circle
                ),
              ),
              title: const Text("Rev Shawn", style: TextStyle(fontWeight: FontWeight.bold),),
              subtitle: const Text("Wanted to ask if you’re available for a portrait shoot next week."),
            ),
            const Divider(color: Color(0xffCFCFCF),),

            SizedBox(height: size.height * 0.05,),
          ],
        ),
      ),
    );
  }
}
