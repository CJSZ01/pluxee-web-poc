import '../domain.dart';

abstract class IGetProductUseCase {
  Future<List<Product>> call();
}

class GetProductUseCase implements IGetProductUseCase {
  final IGetProductRepository repository;

  GetProductUseCase({required this.repository});

  @override
  Future<List<Product>> call() async {
    try {
      return await repository.getProducts();
    } catch (e) {
      throw Exception('Error fetching products: $e');
    }
  }
}
