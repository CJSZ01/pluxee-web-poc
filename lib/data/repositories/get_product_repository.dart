import '../../domain/domain.dart';
import '../data.dart';

class GetProductRepository implements IGetProductRepository {
  final IGetProductDatasource datasource;

  GetProductRepository({required this.datasource});

  @override
  Future<List<Product>> getProducts() async {
    try {
      final productsData = await datasource.getProducts();
      return productsData.map((product) {
        return Product(
          id: product['id'],
          title: product['title'],
          description: product['description'],
          price: product['price'],
          category: product['category'],
          brand: product['brand'],
          rating: product['rating'],
          stock: product['stock'],
          discountPercentage: product['discountPercentage'],
          tags: List<String>.from(product['tags']),
          sku: product['sku'],
          weight: product['weight'],
          dimensions: Dimensions(
            height: product['dimensions']['height'],
            width: product['dimensions']['width'],
            depth: product['dimensions']['depth'],
            length: product['dimensions']['length'],
          ),
          warrantyInformation: product['warrantyInformation'],
          shippingInformation: '',
          availabilityStatus: '',
          reviews: [],
          returnPolicy: '',
          minimumOrderQuantity: product['minimumOrderQuantity'],
          meta: Meta(
            createdAt:
                DateTime.tryParse(product['meta']['createdAt']) ??
                DateTime.now(),
            updatedAt:
                DateTime.tryParse(product['meta']['updatedAt']) ??
                DateTime.now(),
            barcode: product['meta']['barcode'],
            qrCode: product['meta']['qrCode'],
          ),
          images: List<String>.from(product['images']),
          thumbnail: product['thumbnail'],
        );
      }).toList();
    } catch (e) {
      throw Exception('Error fetching products: $e');
    }
  }
}
