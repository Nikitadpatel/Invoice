import 'dart:io';

import 'package:fatura_app/constants/colors.dart';
import 'package:fatura_app/constants/pdf_ai1.dart';
import 'package:fatura_app/constants/strings.dart';
import 'package:fatura_app/constants/view1.dart';
import 'package:fatura_app/constants/view2.dart';
import 'package:fatura_app/constants/view3.dart';
import 'package:fatura_app/controllers/invoices_controller.dart';
import 'package:fatura_app/controllers/items_controller.dart';
import 'package:fatura_app/env/dimensions.dart';
import 'package:fatura_app/models/pdfmodal.dart';
import 'package:fatura_app/screens/home_screen/widgets/invoice_english_view.dart';
import 'package:fatura_app/screens/shared_widgets/appbar_eng_view.dart';
import 'package:fatura_app/screens/shared_widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../constants/FileHAndleApi.dart';

class HomeScreen extends GetView<AllInvoiceController> {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.kSecondaryColor,
        appBar: AppBar(
          leading: const BackButton(
            color: Colors.black, // <-- SEE HERE
          ),
          backgroundColor: Colors.orangeAccent,
          title: Text("My Invoices",style: TextStyle(fontSize: 20.0,color:Colors.black),),
          actions: [
            InkWell(
              onTap: () {
                Get.toNamed("/new");
              },
              splashColor: AppColors.kSecondaryColor,
              customBorder: const CircleBorder(),
              child: SvgPicture.asset(
                "assets/icons/new_invoice.svg",
                height: Dimensions.calcH(25),
                color: AppColors.kPrimaryDark,
              ),
            ),
            SizedBox(
              width: Dimensions.calcW(15),
            ),
            // InkWell(
            //   onTap: () {},
            //   splashColor: AppColors.kSecondaryColor,
            //   customBorder: const CircleBorder(),
            //   child: SvgPicture.asset(
            //     "assets/icons/settings.svg",
            //     height: Dimensions.calcH(30),
            //     color: AppColors.kPrimaryDark,
            //   ),
            // ),
            // SizedBox(
            //   width: Dimensions.calcW(8),
            // ),
          ],
        ),
        body:
        ListView(

            padding: EdgeInsets.symmetric(horizontal: 20.0,vertical: 10.0),
              children: [
                GestureDetector(
                  onTap: ()async {
                    //final pdfFile = await PdfInvoiceApi.generate();
                    Navigator.of(context).push(MaterialPageRoute(builder: (context)=>view1()));
                    //FileHandleApi.openFile(pdfFile);


                  },
                  child: Card(
                    elevation: 4,
                    color: Colors.white,
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Invoice ID",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.bold),
                              ),
                              Text(
                                "Name",
                                style: TextStyle(
                                    color: Colors.grey,
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.bold),
                              ),
                              Text(
                                "22-08-2022",
                                style: TextStyle(
                                    color: Colors.grey,
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                          IconButton(onPressed: (){},
                              icon: Icon(Icons.download))
                        ],
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: ()async{
                    // final pdfFile = await PdfInvoiceApi.generate();
                    Navigator.of(context).push(MaterialPageRoute(builder: (context)=>view1()));

                  },
                  child: Card(
                    elevation: 4,
                    color: Colors.white,
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Invoice ID",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.bold),
                              ),
                              Text(
                                "Name",
                                style: TextStyle(
                                    color: Colors.grey,
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.bold),
                              ),
                              Text(
                                "22-08-2022",
                                style: TextStyle(
                                    color: Colors.grey,
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                          IconButton(onPressed: (){},
                              icon: Icon(Icons.download))
                        ],
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: ()async{
                    // final pdfFile = await PdfInvoiceApi.generate();
                    Navigator.of(context).push(MaterialPageRoute(builder: (context)=>view1()));

                  },
                  child: Card(
                    elevation: 4,
                    color: Colors.white,
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Invoice ID",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.bold),
                              ),
                              Text(
                                "Name",
                                style: TextStyle(
                                    color: Colors.grey,
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.bold),
                              ),
                              Text(
                                "22-08-2022",
                                style: TextStyle(
                                    color: Colors.grey,
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                          IconButton(onPressed: (){},
                              icon: Icon(Icons.download))
                        ],
                      ),
                    ),
                  ),
                )
              ],
        ),
        // Obx(() {
        //   if (controller.invoicesList.isEmpty) {
        //     return Center(
        //       child: CustomText(
        //         text: AppStrings.HOME_NO_INVOICES,
        //         color: Colors.black,
        //         fontSize: Dimensions.calcH(20),
        //         weight: FontWeight.w600,
        //       ),
        //     );
        //   } else {
        //     return SingleChildScrollView(
        //       child: Column(
        //         children: [
        //           ...controller.invoicesList
        //               .map((invoice) => InvoiceView_eng(
        //                     invoice: invoice,
        //                   ))
        //               .toList()
        //         ],
        //       ),
        //     );
        //   }
        // })
    );
  }
}
