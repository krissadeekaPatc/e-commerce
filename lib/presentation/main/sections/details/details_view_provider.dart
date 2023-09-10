import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:flutter/services.dart';
// ignore: depend_on_referenced_packages
import 'package:path_provider/path_provider.dart';
import 'package:flutter/material.dart';
import 'package:e_comerce/data/model/product_model.dart';

class DetailsViewProvier extends ChangeNotifier {
  ProductModel productModel = ProductModel(productItems: []);
  ProductItem? item;
  bool isLoading = false;
  int count = 1;
  initData({required int id}) async {
    isLoading = true;
    final directory = await getApplicationDocumentsDirectory();
    final file = File('${directory.path}/modified_data.json');
    try {
      final jsonString = await file.readAsString();
      final jsonData = json.decode(jsonString);
      productModel = ProductModel.fromJson(jsonData);
      item = productModel.productItems.where((element) => element.id == id).first;
      notifyListeners();
    } catch (e) {
      final String response =
          await rootBundle.loadString('assets/mock_up_data.json');
      final data = await json.decode(response);
      productModel = ProductModel.fromJson(data);
      item = productModel.productItems.where((element) => element.id == id).first;
      notifyListeners();
    }
    isLoading = false;
    notifyListeners();
  }

  setFavorites(int index) {
    item!.isFavorite = !item!.isFavorite;
    copyAndModifyJsonIsFav(
      isFavorite: item!.isFavorite,
      index: index,
    );
    notifyListeners();
  }

  Future<void> copyAndModifyJsonIsFav({
    required dynamic isFavorite,
    required int index,
  }) async {
    final directory = await getApplicationDocumentsDirectory();
    final file = File('${directory.path}/modified_data.json');
    String jsonString = '';
    dynamic jsonData;
    if (await file.exists()) {
      jsonString = await file.readAsString();
      jsonData = json.decode(jsonString);
      jsonData['product_items'][index]['is_favorite'] = isFavorite;
      final jsonStr = json.encode(jsonData);
      await file.writeAsString(jsonStr);
    } else {
      final assetBundle = rootBundle;
      jsonString = await assetBundle.loadString('assets/mock_up_data.json');
      jsonData = json.decode(jsonString);
      jsonData['product_items'][index]['is_favorite'] = isFavorite;
      final jsonStr = json.encode(jsonData);
      await file.writeAsString(jsonStr);
    }
  }

  Future<void> updateCart() async {
    final directory = await getApplicationDocumentsDirectory();
    final file = File('${directory.path}/Cart.json');
    List<ProductItem> cartItems = [];
    if (await file.exists()) {
      final jsonString = await file.readAsString();
      final jsonData = json.decode(jsonString);
      if (jsonData is List) {
        cartItems = jsonData.map((e) => ProductItem.fromJson(e)).toList();
      }
    }

    if (cartItems.where((e) => e.id == item!.id).toList().isEmpty) {
      cartItems.add(item!);
    } else {
      if (count > 1) {
        for (var i = 0; i < cartItems.length; i++) {
          cartItems.where((e) => e.id == item!.id).first.amount = count;
        }
      }
    }
    notifyListeners();


    final cartJson = cartItems.map((e) => e.toJson()).toList();
    try {
      await file.writeAsString(json.encode(cartJson));
      count++;
    } catch (e) {
      log('Error writing JSON data to file: $e');
    }
    notifyListeners();
  }
}
