// ignore_for_file: prefer_const_constructors, non_constant_identifier_names

import 'dart:io';
import 'dart:typed_data';
import 'package:fatura_app/models/invoice_model.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart';

class PdfInvoiceApi {

  static Future<Uint8List> generate(Invoice invoice) async {
    double? totaltax=invoice.total*0.02;
    double? totaldue=invoice.total*0.02+invoice.total;
    print(totaltax);
    const paymentTerms = '${15} days';
    final titles = <String>[];
    final data = <String>[];
    final headers = ['Description', 'Quantity', 'Price per item', 'Total'];
    final invoices_data = [...invoice.items.map((e) => e.toList()).toList()];
    final pdf = Document();
    pdf.addPage(MultiPage(
      // header: (context) => Text("INNVOICE ID ${invoice.id}",
      //     style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),
      build: (context) => [
        Container(
         height: 150.0,
         padding: EdgeInsets.all(10.0),
         decoration:BoxDecoration(
             color: PdfColors.grey200,
             borderRadius: BorderRadius.circular(10.0)
         ),
         child:  Row(
           crossAxisAlignment: CrossAxisAlignment.end,
           mainAxisAlignment: MainAxisAlignment.spaceBetween,
           children: [
             Column(
               crossAxisAlignment: CrossAxisAlignment.start,
               children: [
                 Text("CUSTOMER DETAILS",style: TextStyle(color: PdfColors.black,fontSize: 15.0,fontWeight: FontWeight.bold)),
                 SizedBox(height: 0.5 * PdfPageFormat.cm ),
                 Text(" Name  :  Xyz",
                     style: TextStyle(fontWeight: FontWeight.normal,fontSize: 15.0)),
                 SizedBox(height: 0.5 * PdfPageFormat.cm ),
                 Text(" Adderss  :  Xyz",
                     style: TextStyle(fontWeight: FontWeight.normal,fontSize: 15.0)),
                 SizedBox(height: 0.5 * PdfPageFormat.cm ),
                 Text(" phone  :  1234567890",
                     style: TextStyle(fontWeight: FontWeight.normal,fontSize: 15.0)),
               ],
             ),
             Column(
               crossAxisAlignment: CrossAxisAlignment.start,
               children: [
                 Text(" Invoice Id  :  123456",
                     style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15.0)),
                 SizedBox(height: 0.5 * PdfPageFormat.cm ),
                 Text(" Date  :  26/11/2022",
                     style: TextStyle(fontWeight: FontWeight.normal,fontSize: 15.0)),
               ],
             ),
           ],
         ),
            ),
         SizedBox(height: 0.5 * PdfPageFormat.cm),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Invoice details',
              style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 0.8 * PdfPageFormat.cm),
          ],
        ),
        Table.fromTextArray(
          headers: headers,
          data: invoices_data,
          border: TableBorder.all(width: 1.0),
          headerStyle: TextStyle(fontWeight: FontWeight.bold),
          headerDecoration: BoxDecoration(color: PdfColors.grey300),
          cellHeight: 30,
          oddRowDecoration: const BoxDecoration(
            color: PdfColors.grey100,
          ),
          cellAlignments: {
            0: Alignment.centerLeft,
            1: Alignment.center,
            2: Alignment.center,
            3: Alignment.center,
            4: Alignment.center,
            5: Alignment.center,
          },
        ),
        SizedBox(height: 0.5 * PdfPageFormat.cm),
        Divider(),
        SizedBox(height: 0.5 * PdfPageFormat.cm),
        Padding(padding: EdgeInsets.only(left: 200.0),
        child:  Container(
          width: 300.0,
          padding: EdgeInsets.all(10.0),
          decoration: BoxDecoration(
              color:PdfColors.grey200,
              borderRadius: BorderRadius.circular(10.0)
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              buildText(
                title: 'Total',
                titleStyle: TextStyle(
                    fontSize: 18.0
                ),
                value: "${invoice.total}",
                unite: true,
              ),
              SizedBox(height: 0.5 * PdfPageFormat.cm),
              buildText(title: "Vat",titleStyle: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.normal,
              ), value: '2%'),
              SizedBox(height: 0.5 * PdfPageFormat.cm),
              buildText(title: "Tax",titleStyle: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.normal,
              ), value: totaltax.toString()),
              SizedBox(height: 0.5 * PdfPageFormat.cm),
              buildText(title: "Total Amount due:",
                  titleStyle: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ), value: totaldue.toString()),
            ],
          ),
        ),
        )
      ],

    ));
    Uint8List bytes = await pdf.save();
    return bytes;
  }

  static buildSimpleText({
    required String title,
    required String value,
  }) {
    final style = TextStyle(fontWeight: FontWeight.bold);

    return Row(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Text(title, style: style),
        SizedBox(width: 2 * PdfPageFormat.mm),
        Text(value),
      ],
    );
  }

  static buildText({
    required String title,
    required String value,
    double width = double.infinity,
    TextStyle? titleStyle,
    bool unite = false,
  }) {
    final style = titleStyle ?? TextStyle(fontWeight: FontWeight.bold);

    return Container(
      width: width,
      child: Row(
        children: [
          Expanded(child: Text(title, style: style)),
          Text(value, style: unite ? style : style),
        ],
      ),
    );

  }
}
