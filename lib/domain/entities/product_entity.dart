// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'dimensions_entity.dart';
import 'meta_entity.dart';
import 'review_entity.dart';

class Product {
  final int id;
  final String? title;
  final String? description;
  final String? category;
  final double price;
  final double discountPercentage;
  final double rating;
  final int stock;
  final List<String> tags;
  final String? brand;
  final String? sku;
  final int weight;
  final Dimensions dimensions;
  final String? warrantyInformation;
  final String? shippingInformation;
  final String? availabilityStatus;
  final List<Review> reviews;
  final String? returnPolicy;
  final int minimumOrderQuantity;
  final Meta meta;
  final List<String> images;
  final String? thumbnail;

  Product({
    required this.id,
    this.title,
    this.description,
    this.category,
    required this.price,
    required this.discountPercentage,
    required this.rating,
    required this.stock,
    required this.tags,
    this.brand,
    this.sku,
    required this.weight,
    required this.dimensions,
    this.warrantyInformation,
    this.shippingInformation,
    this.availabilityStatus,
    required this.reviews,
    this.returnPolicy,
    required this.minimumOrderQuantity,
    required this.meta,
    required this.images,
    this.thumbnail,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'title': title,
      'description': description,
      'category': category,
      'price': price,
      'discountPercentage': discountPercentage,
      'rating': rating,
      'stock': stock,
      'tags': tags,
      'brand': brand,
      'sku': sku,
      'weight': weight,
      'dimensions': dimensions.toMap(),
      'warrantyInformation': warrantyInformation,
      'shippingInformation': shippingInformation,
      'availabilityStatus': availabilityStatus,
      'reviews': reviews.map((x) => x.toMap()).toList(),
      'returnPolicy': returnPolicy,
      'minimumOrderQuantity': minimumOrderQuantity,
      'meta': meta.toMap(),
      'images': images,
      'thumbnail': thumbnail,
    };
  }

  factory Product.fromMap(Map<String, dynamic> map) {
    return Product(
      id: map['id'] as int,
      title: map['title'] != null ? map['title'] as String : null,
      description:
          map['description'] != null ? map['description'] as String : null,
      category: map['category'] != null ? map['category'] as String : null,
      price: map['price'] as double,
      discountPercentage: map['discountPercentage'] as double,
      rating: map['rating'] as double,
      stock: map['stock'] as int,
      tags: List<String>.from((map['tags'] as List<dynamic>)),
      brand: map['brand'] != null ? map['brand'] as String : null,
      sku: map['sku'] != null ? map['sku'] as String : null,
      weight: map['weight'] as int,
      dimensions: Dimensions.fromMap(map['dimensions'] as Map<String, dynamic>),
      warrantyInformation:
          map['warrantyInformation'] != null
              ? map['warrantyInformation'] as String
              : null,
      shippingInformation:
          map['shippingInformation'] != null
              ? map['shippingInformation'] as String
              : null,
      availabilityStatus:
          map['availabilityStatus'] != null
              ? map['availabilityStatus'] as String
              : null,
      reviews: List<Review>.from(
        (map['reviews'] as List<dynamic>).map<Review>(
          (x) => Review.fromMap(x as Map<String, dynamic>),
        ),
      ),
      returnPolicy:
          map['returnPolicy'] != null ? map['returnPolicy'] as String : null,
      minimumOrderQuantity: map['minimumOrderQuantity'] as int,
      meta: Meta.fromMap(map['meta'] as Map<String, dynamic>),
      images: List<String>.from((map['images'] as List<dynamic>)),
      thumbnail: map['thumbnail'] != null ? map['thumbnail'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Product.fromJson(String source) =>
      Product.fromMap(json.decode(source) as Map<String, dynamic>);
}
