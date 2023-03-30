//import 'package:geolocator/geolocator.dart';

import 'dart:io';

import 'package:geolocator/geolocator.dart';
import 'package:permission_handler/permission_handler.dart';

class Utils {
  Utils._internal();

  static Future<dynamic> checkLocationPermission() async {
    PermissionStatus status = await Permission.location.status;
    if (status == PermissionStatus.granted) {
      return status;
    } else if (status == PermissionStatus.permanentlyDenied) {
      return await openAppSettings();
    } else if (status == PermissionStatus.denied) {
      return await Permission.location.request();
    } else {
      return status;
    }
  }

  static Future getCurrentUserLocation(
      {required Null Function() denied}) async {
    PermissionStatus? locationPermissionStatus =
        await checkLocationPermission();
    if (locationPermissionStatus != null &&
        locationPermissionStatus.isGranted) {
      return await Geolocator.getCurrentPosition();
    } else if (locationPermissionStatus == PermissionStatus.permanentlyDenied) {
      // openAppSettings();
    }
  }
}
