import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:maps_de/screens/Authentication/profile_complete.dart';
import 'package:maps_de/utils/Colors.dart';
import '../../utils/drawer.dart';
import 'package:get/get.dart';

import 'dart:io';

import 'package:image_picker/image_picker.dart';

class FilesUpload extends StatefulWidget {
  final String name;
  final String email;
  final String phone;
  final String address;
  final String password;
  const FilesUpload({Key? key, required this.name, required this.email, required this.phone, required this.address, required this.password}) : super(key: key);

  @override
  State createState() => _FilesUploadState();
}

class _FilesUploadState extends State<FilesUpload> {

  final _formKey = GlobalKey<FormState>();
  File? idFont;
  File? idBack;
  File? profile;
  File? singnature;


  _pickImageFrom(ImageSource imageSource,String choice) async {
    XFile? xFile = await ImagePicker().pickImage(source: imageSource);
    if (xFile == null) return;
    final tempImage = File(xFile.path);
    if(choice == 'id_front')
      {
        idFont = tempImage;
      }
    else if(choice == 'id_back')
      {
        idBack = tempImage;
      }
    else if(choice == 'profile')
      {
        profile = tempImage;
      }
    else if(choice == 'signature')
      {
        singnature = tempImage;
      }


  }
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      drawer:  const Drawer(
          child: SideDrawer()
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(size.width * 0.08),
          child: Column(
            children: [
              SizedBox(height: size.height * 0.05,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("BIENVENIDO", style: TextStyle(fontSize: size.width * 0.06, fontWeight: FontWeight.bold),),
                ],
              ),
              SizedBox(height: size.height * 0.03,),
              Text("Lorem ipsum dolor sit amet,\n consectetur adipiscing elit.",textAlign: TextAlign.center, style: TextStyle(fontSize: size.width * 0.04),),
              SizedBox(height: size.height * 0.05,),
              InkWell(
                onTap: (){
                  _pickImageFrom(ImageSource.gallery, 'id_front');
                },
                child: Container(
                  padding: EdgeInsets.all(size.width * 0.03),
                  decoration: BoxDecoration(
                    color: buttonColor,
                    borderRadius: BorderRadius.circular(size.width * 0.02)
                  ),
                  child: Row(
                    children: [
                      SizedBox(width: size.width * 0.05,),
                      Image.asset("images/documentupload.png"),
                      SizedBox(width: size.width * 0.05,),
                      Text("id frente".toUpperCase(), style: TextStyle(fontSize: size.width * 0.04,color: Colors.white,fontWeight: FontWeight.w600),),
                    ],
                  ),
                ),
              ),
              SizedBox(height: size.height * 0.015,),
              InkWell(
                onTap: (){
                  _pickImageFrom(ImageSource.gallery, 'id_back');
                },
                child: Container(
                  padding: EdgeInsets.all(size.width * 0.03),
                  decoration: BoxDecoration(
                      color: buttonColor,
                      borderRadius: BorderRadius.circular(size.width * 0.02)
                  ),
                  child: Row(
                    children: [
                      SizedBox(width: size.width * 0.05,),
                      Image.asset("images/documentupload.png"),
                      SizedBox(width: size.width * 0.05,),
                      Text("id vuelta".toUpperCase(), style: TextStyle(fontSize: size.width * 0.04,color: Colors.white,fontWeight: FontWeight.w600),),
                    ],
                  ),
                ),
              ),
              SizedBox(height: size.height * 0.02,),
              Text("Credencial de lector o pasaporte,\n imagen en jpg, png o pdf",textAlign: TextAlign.center, style: TextStyle(fontSize: size.width * 0.03),),
              SizedBox(height: size.height * 0.05,),
              InkWell(
                onTap: (){
                  _pickImageFrom(ImageSource.gallery, 'profile');
                },
                child: Container(
                  padding: EdgeInsets.all(size.width * 0.03),
                  decoration: BoxDecoration(
                      color: buttonColor,
                      borderRadius: BorderRadius.circular(size.width * 0.02)
                  ),
                  child: Row(
                    children: [
                      SizedBox(width: size.width * 0.05,),
                      Image.asset("images/camera.png"),
                      SizedBox(width: size.width * 0.05,),
                      Text("tómate una foto".toUpperCase(), style: TextStyle(fontSize: size.width * 0.04,color: Colors.white,fontWeight: FontWeight.w600),),
                    ],
                  ),
                ),
              ),
              SizedBox(height: size.height * 0.02,),
              InkWell(
                onTap: (){
                  _pickImageFrom(ImageSource.gallery, 'signature');
                },
                child: Container(
                  padding: EdgeInsets.all(size.width * 0.03),
                  decoration: BoxDecoration(
                      color: buttonColor,
                      borderRadius: BorderRadius.circular(size.width * 0.02)
                  ),
                  child: Row(
                    children: [
                      SizedBox(width: size.width * 0.05,),
                      Image.asset("images/camera.png"),
                      SizedBox(width: size.width * 0.05,),
                      Text("Registra tu firma".toUpperCase(), style: TextStyle(fontSize: size.width * 0.04,color: Colors.white,fontWeight: FontWeight.w600),),
                    ],
                  ),
                ),
              ),
              SizedBox(height: size.height * 0.08,),
              GestureDetector(
                onTap: (){
                  Get.to(() =>  ProfileComplete(  idFont: idFont,
                      idBack: idBack,
                      profile: profile,
                      singnature: singnature,
                      name: widget.name,
                      email: widget.email,
                     password: widget.password,
                    phone: widget.phone,
                    address: widget.address,
                  ));
                },
                child: Container(
                  width: size.width,
                  padding: EdgeInsets.all(size.width * 0.05),
                  decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(size.width * 0.02)
                  ),
                  child: Text("finalizar registro".toUpperCase(),textAlign: TextAlign.center, style: TextStyle(fontSize: size.width * 0.04,color: Colors.white,fontWeight: FontWeight.w600),),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }


}
