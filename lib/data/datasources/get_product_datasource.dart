import 'package:dio/dio.dart';

abstract interface class IGetProductDatasource {
  Future<List<Map<String, dynamic>>> getProducts();
}

class GetProductDatasource implements IGetProductDatasource {
  final Dio dio;
  GetProductDatasource(this.dio);

  @override
  Future<List<Map<String, dynamic>>> getProducts() async {
    try {
      final response = await dio.get('https://dummyjson.com/products');
      if (response.statusCode == 200) {
        final data = response.data['products'] as List;
        return data.map((product) => product as Map<String, dynamic>).toList();
      } else {
        throw Exception('Failed to load products');
      }
    } catch (e) {
      throw Exception('Error fetching products: $e');
    }
  }
}
