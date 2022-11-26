import 'package:fatura_app/constants/colors.dart';
import 'package:fatura_app/constants/strings.dart';
import 'package:fatura_app/env/dimensions.dart';
import 'package:fatura_app/screens/SignupPage.dart';
import 'package:fatura_app/screens/home_screen/home_screen.dart';

import 'package:fatura_app/screens/shared_widgets/custom_btn.dart';
import 'package:fatura_app/screens/shared_widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  TextEditingController _email=TextEditingController();
  TextEditingController _pass=TextEditingController();
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
            image: AssetImage('assets/images/login.png'), fit: BoxFit.cover),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Stack(
          children: [
            Container(
              padding: const EdgeInsets.only(left: 55.0, top: 120.0),
              child: const Text(
                "Welcome\nBack",
                style: TextStyle(color: Colors.white, fontSize: 33),
              ),
            ),
            Form(
              key: _formKey,
              child:SingleChildScrollView(
                child: Container(
                  padding: EdgeInsets.only(
                      right: 25,
                      left: 25,
                      top: MediaQuery.of(context).size.height * 0.5),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextFormField(

                        controller: _email,
                        style: textStyle,
                        validator: (value) {
                          String p = "[a-zA-Z0-9\+\.\_\%\-\+]{1,256}" +
                              "\\@" +
                              "[a-zA-Z0-9][a-zA-Z0-9\\-]{0,64}" +
                              "(" +
                              "\\." +
                              "[a-zA-Z0-9][a-zA-Z0-9\\-]{0,25}" +
                              ")+";
                          //Convert string p to a RegEx
                          RegExp regExp = RegExp(p);
                          if (value!.isEmpty) {
                            return 'Please enter Your Email';
                          } else {
                            //If email address matches pattern
                            if (regExp.hasMatch(value)) {
                              return null;
                            } else {
                              //If it doesn't match
                              return 'Email is not valid';
                            }
                          }
                        },
                        decoration: inputDecoration(hintText: 'Email',icon: Icon(Icons.email)),
                      ),
                      SizedBox(
                        height: Dimensions.calcH(15),
                      ),
                      TextFormField(
                        controller:_pass,
                        style: textStyle,
                        obscureText: true,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please enter your Password';
                          }
                          return null;
                        },
                        decoration: inputDecoration(
                            hintText: 'Password',
                            icon: Icon(Icons.lock)
                        ),
                      ),
                      SizedBox(
                        height: Dimensions.calcH(15),
                      ),
                      GestureDetector(
                        onTap: (){
                          Get.to(const SignupPage());
                        },
                        child:  Text(
                          "Forgot Password?",style: TextStyle(
                          decoration: TextDecoration.underline,
                          color: Colors.grey,
                          fontWeight: FontWeight.bold,
                          fontSize: Dimensions.calcH(15),)
                        ),
                      ),
                      SizedBox(
                        height: Dimensions.calcH(15),
                      ),
                      Center(
                        child: Container(
                          alignment: Alignment.center,
                          height: 50.0,
                          width: 140.0,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50.0),
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
                              Get.offAndToNamed("/home");
                            },
                            child: Text("Login", style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 20.0, color: Colors.white),),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: Dimensions.calcH(125.0),
                      ),

                  Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CustomText(
                          text: "Don't Have an account?    ",
                          color: Colors.grey,
                          weight: FontWeight.w500,
                          fontSize: Dimensions.calcH(15),
                        ),
                        GestureDetector(
                          onTap: (){
                            Get.to(const SignupPage());
                          },
                          child: Text(
                             "Sign up",style: TextStyle(
                            decoration: TextDecoration.underline,
                            color: Colors.orangeAccent,
                            fontWeight: FontWeight.bold,
                            fontSize: Dimensions.calcH(15),)
                          ),
                        ),
                      ],
                    )
                    ],
                  ),
                ),
              )






                    // SizedBox(
                    //   height: Dimensions.calcH(300.0),
                    // ),
                    // Row(
                    //   mainAxisAlignment: MainAxisAlignment.center,
                    //   children: [
                    //     CustomText(
                    //       text: "Don't Have an account?",
                    //       color: Colors.black,
                    //       weight: FontWeight.bold,
                    //       fontSize: Dimensions.calcH(15),
                    //     ),
                    //     GestureDetector(
                    //       onTap: (){
                    //         Get.to(const SignupPage());
                    //       },
                    //       child:  CustomText(
                    //         text: "Sign up",
                    //         color: Colors.orangeAccent,
                    //         weight: FontWeight.bold,
                    //         fontSize: Dimensions.calcH(15),
                    //       ),
                    //     ),
                    //   ],
                    // )


            ),
          ],

        )
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

      errorStyle: const TextStyle(
        color: Colors.red,
      ),
      hintText: hintText,
      hintStyle: textStyle,
      prefixIcon: icon,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(20.0)),
        borderSide: const BorderSide(
          color: Colors.black,
        ),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(20.0)),
        borderSide: const BorderSide(
          color: Colors.black,
        ),
      ),
    );
  }
}

