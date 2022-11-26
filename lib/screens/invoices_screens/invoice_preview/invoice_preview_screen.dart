// ignore_for_file: must_be_immutable, non_constant_identifier_names
import 'dart:io';

import 'package:fatura_app/controllers/invoice_controller.dart';
import 'package:fatura_app/controllers/items_controller.dart';
import 'package:fatura_app/models/invoice_model.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:fatura_app/constants/colors.dart';
import 'package:fatura_app/constants/strings.dart';
import 'package:fatura_app/controllers/FILEHANDLE.dart';
import 'package:fatura_app/controllers/invoices_controller.dart';
import 'package:fatura_app/env/dimensions.dart';
import 'package:fatura_app/screens/invoices_screens/invoice_preview/pdf_ai.dart';
import 'package:fatura_app/screens/shared_widgets/appbar_eng_view.dart';
import 'package:fatura_app/screens/shared_widgets/custom_btn.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class InvoicePreviewScreen extends StatelessWidget {
  ItemsController itemsController=ItemsController();
  Map<String, dynamic> args = Get.arguments;
  final pdf = pw.Document();
  InvoicePreviewScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.kSecondaryColor,
      appBar: AppBar(
        // leading: const BackButton(
        //
        //   color: Colors.black, // <-- SEE HERE
        // ),
        automaticallyImplyLeading: false,
        backgroundColor: Colors.orangeAccent,
        title: Text("Invoice Preview",style: TextStyle(color: Colors.black),),

      ),
      body: FutureBuilder(
          future: PdfInvoiceApi.generate(args['invoice']),

          builder: (context, snapshot) {
            if (snapshot.hasData) {
              dynamic _documentBytes = snapshot.data;
              return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Container(
                          margin: EdgeInsets.symmetric(
                              horizontal: Dimensions.calcW(15),
                              vertical: Dimensions.calcH(8)),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50)),
                          child: SfPdfViewer.memory(
                            _documentBytes,
                            initialZoomLevel: 0.5,
                          )),
                    ),
                    SizedBox(
                      height: Get.size.height * 0.2,
                      child: Column(
                        children: [
                          CustomBtn(
                            label: AppStrings.SAVE_BTN,
                            action: () {
                              ItemsController().clear_items();
                              Invoice invoice =
                              InvoiceController().generate_preview_invoice();
                              ItemsController().clear_items();

                              Get.find<AllInvoiceController>()
                                  .createNewInvoice(invoice);
                              Get.toNamed("/home");


                            },
                            color: AppColors.kPrimaryColor,
                            textColor: Colors.white,
                          ),
                          // InkWell(
                          //   onTap: () {},
                          //   splashColor: AppColors.kPrimaryLight,
                          //   child: Container(
                          //       padding: const EdgeInsets.symmetric(
                          //           vertical: 10, horizontal: 16),
                          //       decoration: BoxDecoration(
                          //         border:
                          //             Border.all(color: AppColors.kPrimaryDark),
                          //         borderRadius: BorderRadius.circular(4),
                          //       ),
                          //       child: Text(
                          //         AppStrings.HOME_BTN.toUpperCase(),
                          //         style: TextStyle(
                          //           color: AppColors.kPrimaryDark,
                          //           fontWeight: FontWeight.bold,
                          //           fontSize: Dimensions.calcH(15),
                          //         ),
                          //       )),
                          // )
                        ],
                      ),
                    )
                  ]);
            } else {
              return Center(
                child: SizedBox(
                  height: Dimensions.calcH(80),
                  width: Dimensions.calcW(80),
                  child: CircularProgressIndicator(
                    color: AppColors.kPrimaryColor,
                  ),
                ),
              );
            }
          }),
    );

  }
}
