import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SuccessFullCheckIn extends StatefulWidget {
  const SuccessFullCheckIn({Key? key}) : super(key: key);

  @override
  State createState() => _SuccessFullCheckInState();
}

class _SuccessFullCheckInState extends State<SuccessFullCheckIn> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: Column(
          children: [
            Text(
              "NOMBRE DE TIENDA ",
              style: TextStyle(
                  fontSize: size.width * 0.05,
                  fontWeight: FontWeight.bold,
                  color: Colors.black),
            ),
            Text(
              "ID Visita: 2089597",
              style:
                  TextStyle(fontSize: size.width * 0.035, color: Colors.black),
            ),
          ],
        ),
      ),
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.all(size.width * 0.08),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // SizedBox(height: size.height * 0.05,),
            SvgPicture.asset("images/tickcircle.svg"),
            // Image.asset("name"),
            SizedBox(
              height: size.height * 0.05,
            ),
            Column(
              children: [
                Text(
                  "CHECK IN EXITOSO",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: size.width * 0.045,
                      fontWeight: FontWeight.bold),
                ),
                Text(
                  "11:02 AM",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: size.width * 0.035),
                ),
              ],
            ),
            SizedBox(
              height: size.height * 0.05,
            ),
            GestureDetector(
              onTap: () {
                // Get.offAll(() => StoreNamePart1());
              },
              child: Container(
                width: size.width,
                padding: EdgeInsets.all(size.width * 0.05),
                decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(size.width * 0.02)),
                child: Text(
                  "continuar".toUpperCase(),
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: size.width * 0.04,
                      color: Colors.white,
                      fontWeight: FontWeight.w600),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
