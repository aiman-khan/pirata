import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'files_upload.dart';

class Registration extends StatefulWidget {
  const Registration({Key? key}) : super(key: key);

  @override
  State createState() => _RegistrationState();
}

class _RegistrationState extends State<Registration> {

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  final _formKey = GlobalKey<FormState>();



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
                              onTap: (){
                                Get.back();
                              },
                              child: const Icon(Icons.arrow_back)
                          )
                        ],
                      ),
                      Text("Regístrate", style: TextStyle(fontSize: size.width * 0.07, fontWeight: FontWeight.bold),),
                      SizedBox(height: size.height * 0.03,),
                      Text("Lorem ipsum dolor sit amet,\n consectetur adipiscing elit. Nullam\n lorem magna",textAlign: TextAlign.center, style: TextStyle(fontSize: size.width * 0.04),),
                    ],
                  ),
                  Column(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(size.width * 0.02),
                            border: Border.all(width: 1.5)
                        ),
                        child:  TextFormField(
                          controller: _nameController,
                          decoration: InputDecoration(
                            hintText: "Nombre",
                            contentPadding: EdgeInsets.all(size.width * 0.04),
                            focusedBorder: InputBorder.none,
                            disabledBorder: InputBorder.none,
                            enabledBorder: InputBorder.none,
                          ),
                        ),
                      ),
                      SizedBox(height: size.height * 0.015,),
                      Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(size.width * 0.02),
                            border: Border.all(width: 1.5)
                        ),
                        child:  TextFormField(
                          controller: _emailController,
                          decoration: InputDecoration(
                            hintText: "Correo electrónico",
                            contentPadding: EdgeInsets.all(size.width * 0.04),
                            focusedBorder: InputBorder.none,
                            disabledBorder: InputBorder.none,
                            enabledBorder: InputBorder.none,
                          ),
                        ),
                      ),
                      SizedBox(height: size.height * 0.015,),
                      Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(size.width * 0.02),
                            border: Border.all(width: 1.5)
                        ),
                        child:  TextFormField(
                          controller: _phoneController,
                          decoration: InputDecoration(
                            hintText: "Teléfono",
                            contentPadding: EdgeInsets.all(size.width * 0.04),
                            focusedBorder: InputBorder.none,
                            disabledBorder: InputBorder.none,
                            enabledBorder: InputBorder.none,
                          ),
                        ),
                      ),
                      SizedBox(height: size.height * 0.015,),
                      Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(size.width * 0.02),
                            border: Border.all(width: 1.5)
                        ),
                        child:  TextFormField(
                          controller: _addressController,
                          decoration: InputDecoration(
                            hintText: "Dirección",
                            contentPadding: EdgeInsets.all(size.width * 0.04),
                            focusedBorder: InputBorder.none,
                            disabledBorder: InputBorder.none,
                            enabledBorder: InputBorder.none,
                          ),
                        ),
                      ),
                      SizedBox(height: size.height * 0.015,),
                      Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(size.width * 0.02),
                            border: Border.all(width: 1.5)
                        ),
                        child:  TextFormField(
                          controller: _passwordController,
                          decoration: InputDecoration(
                            hintText: "Contraseña",
                            contentPadding: EdgeInsets.all(size.width * 0.04),
                            suffixIcon: const Icon(Icons.remove_red_eye),
                            focusedBorder: InputBorder.none,
                            disabledBorder: InputBorder.none,
                            enabledBorder: InputBorder.none,
                          ),
                        ),
                      ),
                      SizedBox(height: size.height * 0.01,),
                      Row(
                        children: [
                          const Icon(Icons.radio_button_off_outlined, color: Colors.grey,),
                          SizedBox(width: size.height * 0.01,),

                          Text("Acepto los términos y condiciones", style: TextStyle(fontSize: size.width * 0.04),),
                        ],
                      ),
                    ],
                  ),
                  GestureDetector(
                    onTap: (){
                      Get.to(() =>  FilesUpload(name: _nameController.text,email: _emailController.text,phone: _phoneController.text,address: _addressController.text,password: _passwordController.text,));
                    },
                    child: Container(
                      width: size.width,
                      padding: EdgeInsets.all(size.width * 0.04),
                      decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(size.width * 0.02)
                      ),
                      child: Text("continuar".toUpperCase(),textAlign: TextAlign.center, style: TextStyle(fontSize: size.width * 0.04,color: Colors.white,fontWeight: FontWeight.w600),),
                    ),
                  ),
                  Column(
                    children: [
                      const Divider(),
                      Text("Registrate como administrador", style: TextStyle(fontSize: size.width * 0.04,color: Colors.blue),),
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
