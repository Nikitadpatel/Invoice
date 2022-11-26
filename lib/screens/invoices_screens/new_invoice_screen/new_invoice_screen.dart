import 'package:fatura_app/constants/colors.dart';
import 'package:fatura_app/constants/strings.dart';
import 'package:fatura_app/controllers/customer_controller.dart';
import 'package:fatura_app/controllers/invoice_controller.dart';
import 'package:fatura_app/controllers/invoices_controller.dart';
import 'package:fatura_app/controllers/items_controller.dart';
import 'package:fatura_app/env/dimensions.dart';
import 'package:fatura_app/models/invoice_model.dart';
import 'package:fatura_app/screens/invoices_screens/new_invoice_screen/new_items/widgets/custom_tablerow.dart';
import 'package:fatura_app/screens/invoices_screens/new_invoice_screen/payment_instructions/payment_instructions.dart';
import 'package:fatura_app/screens/invoices_screens/new_invoice_screen/widgets/option_view_eng.dart';
import 'package:fatura_app/screens/shared_widgets/appbar_eng_view.dart';
import 'package:fatura_app/screens/shared_widgets/custom_btn.dart';
import 'package:fatura_app/screens/shared_widgets/custom_input_eng.dart';
import 'package:fatura_app/screens/shared_widgets/custom_richText.dart';
import 'package:fatura_app/screens/shared_widgets/custom_text.dart';
import 'package:fatura_app/utils/functions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
class NewInvoiceScreen extends StatefulWidget {
  const NewInvoiceScreen({Key? key}) : super(key: key);

  @override
  State<NewInvoiceScreen> createState() => _NewInvoiceScreenState();
}

class _NewInvoiceScreenState extends State<NewInvoiceScreen> {
  final CustomerController customerController = Get.put(CustomerController());
  final ItemsController itemCOntroller = Get.put(ItemsController());

  final List<String> items1 = [
    'items 1',
    'items 2',
    'items 3',
    'items 4',
    'items 5',
  ];
  final List<String> items = [
    'customer 1',
    'customer 2',
    'customer 3',
    'customer 4',
    'customer 5',
  ];
@override
void initState() {
    // TODO: implement initState
    super.initState();
  itemCOntroller.itemsList.isEmpty;
  }
  int? _volume=0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.kSecondaryColor,
      appBar: AppBar(
        leading: const BackButton(
          color: Colors.black, // <-- SEE HERE
        ),
        backgroundColor: Colors.orangeAccent,
        title: Text("New Invoice",style: TextStyle(color: Colors.black),),
        actions: [
          IconButton(
            onPressed: () {
              Get.back();
            },
            icon: SvgPicture.asset(
              "assets/icons/circle_close.svg",
              color: AppColors.kPrimaryDark,
            ),
          )
        ],
      ),
      body: SafeArea(
        child: NotificationListener<OverscrollIndicatorNotification>(
          onNotification: (scroll) {
            scroll.disallowIndicator();
            return true;
          },
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: GetBuilder<InvoiceController>(
                init: InvoiceController(),
                builder: (controller) {
                  // if (controller.id == "0") {
                  //   String id =
                  //   DateTime.now().millisecondsSinceEpoch.toString();
                  //   controller.id = id;
                  // } else {}

                  return Container(
                    padding: EdgeInsets.all(15.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Select Custumer",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 20.0,
                              fontWeight: FontWeight.w700),
                        ),
                        SizedBox(
                          height: 20.0,
                        ),
                        Obx(
                              () => Container(
                            padding:
                            const EdgeInsets.only(top: 8, left: 8, right: 8,bottom: 8.0),

                            width: double.maxFinite,
                            height: 50.0,
                            decoration: BoxDecoration(
                                color: Colors.white,
                              borderRadius: BorderRadius.circular(15.0)
                            ),
                            child: DropdownButtonHideUnderline(
                              child: DropdownButton(
                                isDense: true,
                                isExpanded: true,
                                elevation: 0,
                                value:customerController.dropdownvalue.value,
                                icon: const Icon(Icons.keyboard_arrow_down),
                                items: items.map((String items) {
                                  return DropdownMenuItem(
                                    value: items,
                                    child: Text(items),
                                  );
                                }).toList(),
                                onChanged: (newValue) {
                                  customerController.dropdownvalue.value =
                                  newValue as String;
                                },
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 20.0,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Product Items",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 20.0,
                                  fontWeight: FontWeight.w700),
                            ),
                            TextButton.icon(
                              onPressed: () {
                                Get.defaultDialog(
                                  title:"Add New Item",
                                  content: Container(
                                    height: 300.0,
                                    child: SingleChildScrollView(
                                      child: Column(
                                        children: [
                                          const Divider(),

                                          SizedBox(
                                            height: 20.0,
                                          ),
                                          Obx(
                                                () => SizedBox(
                                              height: 50.0,
                                              width: 250.0,
                                              child: Card(
                                                // elevation: 8,
                                                color: Colors.white,
                                                  shape: RoundedRectangleBorder(

                                                    borderRadius: BorderRadius.circular(15),
                                                  ),
                                                child: Padding(
                                                  padding: const EdgeInsets.only(top: 8, left: 8, right: 8,bottom: 8.0),
                                                  child: DropdownButtonHideUnderline(
                                                    child: DropdownButton(
                                                      isDense: true,
                                                      isExpanded: true,
                                                      elevation: 0,
                                                      value: itemCOntroller.itemdownvalue.value,
                                                      icon: const Icon(Icons.keyboard_arrow_down),
                                                      items: items1.map(
                                                            (String items) {
                                                          return DropdownMenuItem(
                                                            value: items,
                                                            child: Text(items),
                                                          );
                                                        },
                                                      ).toList(),
                                                      onChanged: (newValue) {
                                                        itemCOntroller.itemdownvalue.value =
                                                        newValue as String;
                                                      },
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                          SizedBox(height: 20.0,),
                                          Container(
                                            height: 40.0,
                                            padding: EdgeInsets.symmetric(horizontal: 5.0),
                                            child:TextFormField(
                                              controller: itemCOntroller.itemPriceInputController ,
                                              keyboardType: TextInputType.number,
                                              style: textStyle,
                                              validator: (value) {
                                                if (value!.isEmpty) {
                                                  return 'Please enter the price';
                                                }
                                                return null;
                                              },
                                              decoration: inputDecoration(
                                                  hintText: 'Price',
                                                  icon: Icon(Icons.lock)
                                              ),
                                            )),
                                          SizedBox(height: 20.0,),
                                          Container(
                                            height: 40.0,
                                              padding: EdgeInsets.symmetric(horizontal: 5.0),
                                              child:TextFormField(
                                                controller: itemCOntroller.itemQtyInputController ,
                                                keyboardType: TextInputType.number,
                                                style: textStyle,
                                                validator: (value) {
                                                  if (value!.isEmpty) {
                                                    return 'Please enter the Quantity';
                                                  }
                                                  return null;
                                                },
                                                decoration: inputDecoration(
                                                    hintText: 'Quantity',
                                                    icon: Icon(Icons.lock)
                                                ),
                                              )),
                                          // Container(
                                          //   padding: EdgeInsets.symmetric(horizontal: 10.0),
                                          //   child: CustomInput_eng(
                                          //     label: AppStrings.ADD_ITEMS_QTY,
                                          //     controller: itemCOntroller.itemQtyInputController,
                                          //     type: TextInputType.number,
                                          //   ),
                                          // ),
                                          SizedBox(height: 20.0,),
                                          Center(
                                            child: Container(
                                              alignment: Alignment.center,
                                              height: 40.0,
                                              width: 140.0,
                                              decoration: BoxDecoration(
                                                borderRadius: BorderRadius.circular(20.0),
                                                // gradient: const LinearGradient(
                                                //     colors: [
                                                //       Colors.orange,
                                                //       Colors.amber,
                                                //
                                                //       //add more colors for gradient
                                                //     ],
                                                //     begin: Alignment.topLeft, //begin of the gradient color
                                                //     end: Alignment.bottomRight, //end of the gradient color
                                                //     stops: [
                                                //       0.1,
                                                //       0.5,
                                                //     ] //stops for individual color
                                                //   //set the stops number equal to numbers of color
                                                // ),
                                                color: Colors.orangeAccent,
                                                boxShadow:  [
                                                  BoxShadow(
                                                    color: Colors.grey,
                                                    offset:const Offset(
                                                      5.0,
                                                      5.0,
                                                    ),
                                                    blurRadius: 10.0,
                                                    spreadRadius: 2.0,
                                                  ), //BoxShadow
                                                  BoxShadow(
                                                    color: Colors.grey,
                                                    offset:const Offset(5.0, 5.0),
                                                    blurRadius: 10.0,
                                                    spreadRadius: 2.0,
                                                  ), //BoxShadow
                                                ],
                                              ),
                                              child: GestureDetector(
                                                onTap: (){
                                                  bool isValid = itemCOntroller.validate();
                                                  if (isValid) {
                                                    Get.close(1);
                                                  }
                                                },
                                                child: Text("Add", style: TextStyle(
                                                    fontWeight: FontWeight.w500, fontSize: 20.0, color: Colors.black),),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                );

                                // Get.toNamed("/add_items");
                              },
                              icon: const Icon(
                                Icons.add_circle_outlined,
                                color: Colors.black,
                              ),
                              label: Text(
                                "Add",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 18.0,
                                    fontWeight: FontWeight.w700),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 20.0,
                        ),
                        Obx(() {
                          return Column(
                            children: [
                              if (itemCOntroller.itemsList.isNotEmpty)
                                Table(
                                  border: TableBorder.all(),
                                  children: [
                                    TableRow(
                                      children: <Widget>[
                                        TableCell(
                                          child: Container(
                                            padding: const EdgeInsets.all(8),
                                            child: const CustomText(
                                                text: AppStrings.ADD_ITEMS_NAME),
                                          ),
                                        ),
                                        TableCell(
                                          child: Container(
                                            padding: const EdgeInsets.all(8),
                                            child: const CustomText(
                                                text: "Price"),
                                          ),
                                        ),
                                        TableCell(
                                          child: Container(
                                            padding: const EdgeInsets.all(8),
                                            child: const CustomText(
                                                text:"Quantity"),
                                          ),
                                        ),
                                        TableCell(
                                          child: Container(
                                            padding: const EdgeInsets.all(8),
                                            child: const CustomText(
                                                text: "Total"),
                                          ),
                                        ),

                                      ],
                                    ),
                                    ...itemCOntroller.itemsList
                                        .map((itemx) => CustomTableRow(
                                      item: itemx,
                                    ))
                                        .toList(),
                                  ],
                                )
                              else
                                const Center(
                                  child: Text("You did not add any item yet!"),
                                ),
                              if (controller.itemsList.isNotEmpty)
                                SizedBox(
                                  height: Dimensions.calcH(25),
                                ),
                              if (controller.itemsList.isNotEmpty) const Divider(),
                              if (controller.itemsList.isNotEmpty)
                                Align(
                                   alignment: Alignment.topRight,

                                  child: Column(

                                    children: [
                                      Row(
                                        // crossAxisAlignment: CrossAxisAlignment.end,
                                        mainAxisAlignment: MainAxisAlignment.end,
                                        children: [
                                          Text(
                                            "Total : ",
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontWeight: FontWeight.w500,
                                                fontSize: 18.0),
                                          ),
                                          Text("${itemCOntroller.total.value.toStringAsFixed(2)}",style: TextStyle(
                                              color: Colors.black,
                                              fontWeight: FontWeight.w600,
                                              fontSize: 18.0),)
                                        ],
                                      ),
                                      SizedBox(height: 10.0,),
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.end,
                                        children: [
                                          Text(
                                            "Vat :  ",
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontWeight: FontWeight.normal,
                                                fontSize: 18.0),
                                          ),
                                          Text("2 %",style: TextStyle(
                                              color: Colors.black,
                                              fontWeight: FontWeight.normal,
                                              fontSize: 18.0),)
                                        ],
                                      ),
                                      SizedBox(height: 10.0,),
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.end,
                                        children: [
                                          Text(
                                            "Tax  :   ",
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontWeight: FontWeight.normal,
                                                fontSize: 18.0),
                                          ),
                                          Text('${ itemCOntroller.total.value* 0.02 }',style: TextStyle(
                                              color: Colors.black,
                                              fontWeight: FontWeight.normal,
                                              fontSize: 18.0),)
                                        ],
                                      ),
                                      SizedBox(height: 10.0,),
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.end,
                                        children: [
                                          Text(
                                            "final Price :   ",
                                            textAlign: TextAlign.center,

                                            style: TextStyle(
                                                color: Colors.black,
                                                fontWeight: FontWeight.w600,
                                                fontSize: 18.0),
                                          ),
                                          Text("${(itemCOntroller.total.value* 0.02+itemCOntroller.total.value).toStringAsFixed(2)}",style: TextStyle(
                                              color: Colors.black,
                                              fontWeight: FontWeight.w600,
                                              fontSize: 18.0),),
                                        ],
                                      ),

                                    ],
                                  ),
                                ),
                            ],
                          );
                        }),
                        SizedBox(
                          height: 20.0,
                        ),
                        Container(
                          child: Center(
                            child: Container(
                              alignment: Alignment.center,
                              height: 40.0,
                              width: 140.0,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(40.0),
                                // gradient: const LinearGradient(
                                //     colors: [
                                //       Colors.orange,
                                //       Colors.amber,
                                //
                                //       //add more colors for gradient
                                //     ],
                                //     begin: Alignment.topLeft, //begin of the gradient color
                                //     end: Alignment.bottomRight, //end of the gradient color
                                //     stops: [
                                //       0.1,
                                //       0.5,
                                //     ] //stops for individual color
                                //   //set the stops number equal to numbers of color
                                // ),
                                color: Colors.orangeAccent,
                                boxShadow:  [
                                  BoxShadow(
                                    color: Colors.grey,
                                    offset:const Offset(
                                      5.0,
                                      5.0,
                                    ),
                                    blurRadius: 10.0,
                                    spreadRadius: 2.0,
                                  ), //BoxShadow
                                  BoxShadow(
                                    color: Colors.grey,
                                    offset:const Offset(5.0, 5.0),
                                    blurRadius: 10.0,
                                    spreadRadius: 2.0,
                                  ), //BoxShadow
                                ],
                              ),
                              child: GestureDetector(
                                onTap: (){
                                  var tax=itemCOntroller.total.value* 0.02;
                                  print(tax);
                                      if (itemCOntroller.itemsList.isNotEmpty) {
                                    Invoice invoice =
                                    controller.generate_preview_invoice();
                                    // print(invoice.total);
                                    Get.toNamed("/preview",
                                        arguments: {"invoice": invoice});
                                  } else {
                                    Get.snackbar("Error",
                                        "Please enter all the required fields!",
                                        snackPosition: SnackPosition.BOTTOM);
                                  }
                                },
                                child: Text("Preview", style: TextStyle(
                                    fontWeight: FontWeight.w500, fontSize: 20.0, color: Colors.black),),
                              ),
                            ),
                          ),

                          // child: CustomBtn(
                          //   label: AppStrings.PREVIEW_BTN,
                          //   action: () {
                          //     if (
                          //         itemCOntroller.itemsList.isNotEmpty) {
                          //       Invoice invoice =
                          //           controller.generate_preview_invoice();
                          //       // print(invoice.total);
                          //       Get.toNamed("/preview",
                          //           arguments: {"invoice": invoice});
                          //     } else {
                          //       Get.snackbar("Error",
                          //           "Please enter all the required fields!",
                          //           snackPosition: SnackPosition.BOTTOM);
                          //     }
                          //   },
                          // ),
                        )
                      ],
                    ),
                  );
                }),
          ),
        ),
      ),
    );
  }
  TextStyle textStyle = TextStyle(
    color: Colors.black,
    fontSize: 14.0,
  );

  InputDecoration inputDecoration({required String hintText,required Icon icon}) {
    return InputDecoration(
      fillColor: Colors.grey.shade100,
      filled: true,
      hoverColor: Colors.white,
      focusColor: Colors.white,
      hintText: hintText,

      errorStyle: const TextStyle(
        color: Colors.red,
      ),

      border: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(15.0)),
        // borderSide: const BorderSide(
        //   color: Colors.white,
        // ),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(15.0)),
        // borderSide: const BorderSide(
        //   color: Colors.white,
        // ),
      ),
    );
  }
}


// class NewInvoiceScreen extends StatelessWidget {
//   const NewInvoiceScreen({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     final CustomerController customerController = Get.put(CustomerController());
//     final ItemsController itemCOntroller = Get.put(ItemsController());
//     final List<String> items1 = [
//       'items 1',
//       'items 2',
//       'items 3',
//       'items 4',
//       'items 5',
//     ];
//     final List<String> items = [
//       'customer 1',
//       'customer 2',
//       'customer 3',
//       'customer 4',
//       'customer 5',
//     ];
//     int? _volume=0;
//
//     return Scaffold(
//       backgroundColor: AppColors.kSecondaryColor,
//       appBar: AppBar_eng(
//         title: AppStrings.NEW_INVOICE_PAGE_TITLE,
//         actions: [
//           IconButton(
//             onPressed: () {
//               Get.back();
//             },
//             icon: SvgPicture.asset(
//               "assets/icons/circle_close.svg",
//               color: AppColors.kPrimaryDark,
//             ),
//           )
//         ],
//       ),
//       body: SafeArea(
//         child: NotificationListener<OverscrollIndicatorNotification>(
//           onNotification: (scroll) {
//             scroll.disallowIndicator();
//             return true;
//           },
//           child: SingleChildScrollView(
//             physics: const BouncingScrollPhysics(),
//             child: GetBuilder<InvoiceController>(
//                 init: InvoiceController(),
//                 builder: (controller) {
//                   if (controller.id == "0") {
//                     String id =
//                         DateTime.now().millisecondsSinceEpoch.toString();
//                     controller.id = id;
//                   } else {}
//
//                   return Container(
//                     padding: EdgeInsets.all(10.0),
//                     child: Column(
//                       children: [
//                         Text(
//                           "Select Custumer",
//                           style: TextStyle(
//                               color: Colors.black,
//                               fontSize: 20.0,
//                               fontWeight: FontWeight.w700),
//                         ),
//                         SizedBox(
//                           height: 20.0,
//                         ),
//                         Obx(
//                               () => Container(
//                             padding:
//                             const EdgeInsets.only(top: 8, left: 8, right: 8),
//                             color: Colors.white,
//                             width: double.maxFinite,
//                             height: 50.0,
//                             child: DropdownButton(
//                               isDense: true,
//                               isExpanded: true,
//                               elevation: 0,
//                               value: customerController.dropdownvalue.value,
//                               icon: const Icon(Icons.keyboard_arrow_down),
//                               items: items.map((String items) {
//                                 return DropdownMenuItem(
//                                   value: items,
//                                   child: Text(items),
//                                 );
//                               }).toList(),
//                               onChanged: (newValue) {
//                                 customerController.dropdownvalue.value =
//                                 newValue as String;
//                               },
//                             ),
//                           ),
//                         ),
//                         SizedBox(
//                           height: 20.0,
//                         ),
//                         Row(
//                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                           children: [
//                             Text(
//                               "Product Items",
//                               style: TextStyle(
//                                   color: Colors.black,
//                                   fontSize: 20.0,
//                                   fontWeight: FontWeight.w700),
//                             ),
//                             TextButton.icon(
//                               onPressed: () {
//                                   Get.defaultDialog(
//                                     title: AppStrings.ADD_ITEMS_DIALOG_TITLE,
//                                     content: Container(
//                                       height: 300.0,
//                                       child: SingleChildScrollView(
//                                         child: Column(
//                                           children: [
//                                             const Divider(),
//
//                                             SizedBox(
//                                               height: 20.0,
//                                             ),
//                                             Obx(
//                                                   () => SizedBox(
//                                                 height: 50.0,
//
//                                                 width: 250.0,
//                                                 child: Card(
//                                                   // elevation: 8,
//                                                   color: Colors.white,
//                                                   child: Padding(
//                                                     padding: const EdgeInsets.only(top: 8, left: 8, right: 8),
//                                                     child: DropdownButton(
//                                                       isDense: true,
//                                                       isExpanded: true,
//                                                       elevation: 0,
//                                                       value: itemCOntroller.itemdownvalue.value,
//                                                       icon: const Icon(Icons.keyboard_arrow_down),
//                                                       items: items1.map(
//                                                             (String items) {
//                                                           return DropdownMenuItem(
//                                                             value: items,
//                                                             child: Text(items),
//                                                           );
//                                                         },
//                                                       ).toList(),
//                                                       onChanged: (newValue) {
//                                                         itemCOntroller.itemdownvalue.value =
//                                                         newValue as String;
//                                                       },
//                                                     ),
//                                                   ),
//                                                 ),
//                                               ),
//                                             ),
//
//                                             Container(
//                                               padding: EdgeInsets.symmetric(horizontal: 10.0),
//                                               child: CustomInput_eng(
//                                                   label: AppStrings.ADD_ITEMS_PRICE,
//                                                   controller: itemCOntroller.itemPriceInputController,
//                                                   type: TextInputType.number),
//                                             ),
//                                             Container(
//                                               padding: EdgeInsets.symmetric(horizontal: 10.0),
//                                               child: CustomInput_eng(
//                                                 label: AppStrings.ADD_ITEMS_QTY,
//                                                 controller: itemCOntroller.itemQtyInputController,
//                                                 type: TextInputType.number,
//                                               ),
//                                             ),
//                                             Center(
//                                               child: Container(
//                                                 alignment: Alignment.center,
//                                                 height: 40.0,
//                                                 width: 140.0,
//                                                 decoration: BoxDecoration(
//                                                   borderRadius: BorderRadius.circular(50.0),
//                                                   gradient: const LinearGradient(
//                                                       colors: [
//                                                         Colors.orange,
//                                                         Colors.amber,
//
//                                                         //add more colors for gradient
//                                                       ],
//                                                       begin: Alignment.topLeft, //begin of the gradient color
//                                                       end: Alignment.bottomRight, //end of the gradient color
//                                                       stops: [
//                                                         0.1,
//                                                         0.5,
//                                                       ] //stops for individual color
//                                                     //set the stops number equal to numbers of color
//                                                   ),
//                                                   color: Colors.amber,
//                                                   boxShadow:  [
//                                                     BoxShadow(
//                                                       color: Colors.grey,
//                                                       offset:const Offset(
//                                                         5.0,
//                                                         5.0,
//                                                       ),
//                                                       blurRadius: 10.0,
//                                                       spreadRadius: 2.0,
//                                                     ), //BoxShadow
//                                                     BoxShadow(
//                                                       color: Colors.grey,
//                                                       offset:const Offset(5.0, 5.0),
//                                                       blurRadius: 10.0,
//                                                       spreadRadius: 2.0,
//                                                     ), //BoxShadow
//                                                   ],
//                                                 ),
//                                                 child: GestureDetector(
//                                                   onTap: (){
//                                                     bool isValid = itemCOntroller.validate();
//                                                     if (isValid) {
//                                                       Get.close(1);
//                                                     }
//                                                   },
//                                                   child: Text("Add", style: TextStyle(
//                                                       fontWeight: FontWeight.bold, fontSize: 20.0, color: Colors.white),),
//                                                 ),
//                                               ),
//                                             ),
//                                           ],
//                                         ),
//                                       ),
//                                     ),
//                                   );
//
//                                  // Get.toNamed("/add_items");
//
//                               },
//                               icon: const Icon(
//                                 Icons.add_circle_outlined,
//                                 color: Colors.black,
//                               ),
//                               label: Text(
//                                 "Add",
//                                 style: TextStyle(
//                                     color: Colors.black,
//                                     fontSize: 18.0,
//                                     fontWeight: FontWeight.w700),
//                               ),
//                             ),
//                           ],
//                         ),
//                         SizedBox(
//                           height: 20.0,
//                         ),
//                         Obx(() {
//                           return Column(
//                             children: [
//                               if (controller.itemsList.isNotEmpty)
//                                 Table(
//                                   border: TableBorder.all(),
//                                   children: [
//                                     TableRow(
//                                       children: <Widget>[
//                                         TableCell(
//                                           child: Container(
//                                             padding: const EdgeInsets.all(8),
//                                             child: const CustomText(
//                                                 text: AppStrings.ADD_ITEMS_NAME),
//                                           ),
//                                         ),
//                                         TableCell(
//                                           child: Container(
//                                             padding: const EdgeInsets.all(8),
//                                             child: const CustomText(
//                                                 text: "Price"),
//                                           ),
//                                         ),
//                                         TableCell(
//                                           child: Container(
//                                             padding: const EdgeInsets.all(8),
//                                             child: const CustomText(
//                                                 text:"Quantity"),
//                                           ),
//                                         ),
//                                         TableCell(
//                                           child: Container(
//                                             padding: const EdgeInsets.all(8),
//                                             child: const CustomText(
//                                                 text: "Total"),
//                                           ),
//                                         ),
//
//                                       ],
//                                     ),
//                                     ...itemCOntroller.itemsList
//                                         .map((itemx) => CustomTableRow(
//                                       item: itemx,
//                                     ))
//                                         .toList(),
//                                   ],
//                                 )
//                               else
//                                 const Center(
//                                   child: Text("You did not add any item yet!"),
//                                 ),
//                               if (controller.itemsList.isNotEmpty)
//                                 SizedBox(
//                                   height: Dimensions.calcH(25),
//                                 ),
//                               if (controller.itemsList.isNotEmpty) const Divider(),
//                               if (controller.itemsList.isNotEmpty)
//                                 Container(
//
//                                   color: Colors.purple,
//                                   alignment: Alignment.centerLeft,
//                                   child: Column(
//
//                                   children: [
//                                   Row(
//                                 // crossAxisAlignment: CrossAxisAlignment.end,
//                                 mainAxisAlignment: MainAxisAlignment.end,
//                                   children: [
//                                     Text(
//                                       "Total : ",
//                                       textAlign: TextAlign.center,
//                                       style: TextStyle(
//                                           color: Colors.black,
//                                           fontWeight: FontWeight.w600,
//                                           fontSize: 18.0),
//                                     ),
//                                     Text("${itemCOntroller.total.value.toStringAsFixed(2)}",style: TextStyle(
//                                         color: Colors.black,
//                                         fontWeight: FontWeight.w600,
//                                         fontSize: 18.0),)
//                                   ],
//                                   ),
//                               Row(
//                                   mainAxisAlignment: MainAxisAlignment.end,
//                                   children: [
//                                   Text(
//                                     "Vat :  ",
//                                     textAlign: TextAlign.center,
//                                     style: TextStyle(
//                                         color: Colors.black,
//                                         fontWeight: FontWeight.w600,
//                                         fontSize: 18.0),
//                                   ),
//                                   Text("2 %",style: TextStyle(
//                                       color: Colors.black,
//                                       fontWeight: FontWeight.w600,
//                                       fontSize: 18.0),)
//                                   ],
//                               ),
//                               Row(
//                                 mainAxisAlignment: MainAxisAlignment.end,
//                                   children: [
//                                   Text(
//                                     "Tax  :   ",
//                                     textAlign: TextAlign.center,
//                                     style: TextStyle(
//                                         color: Colors.black,
//                                         fontWeight: FontWeight.w600,
//                                         fontSize: 18.0),
//                                   ),
//                                   Text('${ itemCOntroller.total.value* 0.02 }',style: TextStyle(
//                                       color: Colors.black,
//                                       fontWeight: FontWeight.w600,
//                                       fontSize: 18.0),)
//                                   ],
//                               ),
//                               Row(
//                                 mainAxisAlignment: MainAxisAlignment.end,
//                                   children: [
//                                   Text(
//                                     "final Price :   ",
//                                     textAlign: TextAlign.center,
//
//                                     style: TextStyle(
//                                         color: Colors.black,
//                                         fontWeight: FontWeight.w600,
//                                         fontSize: 18.0),
//                                   ),
//                                   Text("${(itemCOntroller.total.value* 0.02+itemCOntroller.total.value).toStringAsFixed(2)}",style: TextStyle(
//                                       color: Colors.black,
//                                       fontWeight: FontWeight.w600,
//                                       fontSize: 18.0),),
//
//                                   ],
//                               ),
//
//                             ],
//                           ),
//                                 ),
//                             ],
//                           );
//                         }),
//                         SizedBox(
//                           height: 20.0,
//                         ),
//                         Container(
//                          child: Center(
//                             child: Container(
//                               alignment: Alignment.center,
//                               height: 40.0,
//                               width: 140.0,
//                               decoration: BoxDecoration(
//                                 borderRadius: BorderRadius.circular(50.0),
//                                 gradient: const LinearGradient(
//                                     colors: [
//                                       Colors.orange,
//                                       Colors.amber,
//
//                                       //add more colors for gradient
//                                     ],
//                                     begin: Alignment.topLeft, //begin of the gradient color
//                                     end: Alignment.bottomRight, //end of the gradient color
//                                     stops: [
//                                       0.1,
//                                       0.5,
//                                     ] //stops for individual color
//                                   //set the stops number equal to numbers of color
//                                 ),
//                                 color: Colors.amber,
//                                 boxShadow:  [
//                                   BoxShadow(
//                                     color: Colors.grey,
//                                     offset:const Offset(
//                                       5.0,
//                                       5.0,
//                                     ),
//                                     blurRadius: 10.0,
//                                     spreadRadius: 2.0,
//                                   ), //BoxShadow
//                                   BoxShadow(
//                                     color: Colors.grey,
//                                     offset:const Offset(5.0, 5.0),
//                                     blurRadius: 10.0,
//                                     spreadRadius: 2.0,
//                                   ), //BoxShadow
//                                 ],
//                               ),
//                               child: GestureDetector(
//                                 onTap: (){
//                                   if (itemCOntroller.itemsList.isNotEmpty) {
//                                         Invoice invoice =
//                                             InvoiceController().generate_preview_invoice();
//                                         // print(invoice.total);
//                                         Get.toNamed("/preview",
//                                             arguments: {"invoice": invoice});
//                                       } else {
//                                         Get.snackbar("Error",
//                                             "Please enter all the required fields!",
//                                             snackPosition: SnackPosition.BOTTOM);
//                                       }
//                                 },
//                                 child: Text("Preview", style: TextStyle(
//                                     fontWeight: FontWeight.bold, fontSize: 20.0, color: Colors.white),),
//                               ),
//                             ),
//                           ),
//
//                           // child: CustomBtn(
//                           //   label: AppStrings.PREVIEW_BTN,
//                           //   action: () {
//                           //     if (
//                           //         itemCOntroller.itemsList.isNotEmpty) {
//                           //       Invoice invoice =
//                           //           controller.generate_preview_invoice();
//                           //       // print(invoice.total);
//                           //       Get.toNamed("/preview",
//                           //           arguments: {"invoice": invoice});
//                           //     } else {
//                           //       Get.snackbar("Error",
//                           //           "Please enter all the required fields!",
//                           //           snackPosition: SnackPosition.BOTTOM);
//                           //     }
//                           //   },
//                           // ),
//                         )
//                       ],
//                     ),
//                   );
//                 }),
//           ),
//         ),
//       ),
//     );
//   }
// }
