import '../domain.dart';

abstract class IGetProductUseCase {
  Future<List<Product>> getProducts();
}

class GetProductUseCase implements IGetProductUseCase {
  final IGetProductRepository repository;

  GetProductUseCase({required this.repository});

  @override
  Future<List<Product>> getProducts() async {
    try {
      return await repository.getProducts();
    } catch (e) {
      throw Exception('Error fetching products: $e');
    }
  }
}
