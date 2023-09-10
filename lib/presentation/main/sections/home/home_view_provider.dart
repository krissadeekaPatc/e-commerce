import 'dart:convert';
import 'dart:io';
// ignore: depend_on_referenced_packages
import 'package:path_provider/path_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:e_comerce/data/model/product_model.dart';

class HomeViewProvider with ChangeNotifier {
  
  ProductModel productModel = ProductModel(productItems: []);
  bool isLoading = false;


  initData() async {
    isLoading = true;
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
    isLoading = false;
    notifyListeners();
  }

setFavorites(int index){
    productModel.productItems[index].isFavorite =  !productModel.productItems[index].isFavorite;
    copyAndModifyJsonIsFav(
      isFavorite: productModel.productItems[index].isFavorite,
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

}
