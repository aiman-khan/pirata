import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:maps_de/screens/start_route.dart';
import 'package:maps_de/screens/start_route.dart';
import 'package:maps_de/screens/store_details.dart';
import 'package:maps_de/screens/store_name_part1.dart';

class VisitDetails extends StatefulWidget {
  const VisitDetails({Key? key}) : super(key: key);

  @override
  State createState() => _VisitDetailsState();
}

class _VisitDetailsState extends State<VisitDetails> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        centerTitle: true,
        title: const Text("DETALLES DE VISITA",style: TextStyle(color: Colors.black),),
      ),
      body: Column(
        children: [
          Container(
            color: Colors.grey,
            height: size.height * 0.2,
            // child: GoogleMap(
            //   mapType: MapType.hybrid,
            //   initialCameraPosition: _kGooglePlex,
            //   onMapCreated: (GoogleMapController controller) {
            //     _controller.complete(controller);
            //   },
            // ),
          ),
          Expanded(
            child: Container(
              color: Colors.white,
              child: Padding(
                padding: EdgeInsets.all(size.width * 0.05),
                child: Column(
                  children: [
                    SizedBox(height: size.height * 0.02,),
                    Text("RUTA OPTIMA PROGRAMADA",style: TextStyle(fontSize: size.width * 0.05,fontWeight: FontWeight.bold),),
                    SizedBox(height: size.height * 0.01,),
                    Text("17 de Enero del 2023",style: TextStyle(fontSize: size.width * 0.04),),
                    SizedBox(height: size.height * 0.01,),
                    GestureDetector(
                      onTap: (){
                        AwesomeDialog(
                          context: context,
                          animType: AnimType.scale,
                          dialogType: DialogType.noHeader,
                          body: Column(
                            children: [
                              SizedBox(height: size.height * 0.02,),
                              Padding(
                                padding: EdgeInsets.all(size.width * 0.01),
                                child: Text("Verifica tu documentación",style: TextStyle(fontSize: size.width * 0.05,fontWeight: FontWeight.bold),),
                              ),
                              // SizedBox(height: size.height * 0.02,),
                              const Divider(color: Colors.black,),
                              Padding(
                                padding: EdgeInsets.only(left: size.width * 0.1,right: size.width * 0.1),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text("Tienda 1",style: TextStyle(fontSize: size.width * 0.04,fontWeight: FontWeight.bold),),
                                    SizedBox(height: size.height * 0.01,),
                                    Row(
                                      children: [
                                        const Icon(Icons.check_box_outline_blank,color: Colors.grey),
                                        SizedBox(width: size.width * 0.02,),
                                        Text("Documento 1",style: TextStyle(fontSize: size.width * 0.03),),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        const Icon(Icons.check_box_outline_blank,color: Colors.grey),
                                        SizedBox(width: size.width * 0.02,),
                                        Text("Documento 2",style: TextStyle(fontSize: size.width * 0.03),),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        const Icon(Icons.check_box_outline_blank,color: Colors.grey,),
                                        SizedBox(width: size.width * 0.02,),
                                        Text("Documento 3",style: TextStyle(fontSize: size.width * 0.03),),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                              const Divider(color: Colors.black,),
                              Padding(
                                padding: EdgeInsets.only(left: size.width * 0.1,right: size.width * 0.1),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text("Tienda 2",style: TextStyle(fontSize: size.width * 0.04,fontWeight: FontWeight.bold),),
                                    SizedBox(height: size.height * 0.01,),
                                    Row(
                                      children: [
                                        const Icon(Icons.check_box_outline_blank,color: Colors.grey),
                                        SizedBox(width: size.width * 0.02,),
                                        Text("Documento 1",style: TextStyle(fontSize: size.width * 0.03),),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        const Icon(Icons.check_box_outline_blank,color: Colors.grey),
                                        SizedBox(width: size.width * 0.02,),
                                        Text("Documento 2",style: TextStyle(fontSize: size.width * 0.03),),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        const Icon(Icons.check_box_outline_blank,color: Colors.grey,),
                                        SizedBox(width: size.width * 0.02,),
                                        Text("Documento 3",style: TextStyle(fontSize: size.width * 0.03),),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                              const Divider(color: Colors.black,),
                              Padding(
                                padding: EdgeInsets.only(left: size.width * 0.1,right: size.width * 0.1),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text("Tienda 3",style: TextStyle(fontSize: size.width * 0.04,fontWeight: FontWeight.bold),),
                                    SizedBox(height: size.height * 0.01,),
                                    Row(
                                      children: [
                                        const Icon(Icons.check_box_outline_blank,color: Colors.grey),
                                        SizedBox(width: size.width * 0.02,),
                                        Text("Documento 1",style: TextStyle(fontSize: size.width * 0.03),),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        const Icon(Icons.check_box_outline_blank,color: Colors.grey),
                                        SizedBox(width: size.width * 0.02,),
                                        Text("Documento 2",style: TextStyle(fontSize: size.width * 0.03),),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        const Icon(Icons.check_box_outline_blank,color: Colors.grey,),
                                        SizedBox(width: size.width * 0.02,),
                                        Text("Documento 3",style: TextStyle(fontSize: size.width * 0.03),),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                              const Divider(color: Colors.black,),
                              Padding(
                                padding: EdgeInsets.only(left: size.width * 0.1,right: size.width * 0.1),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text("Tienda 4",style: TextStyle(fontSize: size.width * 0.04,fontWeight: FontWeight.bold),),
                                    SizedBox(height: size.height * 0.01,),
                                    Row(
                                      children: [
                                        const Icon(Icons.check_box_outline_blank,color: Colors.grey),
                                        SizedBox(width: size.width * 0.02,),
                                        Text("Documento 1",style: TextStyle(fontSize: size.width * 0.03),),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        const Icon(Icons.check_box_outline_blank,color: Colors.grey),
                                        SizedBox(width: size.width * 0.02,),
                                        Text("Documento 2",style: TextStyle(fontSize: size.width * 0.03),),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        const Icon(Icons.check_box_outline_blank,color: Colors.grey,),
                                        SizedBox(width: size.width * 0.02,),
                                        Text("Documento 3",style: TextStyle(fontSize: size.width * 0.03),),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                              const Divider(color: Colors.black,),
                              SizedBox(height: size.height * 0.02,),
                              GestureDetector(
                                onTap: (){
                                  Get.to(() => const StartRoute());
                                },
                                child: Container(
                                  width: size.width * 0.7,
                                  padding: EdgeInsets.all(size.width * 0.04),
                                  decoration: BoxDecoration(
                                      color: Colors.black,
                                      borderRadius: BorderRadius.circular(size.width * 0.02)
                                  ),
                                  child: Text("CONFIRMAR ".toUpperCase(),textAlign: TextAlign.center, style: TextStyle(fontSize: size.width * 0.04,color: Colors.white,fontWeight: FontWeight.w600),),
                                ),
                              ),
                              SizedBox(height: size.height * 0.02,),
                            ],
                          ),
                        ).show();
                      },
                      child: Container(
                        width: size.width,
                        padding: EdgeInsets.all(size.width * 0.04),
                        decoration: BoxDecoration(
                            color: Colors.black,
                            borderRadius: BorderRadius.circular(size.width * 0.02)
                        ),
                        child: Text("ver ruta optima".toUpperCase(),textAlign: TextAlign.center, style: TextStyle(fontSize: size.width * 0.04,color: Colors.white,fontWeight: FontWeight.w600),),
                      ),
                    ),
                    SizedBox(height: size.height * 0.01,),
                    const Divider(color: Colors.black,),
                    Expanded(
                      child: GestureDetector(
                        onTap: (){
                          Get.to(() => const StoreDetails());
                        },
                        child: ListView.builder(
                            itemCount: 4,
                            itemBuilder: (context, index) {
                              return Column(
                                children: [
                                  Padding(
                                    padding: EdgeInsets.all(size.width * 0.03),
                                    child: Column(
                                      children: [
                                        Row(
                                          children: [
                                            Text("Nombre tienda",style: TextStyle(fontSize: size.width * 0.04,fontWeight: FontWeight.bold),),
                                          ],
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: [
                                              Row(children: [
                                                Column(
                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                  children: [
                                                    Text("Av. José Martír No. 38 Local A",style: TextStyle(fontSize: size.width * 0.04),),
                                                    Text("18 productos",style: TextStyle(fontSize: size.width * 0.04),),
                                                  ],
                                                ),
                                              ],),
                                              const Icon(Icons.navigate_next)
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  const Divider(color: Colors.black,),
                                ],
                              );
                            }),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
