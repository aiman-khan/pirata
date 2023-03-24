import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:maps_de/screens/problem_screen.dart';
import 'package:maps_de/screens/store_name_part3.dart';

class ProductDetails extends StatefulWidget {
  const ProductDetails({Key? key}) : super(key: key);

  @override
  State createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(left: size.width * 0.08,right: size.width * 0.08,top: size.width * 0.1),
              child: Column(
                children: [
                  SizedBox(height: size.height * 0.02,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                          onTap: (){
                            Get.back();
                          },
                          child: const Icon(Icons.arrow_back)),
                      Text("PRODUCTO", style: TextStyle(fontSize: size.width * 0.05,fontWeight: FontWeight.bold),),
                      SizedBox(width: size.width * 0.04,),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: size.height * 0.02,),
            const Divider(color: Colors.black,),
            SizedBox(height: size.height * 0.02,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  height: size.width * 0.2,
                  width: size.width * 0.2,
                  color: const Color(0xffBDBDBD)
                ),
                Container(
                  height: size.width * 0.2,
                  width: size.width * 0.2,
                  color: const Color(0xffBDBDBD)
                ),
                Container(
                  height: size.width * 0.2,
                  width: size.width * 0.2,
                  color: const Color(0xffBDBDBD)
                ),
              ],
            ),
            SizedBox(height: size.height * 0.02,),
            const Divider(color: Colors.black,),
            Padding(
              padding: EdgeInsets.all(size.width * 0.05),
              child: Column(
                children: [
                  Container(
                    width: size.width,
                    padding: EdgeInsets.all(size.width * 0.02),
                    decoration: BoxDecoration(
                      color: Colors.grey.shade200,
                      borderRadius: BorderRadius.circular(size.width * 0.01)
                    ),
                    child: Text("Nombre del producto",style: TextStyle(fontSize: size.width * 0.04),),
                  ),
                  SizedBox(height: size.height * 0.02,),
                  Container(
                    width: size.width,
                    padding: EdgeInsets.all(size.width * 0.02),
                    decoration: BoxDecoration(
                        color: Colors.grey.shade200,
                        borderRadius: BorderRadius.circular(size.width * 0.01)
                    ),
                    child: Text("SKU",style: TextStyle(fontSize: size.width * 0.04),),
                  ),
                  SizedBox(height: size.height * 0.02,),
                  Container(
                    width: size.width,
                    padding: EdgeInsets.all(size.width * 0.02),
                    decoration: BoxDecoration(
                        color: Colors.grey.shade200,
                        borderRadius: BorderRadius.circular(size.width * 0.01)
                    ),
                    child: Text("Presentación",style: TextStyle(fontSize: size.width * 0.04),),
                  ),
                  SizedBox(height: size.height * 0.02,),
                  Container(
                    width: size.width,
                    padding: EdgeInsets.all(size.width * 0.02),
                    decoration: BoxDecoration(
                        color: Colors.grey.shade200,
                        borderRadius: BorderRadius.circular(size.width * 0.01)
                    ),
                    child: Text("Precio",style: TextStyle(fontSize: size.width * 0.04),),
                  ),
                ],
              ),
            ),
            const Divider(color: Colors.black,),
            Padding(
              padding: EdgeInsets.all(size.width * 0.05),
              child: Row(
                children: [
                  Text("Medidas",style: TextStyle(fontSize: size.width * 0.05),),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: size.width * 0.05, right: size.width * 0.05, bottom: size.width * 0.05),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    width: size.width * 0.25,
                    padding: EdgeInsets.all(size.width * 0.04),
                    decoration: BoxDecoration(
                        color: Colors.grey.shade200,
                        borderRadius: BorderRadius.circular(size.width * 0.01)
                    ),
                    child: Text("Largo",textAlign: TextAlign.center,style: TextStyle(fontSize: size.width * 0.04),),
                  ),
                  Text("X"),
                  Container(
                    width: size.width * 0.25,
                    padding: EdgeInsets.all(size.width * 0.04),
                    decoration: BoxDecoration(
                        color: Colors.grey.shade200,
                        borderRadius: BorderRadius.circular(size.width * 0.01)
                    ),
                    child: Text("Alto",textAlign: TextAlign.center,style: TextStyle(fontSize: size.width * 0.04),),
                  ),
                  Text("X"),
                  Container(
                    width: size.width * 0.25,
                    padding: EdgeInsets.all(size.width * 0.04),
                    decoration: BoxDecoration(
                        color: Colors.grey.shade200,
                        borderRadius: BorderRadius.circular(size.width * 0.01)
                    ),
                    child: Text("Ancho",textAlign: TextAlign.center,style: TextStyle(fontSize: size.width * 0.04),),
                  ),
                ],
              ),
            ),
            const Divider(color: Colors.black,),
            Padding(
              padding: EdgeInsets.all(size.width * 0.05),
              child: Row(
                children: [
                  Text("Lugar de exhibición:",style: TextStyle(fontSize: size.width * 0.05),),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: size.width * 0.05, right: size.width * 0.05, bottom: size.width * 0.05),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    width: size.width,
                    padding: EdgeInsets.all(size.width * 0.02),
                    decoration: BoxDecoration(
                        color: Colors.grey.shade200,
                        borderRadius: BorderRadius.circular(size.width * 0.01)
                    ),
                    child: Text("Área de orgánicos",style: TextStyle(fontSize: size.width * 0.04),),
                  ),
                  SizedBox(height: size.height * 0.02,),
                  Container(
                    width: size.width,
                    padding: EdgeInsets.all(size.width * 0.02),
                    decoration: BoxDecoration(
                        color: Colors.grey.shade200,
                        borderRadius: BorderRadius.circular(size.width * 0.01)
                    ),
                    child: Text("Área de botanas",style: TextStyle(fontSize: size.width * 0.04),),
                  ),
                ],
              ),
            ),
            const Divider(color: Colors.black,),
            Padding(
              padding: EdgeInsets.all(size.width * 0.05),
              child: Row(
                children: [
                  Text("Sobreinventario cuando sea igual o mayor a:",style: TextStyle(fontSize: size.width * 0.05),),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: size.width * 0.05, right: size.width * 0.05, bottom: size.width * 0.05),
              child: Container(
                width: size.width,
                padding: EdgeInsets.all(size.width * 0.02),
                decoration: BoxDecoration(
                    color: Colors.grey.shade200,
                    borderRadius: BorderRadius.circular(size.width * 0.01)
                ),
                child: Text("40 Piezas",style: TextStyle(fontSize: size.width * 0.04),),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(size.width * 0.05),
              child: Row(
                children: [
                  Text("Desabasto cuando sea igual o menor a:",style: TextStyle(fontSize: size.width * 0.05),),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: size.width * 0.05, right: size.width * 0.05, bottom: size.width * 0.05),
              child: Container(
                width: size.width,
                padding: EdgeInsets.all(size.width * 0.02),
                decoration: BoxDecoration(
                    color: Colors.grey.shade200,
                    borderRadius: BorderRadius.circular(size.width * 0.01)
                ),
                child: Text("5 Piezas",style: TextStyle(fontSize: size.width * 0.04),),
              ),
            ),
            const Divider(color: Colors.black,),
          ],
        ),
      ),
    );
  }
}
