import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:maps_de/screens/Authentication/files_upload.dart';
import 'package:maps_de/screens/screen2.dart';
import 'package:maps_de/screens/start_route.dart';
import 'package:maps_de/screens/screen4.dart';
import 'package:maps_de/screens/store_name_part3.dart';
import 'package:maps_de/screens/screen6.dart';
import 'package:maps_de/screens/screen7.dart';
import 'package:maps_de/screens/Home/home_chat.dart';
import 'Colors.dart';

class SideDrawer extends StatelessWidget {
  const SideDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final scaffold = ScaffoldMessenger.of(context);
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 100,
            decoration: const BoxDecoration(
              color: Colors.black,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Name",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: size.width * 0.06,
                      fontWeight: FontWeight.w700),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          GestureDetector(
            onTap: () {
              // Get.to(() => const FilesUpload());
            },
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Screen 1',
                style:
                    TextStyle(fontSize: size.width * 0.04, color: Colors.black),
              ),
            ),
          ),
          const Divider(
            color: Colors.grey,
          ),
          GestureDetector(
            onTap: () {
              Get.to(() => const Screen2());
            },
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Screen 2',
                style:
                    TextStyle(fontSize: size.width * 0.04, color: Colors.black),
              ),
            ),
          ),
          const Divider(
            color: Colors.grey,
          ),
          GestureDetector(
            onTap: () {
              Get.to(() => const StartRoute());
            },
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Screen 3',
                style:
                    TextStyle(fontSize: size.width * 0.04, color: Colors.black),
              ),
            ),
          ),
          const Divider(
            color: Colors.grey,
          ),
          GestureDetector(
            onTap: () {
              Get.to(() => const Screen4());
            },
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Screen 4',
                style:
                    TextStyle(fontSize: size.width * 0.04, color: Colors.black),
              ),
            ),
          ),
          const Divider(
            color: Colors.grey,
          ),
          GestureDetector(
            onTap: () {
              Get.to(() => StoreNamePart3());
            },
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Screen 5',
                style:
                    TextStyle(fontSize: size.width * 0.04, color: Colors.black),
              ),
            ),
          ),
          const Divider(
            color: Colors.grey,
          ),
          GestureDetector(
            onTap: () {
              Get.to(() => const Screen6());
            },
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Screen 6',
                style:
                    TextStyle(fontSize: size.width * 0.04, color: Colors.black),
              ),
            ),
          ),
          const Divider(
            color: Colors.grey,
          ),
          GestureDetector(
            onTap: () {
              Get.to(() => const Screen7());
            },
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Screen 7',
                style:
                    TextStyle(fontSize: size.width * 0.04, color: Colors.black),
              ),
            ),
          ),
          const Divider(
            color: Colors.grey,
          ),
          GestureDetector(
            onTap: () {
              Get.to(() => const HomeChat());
            },
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Screen 8',
                style:
                    TextStyle(fontSize: size.width * 0.04, color: Colors.black),
              ),
            ),
          ),
          const Divider(
            color: Colors.grey,
          ),
        ],
      ),
    );
  }
}
