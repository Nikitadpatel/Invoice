import 'package:fatura_app/constants/colors.dart';
import 'package:fatura_app/constants/pdf_ai1.dart';
import 'package:fatura_app/env/dimensions.dart';
import 'package:fatura_app/screens/home_screen/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class view1 extends StatefulWidget {
  const view1({Key? key}) : super(key: key);

  @override
  State<view1> createState() => _view1State();
}

class _view1State extends State<view1> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Stack(
        children: [
          Container(
            height:MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            color: Colors.grey.shade400,
          ),
          Positioned(
            top: 0.0,
            child: Container(
              color: Colors.orangeAccent,
              height: 250.0,
              width: MediaQuery.of(context).size.width,
              child: Column(
                children: [
                  SizedBox(height: 10.0,),
                  Row(
                    children: [
                      IconButton(onPressed: (){
                        Navigator.of(context).push(MaterialPageRoute(builder: (context)=>HomeScreen()));
                      },
                      icon: Icon(Icons.arrow_back),),
                      Text("Invoice Summary",style: TextStyle(fontWeight: FontWeight.bold,
                      fontSize: 20.0),),
                    ],
                  ),
                  SizedBox(height: 20.0,),
                  Text("Invoice Total"),
                  Text("\u{20B9}1224",style: TextStyle(fontWeight: FontWeight.bold,
                      fontSize: 20.0)),
                  SizedBox(height: 20.0,),
                  Divider(color: Colors.black,),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Date"),
                        Text("25/11/2020")
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            left: 8.0,
              right: 8.0,
              top:200.0,
              child:Container(
                width: MediaQuery.of(context).size.width,
                child: Column(
                children: [
                  Container(
                    padding: EdgeInsets.all(10.0),
                    height:120.0,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10.0)
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("CUSTOMER PROFILE",style: TextStyle(fontSize: 15.0,color: Colors.grey),),
                        SizedBox(height: 10.0,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Name"),
                            Text("Ella Deeo")
                          ],
                        ),
                        SizedBox(height: 10.0,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Phone"),
                            Text("1234567890")
                          ],
                        ),
                        SizedBox(height: 10.0,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Email"),
                            Text("abcd@gmail.com")
                          ],
                        )
                      ],
                    ),
                  ),
                  SizedBox(height: 10.0),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    padding: EdgeInsets.all(10.0),
                    height:80.0,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10.0)
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("CUSTOMER Address",style: TextStyle(fontSize: 15.0,color: Colors.grey),),
                        SizedBox(height:10.0),
                       Text("10,xyz building,Surat,Gujarat")
                      ],
                    ),
                  ),
                  SizedBox(height: 10.0,),
                  Container(
                    padding: EdgeInsets.all(10.0),
                    height: 180.0,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10.0)
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("ITEMS",style: TextStyle(fontSize: 15.0,color: Colors.grey),),
                        // SizedBox(height: 10.0,),
                        SingleChildScrollView(
                          child: Container(
                            height: 140.0,

                            width: MediaQuery.of(context).size.width,
                            child: ListView(
                              padding: const EdgeInsets.all(0),
                              children: [
                                Card(
                                  child: ListTile(
                                    title: Text("product1"),
                                    subtitle: Text("2*100"),
                                    trailing: Text("\u{20B9}200"),
                                  ),
                                ),
                                Card(
                                  child: ListTile(
                                    title: Text("product2"),
                                    subtitle: Text("3*100"),
                                    trailing: Text("\u{20B9}300"),
                                  ),
                                ),
                                Card(
                                  child: ListTile(
                                    title: Text("product3"),
                                    subtitle: Text("5*100"),
                                    trailing: Text("\u{20B9}500"),
                                  ),
                                ),
                                Card(
                                  child: ListTile(
                                    title: Text("product4"),
                                    subtitle: Text("2*100"),
                                    trailing: Text("\u{20B9}200"),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(height: 10.0,),
                  Container(
                    padding: EdgeInsets.all(10.0),
                    height:100.0,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10.0)
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [

                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Sub Total",style: TextStyle(color: Colors.grey),),
                            Text("\u{20B9}1200",style: TextStyle(color: Colors.grey))
                          ],
                        ),
                        SizedBox(height: 10.0,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Tax(2%)",style: TextStyle(color: Colors.grey)),
                            Text("\u{20B9}24",style: TextStyle(color: Colors.grey))
                          ],
                        ),
                        SizedBox(height: 10.0,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Total Amount Due",style: TextStyle(color: Colors.black,fontSize: 18.0,fontWeight: FontWeight.bold)),
                            Text("\u{20B9}1224",style: TextStyle(color: Colors.black,fontSize: 18.0,fontWeight: FontWeight.bold))
                          ],
                        )
                      ],
                    ),
                  ),
                  ],
                ),
              )
          )

        ],
      )

    );





    //   Container(
    //   child: Row(
    //     children: [
    //       Container(width: 100.0,
    //       color: Colors.black,),
    //       Container(width:400.0),
    //       Scaffold(
    //         appBar: AppBar(
    //           leading: const BackButton(
    //             color: Colors.black, // <-- SEE HERE
    //           ),
    //           backgroundColor: Colors.orangeAccent,
    //           title: Text("Preview",style: TextStyle(color: Colors.black),),
    //         ),
    //           body: Container(
    //             padding: EdgeInsets.all(10.0),
    //             child: Column(
    //               crossAxisAlignment: CrossAxisAlignment.start,
    //               children: [
    //                 Center(child: Image.asset("assets/images/logo.png",height: 50.0,width: 100.0,fit:BoxFit.contain,)),
    //
    //
    //                 Container(
    //                   color: Colors.grey.shade400,
    //                   height: 30.0,
    //                   child: Row(
    //                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //                     children: [
    //                       Text("Invoice : 001",style: TextStyle(fontWeight: FontWeight.w500),),
    //                       Text("Date : 22/11/2022",style: TextStyle(fontWeight: FontWeight.w500))
    //                     ],
    //                   ),
    //                 ),
    //                 SizedBox(height: 10.0),
    //                 Text("Bill to"),
    //
    //                 Text(
    //                   'Name : twre patel',
    //                   style: TextStyle(
    //                     fontSize: 15,
    //                     fontWeight: FontWeight.normal,
    //                   ),
    //                 ),
    //                 SizedBox(height: 5.0),
    //                 Text(
    //                   'Phone : 123456789',
    //                   style: TextStyle(
    //                     fontSize: 15.0,
    //                     fontWeight: FontWeight.normal,
    //                   ),
    //                 ),
    //                 SizedBox(height: 5.0),
    //
    //                 Text(
    //                   "Email : 123@gmail.com",
    //                   style: TextStyle(
    //                     fontSize: 15.0,
    //                     fontWeight: FontWeight.normal,
    //                   ),
    //                 ),
    //                 SizedBox(height: 5.0),
    //                 Divider(),
    //                 SizedBox(height: 5.0),
    //                 Text(
    //                   'Invoice Details',
    //                   style: TextStyle(
    //                     fontSize: 15.5,
    //                     fontWeight: FontWeight.bold,
    //                   ),
    //                 ),
    //                 SizedBox(height: 10.0),
    //                 Table(
    //                   border: TableBorder.all(color: Colors.black),
    //                   children: [
    //                     TableRow(children: [
    //                       Container(
    //                           color: Colors.grey.shade400,
    //                           alignment: Alignment.center,
    //                           child: Text('Name',style: TextStyle(fontSize: 18.0),)),
    //                       Container(
    //                           color: Colors.grey.shade400,
    //                           alignment: Alignment.center,
    //                           child: Text('Price',style: TextStyle(fontSize: 18.0),)),
    //                       Container(
    //                           color: Colors.grey.shade400,
    //                           alignment: Alignment.center,
    //                           child: Text('Quantity',style: TextStyle(fontSize: 18.0),)),
    //                       Container(
    //                           color: Colors.grey.shade400,
    //                           alignment: Alignment.center,
    //                           child: Text('total',style: TextStyle(fontSize: 18.0),)),
    //                     ]),
    //                     TableRow(children: [
    //                       Center(child: Text('xyz',style: TextStyle(fontSize: 15.0),)),
    //                       Center(child: Text('\u{20B9}100',style: TextStyle(fontSize: 15.0))),
    //                       Center(child: Text('2',style: TextStyle(fontSize: 15.0))),
    //                       Center(child: Text('\u{20B9}200',style: TextStyle(fontSize: 15.0))),
    //                     ]),
    //                     TableRow(children: [
    //                       Center(child: Text('pqr',style: TextStyle(fontSize: 15.0))),
    //                       Center(child: Text('\u{20B9}100',style: TextStyle(fontSize: 15.0))),
    //                       Center(child: Text('3',style: TextStyle(fontSize: 15.0))),
    //                       Center(child: Text('\u{20B9}300',style: TextStyle(fontSize: 15.0))),
    //                     ]),
    //                     TableRow(children: [
    //                       Center(child: Text('abc',style: TextStyle(fontSize: 15.0))),
    //                       Center(child: Text('\u{20B9}100',style: TextStyle(fontSize: 15.0))),
    //                       Center(child: Text('5',style: TextStyle(fontSize: 15.0))),
    //                       Center(child: Text('\u{20B9}500',style: TextStyle(fontSize: 15.0))),
    //                     ])
    //                   ],
    //                 ),
    //                 SizedBox(height: 20.0,),
    //                 Align(
    //                   alignment: Alignment.topRight ,
    //                   child: Container(
    //                    width: 180.0,
    //                     decoration: BoxDecoration(
    //                       // color: Colors.grey.shade200,
    //                       borderRadius: BorderRadius.circular(15.0),
    //                     ),
    //
    //                     alignment: Alignment.center,
    //
    //
    //
    //                     child: Table(
    //                       children: [
    //                         TableRow(
    //                           children: [
    //                             Text("Total : "),
    //                             Text("\u{20B9}1000")
    //                           ]
    //                         ),
    //                         TableRow(
    //                             children: [
    //                               Text("VAT : "),
    //                               Text("2%")
    //                             ]
    //                         ),
    //                         TableRow(
    //                             children: [
    //                               Text("Tax : "),
    //                               Text("\u{20B9}20")
    //                             ]
    //                         ),
    //                         TableRow(
    //                             children: [
    //                               Container(
    //                                 color:Colors.grey.shade400,
    //                                   child: Text("Grand Total:")),
    //                               Container(
    //                                   color:Colors.grey.shade400,
    //                                   child: Text("\u{20B9}1020 "))
    //                             ]
    //                         ),
    //
    //                       ],
    //                     ),
    //                   ),
    //                 ),
    //
    //                 ///
    //                 /// PDF Table Create
    //                 ///
    //               ],
    //             ),
    //           )
    //
    //
    //       ),
    //     ],
    //   ),
    // );
  }
}
