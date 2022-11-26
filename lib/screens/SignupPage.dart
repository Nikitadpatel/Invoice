import 'package:fatura_app/env/dimensions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'shared_widgets/custom_text.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({Key? key}) : super(key: key);

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  TextEditingController _email=TextEditingController();
  TextEditingController _pass=TextEditingController();
  TextEditingController _uaername=TextEditingController();
  TextEditingController _confirm=TextEditingController();
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
            image: AssetImage('assets/images/register.png'), fit: BoxFit.cover),
      ),
      child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
          ),
          backgroundColor: Colors.transparent,
          body: Stack(
              children: [
                Container(
                  padding: const EdgeInsets.only(left: 35, top: 80),
                  child: const Text(
                    "Create\nAccount",
                    style: TextStyle(color: Colors.white, fontSize: 33),
                  ),
                ),
                SizedBox(
                  height: Dimensions.calcH(5),
                ),
                SingleChildScrollView(
                  child:Container(
                    padding: EdgeInsets.only(
                        right: 35,
                        left: 35,
                        top: MediaQuery.of(context).size.height * 0.27),
                    child: Column(
                      children: [
                        TextFormField(
                          controller:_uaername,
                          style: textStyle,
                          obscureText: true,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Please enter UserName';
                            }
                            return null;
                          },
                          decoration: inputDecoration(
                              hintText: 'Username',
                              icon: Icon(Icons.person)
                          ),
                        ),
                        SizedBox(
                          height: Dimensions.calcH(15),
                        ),
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
                        TextFormField(
                          controller:_confirm,
                          style: textStyle,
                          obscureText: true,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Pleaser Re-enter your Password';
                            }
                            return null;
                          },
                          decoration: inputDecoration(
                              hintText: 'Confirm password',
                              icon: Icon(Icons.lock)
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
                                Get.offAndToNamed("/");

                              },
                              child: Text("Login", style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 20.0, color: Colors.white),),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: Dimensions.calcH(80.0),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            CustomText(
                              text: "Already an account?   ",
                              color: Colors.black,
                              weight: FontWeight.w500,
                              fontSize: Dimensions.calcH(15),
                            ),
                            GestureDetector(
                              onTap: (){
                                Get.offAndToNamed("/");
                              },
                              child:  CustomText(
                                text: "Sign in",
                                color: Colors.orangeAccent,
                                weight: FontWeight.bold,
                                fontSize: Dimensions.calcH(15),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                )

              ]
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
        borderRadius: BorderRadius.all(Radius.circular(12.0)),
        borderSide: const BorderSide(
          color: Colors.black,
        ),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(12.0)),
        borderSide: const BorderSide(
          color: Colors.black,
        ),
      ),
    );
  }
}
