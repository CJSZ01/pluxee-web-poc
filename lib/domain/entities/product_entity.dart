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
}
