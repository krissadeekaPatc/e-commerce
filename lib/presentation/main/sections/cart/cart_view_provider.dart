import 'dart:convert';
import 'dart:developer';
import 'dart:io';
// ignore: depend_on_referenced_packages
import 'package:path_provider/path_provider.dart';
import 'package:flutter/material.dart';
import 'package:e_comerce/data/model/product_model.dart';

enum Mode {
  increase,
  decrease,
}

class CartProvider extends ChangeNotifier {

  List<ProductItem> carts = [];
  double totalPrice = 0.0;

  initData() async {
    carts = await readCartItems();
    calculation();
    notifyListeners();
  }

  Future<List<ProductItem>> readCartItems() async {
  final directory = await getApplicationDocumentsDirectory();
  final file = File('${directory.path}/Cart.json');

  if (await file.exists()) {
    try {
      final jsonString = await file.readAsString();
      final jsonData = json.decode(jsonString);

      if (jsonData is List) {
        // Convert the JSON data to a list of CartItem objects
        final cartItems = jsonData.map((item) => ProductItem.fromJson(item)).toList();
        return cartItems;
      }
    } catch (e) {
      log('Error reading JSON data from file: $e');
    }
  }

  // Return an empty list if the file does not exist or cannot be parsed
  return [];
}

  calculation() {
    if (carts.isEmpty) {
      totalPrice = 0;
      return;
    }
    List temp =[];
    for (var i = 0; i < carts.length; i++) {
      temp.add(carts[i].price * carts[i].amount);
    }
    totalPrice = temp.reduce((value, element) => value + element);
    notifyListeners();
  }

  void removeFromCart(ProductItem item) async{
     final directory = await getApplicationDocumentsDirectory();
    final file = File('${directory.path}/Cart.json');
    carts.remove(item);  
    calculation();
    final cartJson = carts.map((e) => e.toJson()).toList();
    try {
      await file.writeAsString(json.encode(cartJson));
      // log("${mode} ${cartJson} ");
    } catch (e) {
      log('Error writing JSON data to file: $e');
    }
    notifyListeners();
  }

  Future<void> updateCart(int index,{required Mode mode}) async {
    final directory = await getApplicationDocumentsDirectory();
    final file = File('${directory.path}/Cart.json');
    if (mode == Mode.increase) {
      carts[index].amount++;
    } else {
      if (carts[index].amount > 1) {
        carts[index].amount--;
      }
    }   
    calculation();
    final cartJson = carts.map((e) => e.toJson()).toList();
    try {
      await file.writeAsString(json.encode(cartJson));
      // log("${mode} ${cartJson} ");
    } catch (e) {
      log('Error writing JSON data to file: $e');
    }
    notifyListeners();
  }

}
