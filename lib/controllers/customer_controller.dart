import 'package:fatura_app/controllers/invoice_controller.dart';
import 'package:fatura_app/models/customer_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomerController extends GetxController {
  Customer? customer;
  final RxString dropdownvalue = 'customer 1'.obs;
  // validate input
  bool validate() {
      customer = Customer(
          name:dropdownvalue.value.toString(),
       );
      return true;
    }


  @override
  void onClose() {
    Get.find<InvoiceController>().setCustomer(customer!);
      super.onClose();
  }
}
