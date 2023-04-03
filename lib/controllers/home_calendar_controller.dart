import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

import '../services/firebase_services.dart';
import '../utils/globals.dart';

class HomeCalendarController extends GetxController {
  FirebaseServices firebaseServices = FirebaseServices();
  final CollectionReference storesRef =
      FirebaseFirestore.instance.collection('stores');
  final CollectionReference storesToVisitRef =
      FirebaseFirestore.instance.collection('store_visits');

  // DocumentSnapshot? visits;
  Rx<DocumentSnapshot>? visits;
  final expand = false.obs;

  final userId = "".obs;

  @override
  void onInit() {
    super.onInit();
    getUserId();
  }

  Future<void> getVisits() async {
    firebaseServices.getVisits(Globals().userId).then((result) {
      visits!.value = result!;
    });
  }

  void getUserId() {
    userId.value = FirebaseAuth.instance.currentUser!.uid;
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }
}
