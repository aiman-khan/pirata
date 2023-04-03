import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../models/visits.dart';

class StoreNameFinal extends StatelessWidget {
  final Visit visit;

  const StoreNameFinal({Key? key, required this.visit}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    DateTime time = DateTime.now();
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: EdgeInsets.only(
                  left: size.width * 0.08,
                  right: size.width * 0.08,
                  top: size.width * 0.08),
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
                        "${visit.storeName}",
                        style: TextStyle(
                            fontSize: size.width * 0.05,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        width: size.width * 0.07,
                      ),
                    ],
                  ),
                  Text(
                    "ID Visita: ${visit.visitId}",
                    style: TextStyle(fontSize: size.width * 0.04),
                  ),
                  SizedBox(
                    height: size.height * 0.02,
                  ),
                ],
              ),
            ),
            Column(
              children: [
                SvgPicture.asset("images/tickcircle.svg"),
                SizedBox(
                  height: size.height * 0.01,
                ),
                Text(
                  "Reporte enviado,\nHiciste un buen trabajo",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: size.width * 0.035),
                ),
                SizedBox(
                  height: size.height * 0.01,
                ),
                Text(
                  "VISITA COMPLETADA",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: size.width * 0.04, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: size.height * 0.01,
                ),
                Text(
                  DateFormat('h:m').format(time),
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: size.width * 0.035),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.all(size.width * 0.03),
              child: Container(
                width: size.width,
                padding: EdgeInsets.all(size.width * 0.02),
                decoration: BoxDecoration(
                    color: const Color(0xffD9D9D9),
                    borderRadius: BorderRadius.circular(size.width * 0.1)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CircleAvatar(
                      radius: size.width * 0.07,
                      backgroundColor: const Color(0xff009A0F),
                    ),
                    Text(
                      "DESLIZA PARA CHECK OUT".toUpperCase(),
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: size.width * 0.05,
                          color: const Color(0xff009A0F),
                          fontWeight: FontWeight.w700),
                    ),
                    SizedBox(
                      width: size.width * 0.04,
                    ),
                  ],
                ),
              ),
            ),
            // Expanded(child: SwipeList()),
          ],
        ),
      ),
    );
  }
}

class SwipeList extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return CircleWidgets();
  }
}

class CircleWidgets extends State<SwipeList> {
  List items = getDummyList();

  @override
  Widget build(BuildContext context) {
    return Container(
        child: ListView.builder(
      itemCount: items.length,
      itemBuilder: (context, index) {
        return Dismissible(
          direction: DismissDirection.endToStart,
          key: Key(items[index]),
          background: Container(
            alignment: AlignmentDirectional.centerEnd,
            color: Colors.red,
            child: Padding(
              padding: EdgeInsets.fromLTRB(0.0, 0.0, 10.0, 0.0),
              child: Icon(
                Icons.delete,
                color: Colors.white,
              ),
            ),
          ),
          onDismissed: (direction) {
            setState(() {
              items.removeAt(index);
            });
          },
          child: Container(
            height: 50.0,
            decoration: BoxDecoration(border: Border.all(width: 1.0)),
            padding: EdgeInsets.all(5.0),
            child: Row(
              children: <Widget>[
                Text(
                  items[index],
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20.0,
                  ),
                )
              ],
            ),
          ),
        );
      },
    ));
  }

  static List getDummyList() {
    List list = List.generate(10, (i) {
      return "Item ${i + 1}";
    });
    return list;
  }
}
