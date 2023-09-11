import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:e_comerce/data/model/product_model.dart';
// ignore: depend_on_referenced_packages
import 'package:path_provider/path_provider.dart';

class SavedViewProvider with ChangeNotifier {
  
  ProductModel productModel = ProductModel(productItems: []);
  List<ProductItem> list = [];
  bool isLoading = false;
  int currentIndex = 0;

  initData() async {
    isLoading = true;
    list = [];
    final directory = await getApplicationDocumentsDirectory();
    final file = File('${directory.path}/modified_data.json');
    try {
      final jsonString = await file.readAsString();
      final jsonData = json.decode(jsonString);
      productModel = ProductModel.fromJson(jsonData);
      notifyListeners();
    } catch (e) {
      final String response = await rootBundle.loadString('assets/mock_up_data.json');
      final data = await json.decode(response);
      productModel = ProductModel.fromJson(data);
      notifyListeners();
    }
    list.addAll(productModel.productItems.where((element) => element.isFavorite));
    isLoading = false;
    notifyListeners();
  }

  setCurrentIndex(int currentIndex){
    this.currentIndex = currentIndex;
    notifyListeners();
  }

  setFavorites(int index){
    list[index].isFavorite = false;
    copyAndModifyJsonIsFav(list[index].id);
    list.removeWhere((element) => element.id == list[index].id,);
    notifyListeners();
  }


Future<void> copyAndModifyJsonIsFav(int id) async {
    final directory = await getApplicationDocumentsDirectory();
    final file = File('${directory.path}/modified_data.json');
    String jsonString = '';
    dynamic jsonData;
    jsonString = await file.readAsString();
    jsonData = json.decode(jsonString);
    final product = ProductModel.fromJson(jsonData);
    product.productItems.where((e) => e.id == id).first.isFavorite = false;
    final jsonStr = json.encode(product.toJson());
    await file.writeAsString(jsonStr);
  }

}
