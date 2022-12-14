// ignore_for_file: camel_case_types

import 'package:fatura_app/constants/colors.dart';
import 'package:fatura_app/env/dimensions.dart';
import 'package:fatura_app/screens/shared_widgets/custom_richText.dart';
import 'package:flutter/material.dart';

class CustomInput_eng extends StatelessWidget {
  final TextEditingController? controller;
  final TextInputType? type;
  final String label;
  final bool isRequired;
  final double? height;
  const CustomInput_eng({
    required this.label,
    required this.controller,
    this.type,
    this.height,
    this.isRequired = false,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
        vertical: Dimensions.calcH(15),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomRichText(
            text: label,
            children: (isRequired)
                ? [
                    const TextSpan(
                      text: " *",
                      style: TextStyle(
                        color: Colors.red,
                      ),
                    ),
                  ]
                : [],
          ),
          SizedBox(
            height: Dimensions.calcH(8),
          ),
          Container(
            // height: 40.0,
            width: MediaQuery.of(context).size.width,
            margin: EdgeInsets.only(
              right: Dimensions.calcW(10.0),
            ),
            decoration: BoxDecoration(
                color: AppColors.kSecondaryColor,
                borderRadius:BorderRadius.circular(20.0) ),
            child: TextFormField(
              controller: controller,
              keyboardType: type,
              decoration: InputDecoration(
                border: InputBorder.none,
                fillColor: Colors.grey.shade100,
                filled: true,
              ),
            ),
          )
        ],
      ),
    );
  }
}
