import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../providers/product_provider.dart';

class ProductListPage extends StatelessWidget {
  const ProductListPage({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<ProductProvider>(context);
    return Scaffold(
      appBar: AppBar(title: const Text('Product List')),
      body: //show a list of products
          provider.isLoading
              ? const Center(child: CircularProgressIndicator())
              : provider.error != null
              ? Center(child: Text(provider.error!))
              : provider.products.isEmpty
              ? const Center(child: Text('No data'))
              : ListView.builder(
                itemCount: provider.products.length,
                itemBuilder: (context, index) {
                  final product = provider.products[index];

                  // Display product details thumbnail, title, price, brand

                  return Card(
                    child: ListTile(
                      leading: Image.network(product.thumbnail ?? ''),
                      title: Text(product.title ?? ''),
                      subtitle: Text('Price: \$${product.price}'),
                      trailing: Text('Brand: ${product.brand}'),
                      onTap: () {
                        // Handle product tap
                      },
                    ),
                  );
                },
              ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          provider.clearError();
          provider.fetchProducts();
        },
        child: const Icon(Icons.refresh),
      ),
    );
  }
}
