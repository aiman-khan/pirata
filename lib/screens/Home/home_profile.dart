import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:maps_de/screens/Home/home_calender.dart';
import 'package:maps_de/screens/Home/home_chat.dart';
import 'package:maps_de/screens/Home/home_map.dart';
import '../settings/edit_profile.dart';
import 'package:percent_indicator/percent_indicator.dart';

class HomeProfile extends StatefulWidget {
  const HomeProfile({Key? key}) : super(key: key);

  @override
  State createState() => _HomeProfileState();
}

class _HomeProfileState extends State<HomeProfile> {
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
            SvgPicture.asset(
              "images/profilecircle.svg",
              color: Colors.blue,
            ),
            GestureDetector(
                onTap: () {
                  Get.off(() => const HomeCalender());
                },
                child: SvgPicture.asset("images/calendar.svg")),
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
      // backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: StreamBuilder<QuerySnapshot>(
            stream: FirebaseFirestore.instance
                .collection("users")
                .where("email",
                    isEqualTo: FirebaseAuth.instance.currentUser!.email)
                .snapshots(),
            builder: (context, snapshot) {
              if (!snapshot.hasData) {
                return const Center(
                    child: CircularProgressIndicator(
                  color: Colors.black,
                ));
              }

              QueryDocumentSnapshot document = snapshot.data!.docs.first;
              return Padding(
                padding: EdgeInsets.all(size.width * 0.05),
                child: Column(
                  children: [
                    SizedBox(
                      height: size.height * 0.05,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        const Icon(
                          Icons.settings_outlined,
                          color: Colors.transparent,
                        ),
                        Text(
                          "TU PERFIL",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: size.width * 0.06,
                              fontWeight: FontWeight.bold),
                        ),
                        GestureDetector(
                            onTap: () {
                              Get.to(() => EditProfile());
                            },
                            child: const Icon(Icons.settings_outlined))
                      ],
                    ),
                    Text(
                      "${(document.data() as dynamic)['name']}",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: size.width * 0.05,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: size.height * 0.03,
                    ),
                    CircularPercentIndicator(
                        radius: size.width * 0.18,
                        lineWidth: 50.0,
                        percent: 0.7,
                        center: CircleAvatar(
                            radius: size.width * 0.15,
                            backgroundColor: Colors.grey,
                            backgroundImage: NetworkImage(
                                (document.data() as dynamic)['profile_image'])),
                        progressColor: const Color(0xffBA9100)),
                    SizedBox(
                      height: size.height * 0.03,
                    ),
                    Text(
                      "Nivel bronce",
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: size.width * 0.04),
                    ),
                    SizedBox(
                      height: size.height * 0.01,
                    ),
                    Text(
                      "289 puntos",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: size.width * 0.05,
                          fontWeight: FontWeight.bold),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Icon(Icons.star),
                        Icon(Icons.star),
                        Icon(Icons.star),
                        Icon(Icons.star_border),
                        Icon(Icons.star_border),
                      ],
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
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Text(
                                "Datos de contacto",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontSize: size.width * 0.04,
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: size.height * 0.01,
                          ),
                          Row(
                            children: [
                              Text(
                                "${(document.data() as dynamic)['phone']}",
                                textAlign: TextAlign.center,
                                style: TextStyle(fontSize: size.width * 0.04),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: size.height * 0.01,
                          ),
                          Row(
                            children: [
                              Text(
                                "${(document.data() as dynamic)['email']}",
                                textAlign: TextAlign.center,
                                style: TextStyle(fontSize: size.width * 0.04),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: size.height * 0.02,
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
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Text(
                                "Tu cobertura",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontSize: size.width * 0.04,
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: size.height * 0.01,
                          ),
                          Row(
                            children: [
                              Text(
                                "${(document.data() as dynamic)['address']}",
                                textAlign: TextAlign.center,
                                style: TextStyle(fontSize: size.width * 0.04),
                              ),
                            ],
                          ),
                          const Divider(),
                          SizedBox(
                            height: size.height * 0.01,
                          ),
                          Row(
                            children: [
                              Text(
                                "Región 1",
                                textAlign: TextAlign.center,
                                style: TextStyle(fontSize: size.width * 0.04),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: size.height * 0.01,
                          ),
                          Row(
                            children: [
                              Text(
                                "Región 2",
                                textAlign: TextAlign.center,
                                style: TextStyle(fontSize: size.width * 0.04),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: size.height * 0.01,
                          ),
                          Row(
                            children: [
                              Text(
                                "Región 3",
                                textAlign: TextAlign.center,
                                style: TextStyle(fontSize: size.width * 0.04),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            }),
      ),
    );
  }
}
