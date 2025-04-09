import '../entities/entities.dart';

abstract interface class IGetProductRepository {
  Future<List<Product>> getProducts();
}
