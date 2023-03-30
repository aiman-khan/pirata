import 'dart:async';
import 'dart:ui' as ui;

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:maps_de/models/visits.dart';
import 'package:permission_handler/permission_handler.dart';

import '../utils/utils.dart';

class MapDialogs extends GetxController {
  RxMap<String, Marker> markerList = <String, Marker>{}.obs;
  Position? currentPosition;
  RxBool loading = false.obs;
  RxBool showSearchedPlaces = false.obs;
  RxList<dynamic> storesList = <dynamic>[].obs;
  RxBool searching = false.obs;
  TextEditingController searchTextController = TextEditingController();
  CameraPosition? currentCameraPosition;
  final Completer<GoogleMapController> mapCompleter =
      Completer<GoogleMapController>();
  GoogleMapController? googleMapController;
  CameraPosition kGooglePlex = const CameraPosition(
    target: LatLng(50.11466, 94.522643),
    zoom: 14.4746,
  );

  CameraPosition kLake = const CameraPosition(
      bearing: 192.8334901395799,
      target: LatLng(37.43296265331129, -122.08832357078792),
      tilt: 59.440717697143555,
      zoom: 19.151926040649414);

  addMarkers(
    LatLng latLng, {
    required String imagePath,
    String? userId,
  }) async {
    // final Uint8List markIcons = await getImage(imagePath, 80);
    markerList.putIfAbsent(
      userId ?? DateTime.now().toString(),
      () => Marker(
          markerId: MarkerId(DateTime.now().microsecondsSinceEpoch.toString()),
          icon: BitmapDescriptor.defaultMarker,
          position: latLng),
    );
  }

  Future<void> moveCameraAccordingToCurrentLocation() async {
    currentPosition = await Utils.getCurrentUserLocation(denied: () {
      Get.defaultDialog(
        content: locationPermissionDialog(
            title: "Attention",
            description: "Allow location to see planted tree around you",
            cancelTap: () {
              Get.back();
            },
            buttonTap: () {
              openAppSettings();
            },
            image: '',
            buttonTitle: "Open setting"),
      );
    });
    if (currentPosition != null) {
      currentCameraPosition = CameraPosition(
        target: LatLng(currentPosition!.latitude, currentPosition!.longitude),
        zoom: 14.4746,
      );
      if (googleMapController != null) {
        googleMapController!.animateCamera(
            CameraUpdate.newCameraPosition(currentCameraPosition!));
      }
    }
  }

  Widget locationPermissionDialog({
    required String title,
    required String description,
    required String image,
    required String buttonTitle,
    VoidCallback? buttonTap,
    VoidCallback? cancelTap,
    Color? buttonColor,
    bool? barrierDismissal,
  }) {
    return Padding(
      padding: EdgeInsets.all(25.r),
      child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Align(
              alignment: Alignment.topRight,
              child: GestureDetector(
                onTap: () {
                  Get.back();
                },
                child: Container(
                  height: 25.r,
                  width: 25.r,
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(50)),
                  child: Icon(
                    Icons.close_rounded,
                    size: 20.r,
                  ),
                ),
              ),
            ),
            Image.asset(
              image,
              height: 150.h,
              width: 170.w,
            ),
            title.isNotEmpty
                ? Text(
                    title,
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                    ),
                    textAlign: TextAlign.center,
                  )
                : Container(),
          ]),
    );
  }
}
