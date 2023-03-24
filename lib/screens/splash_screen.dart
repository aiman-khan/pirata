import 'dart:async';
import 'dart:io';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:maps_de/screens/Authentication/files_upload.dart';
import 'package:maps_de/screens/Home/main_home.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../utils/Colors.dart';
import 'Authentication/login.dart';
import 'no_internet.dart';

class FadeTransitionSample extends StatefulWidget {
  const FadeTransitionSample({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _Fade();
}

class _Fade extends State<FadeTransitionSample> with TickerProviderStateMixin {
  bool isInternetAvailable = false;
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  var userId;
  checkLogin() async{
    final SharedPreferences prefs = await _prefs;
    userId = prefs.getString("userid");
  }
  AnimationController? animation;
  late Animation<double> _fadeInFadeOut;
  Future<bool> isInternetConnected() async {
    try {
      final result = await InternetAddress.lookup('google.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        print('connected');
        return true;
      } else {
        return false;
      }
    } on SocketException catch (_) {
      print('not connected');
      return false;
    }
  }

  @override
  void initState() {
    checkLogin();
    isInternetConnected().then((value){
      setState(() {
        isInternetAvailable = value;
      });
    });
    super.initState();
    animation = AnimationController(vsync: this, duration: const Duration(seconds: 4),);
    _fadeInFadeOut = Tween<double>(begin: 0.0, end: 1).animate(animation!);

    animation?.addStatusListener((status){
      if(status == AnimationStatus.completed){
        animation?.reverse();
      }
      else if(status == AnimationStatus.dismissed){
        animation?.forward();
      }
    });
    animation?.forward();
    Timer(
        const Duration(seconds: 6),
            // login and main
            () => Get.offAll(() => isInternetAvailable ? userId == null ? const LoginScreen() : const MainHome() : const NoInternetPage())
    );
  }
  @override
  dispose() {
    animation?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: FadeTransition(
            opacity: _fadeInFadeOut,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset("images/Frame-1.png"),
                Image.asset("images/Frame.png"),
              ],
            )
        ),
      ),
    );
  }
}