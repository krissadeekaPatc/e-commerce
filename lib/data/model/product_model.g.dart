// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProductModel _$ProductModelFromJson(Map<String, dynamic> json) => ProductModel(
      productItems: (json['product_items'] as List<dynamic>)
          .map((e) => ProductItem.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ProductModelToJson(ProductModel instance) =>
    <String, dynamic>{
      'product_items': instance.productItems,
    };

ProductItem _$ProductItemFromJson(Map<String, dynamic> json) => ProductItem(
      id: json['id'] as int,
      name: json['name'] as String,
      imageUrl: json['image_url'] as String,
      price: (json['price'] as num).toDouble(),
      isFavorite: json['is_favorite'] as bool,
      amount: json['amount'] as int? ?? 1,
    );

Map<String, dynamic> _$ProductItemToJson(ProductItem instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'image_url': instance.imageUrl,
      'price': instance.price,
      'is_favorite': instance.isFavorite,
      'amount': instance.amount,
    };
