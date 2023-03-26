import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../services/firebase_services.dart';

class ProfileComplete extends StatefulWidget {
  final File? idFont;
  final File? idBack;
  final File? profile;
  final File? singnature;

  final String name;
  final String email;
  final String phone;
  final String address;
  final String password;

  const ProfileComplete(
      {Key? key,
      this.idFont,
      this.idBack,
      this.profile,
      this.singnature,
      required this.name,
      required this.email,
      required this.phone,
      required this.address,
      required this.password})
      : super(key: key);

  @override
  State createState() => _ProfileCompleteState();
}

class _ProfileCompleteState extends State<ProfileComplete> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.all(size.width * 0.08),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Registro Exitoso",
              style: TextStyle(
                  fontSize: size.width * 0.07, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: size.height * 0.05,
            ),
            SvgPicture.asset("images/tickcircle.svg"),
            // Image.asset("name"),
            SizedBox(
              height: size.height * 0.05,
            ),
            Text(
              "Enviamos un link de confirmación a tu correo,\n revisa tu bandeja y da click en la liga\n para poder entrar.",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: size.width * 0.04),
            ),
            SizedBox(
              height: size.height * 0.05,
            ),
            GestureDetector(
              onTap: () async {
                await FirebaseServices().signUpUser(
                    widget.email,
                    widget.password,
                    widget.name,
                    widget.phone,
                    widget.address,
                    widget.idFont!,
                    widget.idBack!,
                    widget.profile!,
                    widget.singnature!);
              },
              child: Container(
                width: size.width,
                padding: EdgeInsets.all(size.width * 0.05),
                decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(size.width * 0.02)),
                child: Text(
                  "aceptar".toUpperCase(),
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
