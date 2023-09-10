import 'package:json_annotation/json_annotation.dart';
part 'product_model.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class ProductModel {
  List<ProductItem> productItems;

  ProductModel({
    required this.productItems,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) => _$ProductModelFromJson(json);
}

@JsonSerializable(fieldRename: FieldRename.snake)
class ProductItem {
  int id;
  String name;
  String imageUrl;
  double price;
  bool isFavorite;
  int amount;

  ProductItem({
    required this.id,
    required this.name,
    required this.imageUrl,
    required this.price,
    required this.isFavorite,
    this.amount = 1,
  });

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'image_url': imageUrl,
      'price': price,
      'is_favorite': isFavorite,
      'amount': amount,
    };
  }

  factory ProductItem.fromJson(Map<String, dynamic> json) => _$ProductItemFromJson(json);
}
