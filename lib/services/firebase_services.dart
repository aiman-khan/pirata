import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:maps_de/utils/Colors.dart';

Future<void> signUpUser(
  String emailAddress,
  String password,
  String name,
  String phoneNo,
  String address,
  File idFont,
  File idBack,
  File profile,
  File singnature,
) async {
  try {
    await FirebaseAuth.instance
        .createUserWithEmailAndPassword(
      email: emailAddress,
      password: password,
    )
        .then((value) async {
      var profileImageFile =
          '${FirebaseAuth.instance.currentUser!.email!}_profile.jpg';
      var id_backFile =
          '${FirebaseAuth.instance.currentUser!.email!}_id_back.jpg';
      var id_frontFile =
          '${FirebaseAuth.instance.currentUser!.email!}_id_back.jpg';
      var signatureFile =
          '${FirebaseAuth.instance.currentUser!.email!}_signature.jpg';
      debugPrint("FileName : $profile");
      UploadTask uploadTaskProfile = FirebaseStorage.instance
          .ref()
          .child('user_profile')
          .child(profileImageFile)
          .putFile(profile);
      TaskSnapshot snapshotProfile = await uploadTaskProfile;

      String profileImageUrl = await snapshotProfile.ref.getDownloadURL();

      UploadTask uploadIdFront = FirebaseStorage.instance
          .ref()
          .child('user_profile')
          .child(id_frontFile)
          .putFile(profile);
      TaskSnapshot snapshotFront = await uploadIdFront;

      String idFrontUrl = await snapshotFront.ref.getDownloadURL();

      UploadTask uploadIdBack = FirebaseStorage.instance
          .ref()
          .child('user_profile')
          .child(id_backFile)
          .putFile(profile);
      TaskSnapshot snapshotBack = await uploadIdBack;

      String idBackUrl = await snapshotBack.ref.getDownloadURL();

      UploadTask uploadSignauture = FirebaseStorage.instance
          .ref()
          .child('user_profile')
          .child(signatureFile)
          .putFile(profile);
      TaskSnapshot snapshotSignature = await uploadSignauture;

      String signatureUrl = await snapshotSignature.ref.getDownloadURL();

      await FirebaseFirestore.instance
          .collection('users')
          .doc(FirebaseAuth.instance.currentUser!.uid)
          .set({
        'email': emailAddress,
        'phone': phoneNo,
        'created_at': DateTime.now().millisecondsSinceEpoch.toString(),
        'name': name,
        'address': address,
        'profile_image': profileImageUrl,
        "identity_pic_front": idFrontUrl,
        "identity_pic_back": idBackUrl,
        "signature": signatureUrl
      });
      // ignore: use_build_context_synchronously

      Get.snackbar(
        "Success!",
        'Account Created',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: green,
        // colorText: ,
      );
    });
  } on FirebaseAuthException catch (e) {
    debugPrint(e.code);
    if (e.code == 'network-request-failed') {
      Get.snackbar(
        "Error!",
        'No internet connection',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: red,
        // colorText: ,
      );
    }
    //
    else if (e.code == "wrong-password") {
      Get.snackbar(
        "Error!",
        'Wrong Password',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: red,
        // colorText: ,
      );
    }
    //
    else if (e.code == 'user-not-found') {
      Get.snackbar(
        "Error!",
        'User Not Found',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: red,
        // colorText: ,
      );
    }
    //
    else if (e.code == 'too-many-requests') {
      Get.snackbar(
        "Error!",
        'Too many attempts, please try again later',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: red,
        // colorText: ,
      );
    } else if (e.code == 'email-already-in-use') {
      Get.snackbar(
        "Error!",
        'Email already registered',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: red,
        // colorText: ,
      );
    } else {
      Get.snackbar(
        "Error!",
        '$e',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: red,
        // colorText: ,
      );
    }
  }
}

Future<void> signInUser(
  String emailAddress,
  String password,
  BuildContext context,
) async {
  try {
    await FirebaseAuth.instance
        .signInWithEmailAndPassword(
      email: emailAddress,
      password: password,
    )
        .then((value) async {
      Get.snackbar("Success!", 'Logged In',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: green,
          colorText: white
          // colorText: ,
          );
      // ignore: use_build_context_synchronously
      // Navigator.pushReplacement(
      //     context, MaterialPageRoute(builder: (context) => HomePage()));
    });
  } on FirebaseAuthException catch (e) {
    if (e.code == 'network-request-failed') {
      Get.snackbar("Error!", 'No internet connection',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: red,
          colorText: white
          // colorText: ,
          );
    }
    //
    else if (e.code == "wrong-password") {
      Get.snackbar("Error!", 'Wrong Password',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: red,
          colorText: white
          // colorText: ,
          );
    }
    //
    else if (e.code == 'user-not-found') {
      Get.snackbar("Error!", 'User Not Found',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: red,
          colorText: white
          // colorText: ,
          );
    }
    //
    else if (e.code == 'too-many-requests') {
      Get.snackbar("Error!", 'Too many attempts, please try again later',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: red,
          colorText: white
          // colorText: ,
          );
    } else if (e.code == 'email-already-in-use') {
      Get.snackbar("Error!", 'Email already registered',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: red,
          colorText: white
          // colorText: ,
          );
    } else {
      Get.snackbar("Error!", '$e',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: red,
          colorText: white
          // colorText: ,
          );
    }
  }

  Future<DocumentSnapshot?> getDocumentByEmail(String email) async {
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection('users')
        .where('email', isEqualTo: email)
        .limit(1) // limit to one document (optional)
        .get();

    if (querySnapshot.docs.isNotEmpty) {
      return querySnapshot.docs.first;
    } else {
      return null;
    }
  }
}
