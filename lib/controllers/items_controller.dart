// ignore_for_file: non_constant_identifier_names

import 'package:fatura_app/controllers/invoice_controller.dart';
import 'package:fatura_app/models/item_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ItemsController extends GetxController {
  final RxList<Item> _itemsList = Get.find<InvoiceController>().itemsList;
  final RxDouble _total = 0.00.obs;
  TextEditingController itemNameInputController = TextEditingController();
  TextEditingController itemPriceInputController = TextEditingController();
  TextEditingController itemQtyInputController = TextEditingController();
  final RxString itemdownvalue = 'items 1'.obs;


  get itemsList => _itemsList;
  get total => _total;
  // validate form;

  bool validate() {
    if (
    itemPriceInputController.text.isEmpty ||
        itemQtyInputController.text.isEmpty) {
      Get.snackbar(
        "Error",
        "Please Fill all the required fields",
        snackPosition: SnackPosition.BOTTOM,
      );
      return false;
    } else if (!itemPriceInputController.text.isNum ||
        !itemQtyInputController.text.isNum) {
      Get.snackbar(
        "Error",
        "Item Price/Qty can only be a number",
        snackPosition: SnackPosition.BOTTOM,
      );
      return false;
    } else {
      add_item(
        item_name: itemdownvalue.value,
        item_price: double.parse(itemPriceInputController.text),
        item_qty: int.parse(itemQtyInputController.text),
          item_total: double.parse(itemPriceInputController.text)*int.parse(itemQtyInputController.text)
      );

      itemPriceInputController.clear();
      itemQtyInputController.clear();
      update();

      return true;
    }
  }

  // add new item
  void add_item(
      {required String item_name,
      required double item_price,
      required int item_qty,
      required double item_total}) {
    _itemsList.add(
      Item(
        name: item_name,
        price: item_price,
        qty: item_qty,
          totalline:item_total
      ),
    );
    update();

    calcTotal();
  }

  // void remove_item({required Item item}) {
  //   _itemsList.remove(item);
  //   update();
  //   calcTotal();
  // }
  //
  void clear_items() {
    _itemsList.clear();
    print("hiiii");
    print(_itemsList);
    update();
    calcTotal();
  }

  void calcTotal() => _total.value = _itemsList.fold(
      0, (previousValue, next) => (previousValue + (next.price * next.qty)));
}
