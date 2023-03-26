import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:maps_de/common_widgets/custom_text_field.dart';
import 'package:maps_de/screens/Authentication/login.dart';
import 'package:maps_de/screens/Home/main_home.dart';
import 'package:maps_de/services/firebase_services.dart';
import 'package:maps_de/utils/app_popups.dart';
import 'package:table_calendar/table_calendar.dart';
import '../../../utils/drawer.dart';
import 'package:get/get.dart';

import 'change_password.dart';
import 'editor_screen.dart';

class EditProfile extends StatefulWidget {
  EditProfile({Key? key}) : super(key: key);

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  final TextEditingController nameController = TextEditingController();

  final TextEditingController emailController = TextEditingController();

  final TextEditingController phoneController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    getDocumentByEmail();
  }

  void getDocumentByEmail() async {
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection('users')
        .where('email', isEqualTo: FirebaseAuth.instance.currentUser!.email)
        .limit(1)
        .get();

    if (querySnapshot.docs.isNotEmpty) {
      emailController.text = querySnapshot.docs.first['email'];
      nameController.text = querySnapshot.docs.first['name'];
      phoneController.text = querySnapshot.docs.first['phone'];
    }
  }

  Future<void> updateProfile() async {
    await FirebaseFirestore.instance
        .collection('users')
        .where('email', isEqualTo: FirebaseAuth.instance.currentUser!.email)
        .get()
        .then((querySnapshot) {
      querySnapshot.docs.forEach((document) {
        document.reference
            .update({
              'email': emailController.text,
              'name': nameController.text,
              'phone': phoneController.text
            })
            .then((value) => print('Document updated'))
            .catchError((error) => print('Failed to update document: $error'));
      });
    });
    User? user = FirebaseAuth.instance.currentUser;
    await user?.updateEmail(emailController.text);
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(size.width * 0.05),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                SizedBox(
                  height: size.height * 0.07,
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
                      "CONFIGURACIÓN",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: size.width * 0.05,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      width: size.width * 0.05,
                    )
                  ],
                ),
                SizedBox(
                  height: size.height * 0.07,
                ),
                Row(
                  children: [
                    Text(
                      "Editar datos de contacto",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: size.width * 0.05),
                    ),
                  ],
                ),
                SizedBox(
                  height: size.height * 0.05,
                ),
                CustomTextField(
                  controller: nameController,
                  size: size,
                ),
                SizedBox(
                  height: size.height * 0.02,
                ),
                CustomTextField(
                  controller: emailController,
                  size: size,
                  // enabled: false,
                ),
                SizedBox(
                  height: size.height * 0.02,
                ),
                CustomTextField(
                  controller: phoneController,
                  size: size,
                ),
                SizedBox(
                  height: size.height * 0.02,
                ),
                GestureDetector(
                  onTap: () async {
                    if (_formKey.currentState!.validate()) {
                      AppPopUps().showProgressDialog(context: context);
                      await updateProfile();
                      AppPopUps().dissmissDialog(context);
                    }
                    // Get.to(() => const MainHome());
                  },
                  child: Container(
                    width: size.width,
                    padding: EdgeInsets.all(size.width * 0.05),
                    decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(size.width * 0.02)),
                    child: Text(
                      "GUARDAR CAMBIOS".toUpperCase(),
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: size.width * 0.04,
                          color: Colors.white,
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                ),
                SizedBox(
                  height: size.height * 0.02,
                ),
                const Divider(
                  color: Colors.black,
                ),
                SizedBox(
                  height: size.height * 0.02,
                ),
                GestureDetector(
                  onTap: () {
                    Get.to(() => const ChangePassword());
                  },
                  child: Row(
                    children: [
                      Image.asset("images/key.png"),
                      SizedBox(
                        width: size.width * 0.05,
                      ),
                      Text(
                        "Cambiar contrasena",
                        style: TextStyle(fontSize: size.width * 0.045),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: size.height * 0.02,
                ),
                const Divider(
                  color: Colors.black,
                ),
                SizedBox(
                  height: size.height * 0.02,
                ),
                GestureDetector(
                  onTap: () {
                    Get.to(() => const EditScreen());
                  },
                  child: Row(
                    children: [
                      Image.asset("images/map1.png"),
                      SizedBox(
                        width: size.width * 0.05,
                      ),
                      Text(
                        "Editar tu dirección",
                        style: TextStyle(fontSize: size.width * 0.045),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: size.height * 0.02,
                ),
                const Divider(
                  color: Colors.black,
                ),
                SizedBox(
                  height: size.height * 0.02,
                ),
                GestureDetector(
                  onTap: () {
                    AwesomeDialog(
                      context: context,
                      animType: AnimType.scale,
                      dialogType: DialogType.noHeader,
                      body: Column(
                        children: [
                          SizedBox(
                            height: size.height * 0.02,
                          ),
                          Text(
                            "CERRAR SESIÓN",
                            style: TextStyle(fontSize: size.width * 0.06),
                          ),
                          SizedBox(
                            height: size.height * 0.03,
                          ),
                          Text(
                            "¿Estás seguro de\n cerrar sesión?",
                            textAlign: TextAlign.center,
                            style: TextStyle(fontSize: size.width * 0.04),
                          ),
                          SizedBox(
                            height: size.height * 0.03,
                          ),
                          const Divider(
                            color: Colors.black,
                            thickness: 2,
                          ),
                          IntrinsicHeight(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                GestureDetector(
                                    onTap: () {
                                      Get.back();
                                    },
                                    child: Text(
                                      "Cancelar",
                                      style: TextStyle(
                                          fontSize: size.width * 0.06,
                                          fontWeight: FontWeight.bold),
                                    )),
                                const VerticalDivider(
                                    color: Colors.black, thickness: 2),
                                GestureDetector(
                                    onTap: () {
                                      Get.offAll(() => const LoginScreen());
                                    },
                                    child: Text(
                                      "Aceptar",
                                      style: TextStyle(
                                          fontSize: size.width * 0.06,
                                          fontWeight: FontWeight.bold),
                                    )),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: size.height * 0.015,
                          ),
                        ],
                      ),
                    ).show();
                  },
                  child: Row(
                    children: [
                      Image.asset("images/logincurve.png"),
                      SizedBox(
                        width: size.width * 0.05,
                      ),
                      Text(
                        "Cerrar sesión",
                        style: TextStyle(fontSize: size.width * 0.045),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: size.height * 0.02,
                ),
                const Divider(
                  color: Colors.black,
                ),
                SizedBox(
                  height: size.height * 0.05,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
