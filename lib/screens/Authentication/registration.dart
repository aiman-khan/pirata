import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../common_widgets/custom_text_field.dart';
import 'files_upload.dart';

class Registration extends StatelessWidget {
  Registration({Key? key}) : super(key: key);

  final TextEditingController _emailController = TextEditingController();

  final TextEditingController _passwordController = TextEditingController();

  final TextEditingController _nameController = TextEditingController();

  final TextEditingController _phoneController = TextEditingController();

  final TextEditingController _addressController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  final termsRadioButton = false.obs;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: SizedBox(
          height: size.height,
          child: Padding(
            padding: EdgeInsets.all(size.width * 0.08),
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(
                    children: [
                      Row(
                        children: [
                          GestureDetector(
                              onTap: () {
                                Get.back();
                              },
                              child: const Icon(Icons.arrow_back))
                        ],
                      ),
                      Text(
                        "Regístrate",
                        style: TextStyle(
                            fontSize: size.width * 0.07,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: size.height * 0.03,
                      ),
                      Text(
                        "Lorem ipsum dolor sit amet,\n consectetur adipiscing elit. Nullam\n lorem magna",
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: size.width * 0.04),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      CustomTextField(
                        controller: _nameController,
                        size: size,
                        hintText: "Nombre",
                      ),
                      SizedBox(
                        height: size.height * 0.015,
                      ),
                      CustomTextField(
                          controller: _emailController,
                          validator: (v) {
                            if (v!.isEmpty) {
                              return "This field is required.";
                            }
                            if (!v.isEmail) {
                              return 'Invalid email';
                            }

                            return null;
                          },
                          size: size,
                          hintText: "Correo electrónico"),
                      SizedBox(
                        height: size.height * 0.015,
                      ),
                      CustomTextField(
                          controller: _phoneController,
                          size: size,
                          hintText: "Teléfono"),
                      SizedBox(
                        height: size.height * 0.015,
                      ),
                      CustomTextField(
                          controller: _addressController,
                          size: size,
                          hintText: "Dirección"),
                      SizedBox(
                        height: size.height * 0.015,
                      ),
                      CustomTextField(
                          controller: _passwordController,
                          size: size,
                          hintText: "Contraseña"),
                      SizedBox(
                        height: size.height * 0.02,
                      ),
                      Obx(
                        () => Row(
                          children: [
                            InkWell(
                              onTap: () {
                                termsRadioButton.toggle();
                              },
                              child: termsRadioButton.value
                                  ? Icon(
                                      Icons.radio_button_on_outlined,
                                      color: Colors.black,
                                    )
                                  : Icon(
                                      Icons.radio_button_off_outlined,
                                      color: Colors.black,
                                    ),
                            ),
                            SizedBox(
                              width: size.height * 0.01,
                            ),
                            Text(
                              "Acepto los términos y condiciones",
                              style: TextStyle(fontSize: size.width * 0.04),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  GestureDetector(
                    onTap: () {
                      if (_formKey.currentState!.validate()) {
                        if (termsRadioButton.value) {
                          Get.to(() => FilesUpload(
                                name: _nameController.text,
                                email: _emailController.text,
                                phone: _phoneController.text,
                                address: _addressController.text,
                                password: _passwordController.text,
                              ));
                        } else {
                          Get.snackbar("Attention!",
                              "Please accept the terms and conditions to continue");
                        }
                      }
                    },
                    child: Container(
                      width: size.width,
                      padding: EdgeInsets.all(size.width * 0.04),
                      decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius:
                              BorderRadius.circular(size.width * 0.02)),
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
                  Column(
                    children: [
                      const Divider(),
                      Text(
                        "Registrate como administrador",
                        style: TextStyle(
                            fontSize: size.width * 0.04, color: Colors.blue),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
