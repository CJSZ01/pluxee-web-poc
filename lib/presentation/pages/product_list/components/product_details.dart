import 'package:flutter/material.dart';
import 'package:pluxee_web_poc/domain/domain.dart';

class ProductDetails extends StatelessWidget {
  final Product product;
  final Function(Product product) onAddToCart;
  const ProductDetails({
    super.key,
    required this.product,
    required this.onAddToCart,
  });

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Container(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 200,
              width: 200,
              child: Image.network(product.thumbnail ?? '', fit: BoxFit.cover),
            ),
            const SizedBox(height: 8),
            Text(
              product.title ?? '',
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 4),
            Flexible(child: Text(product.description ?? '')),
            // const Spacer(),
            SizedBox(height: 16),
            Text(
              '\$${product.price}',
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                IconButton(
                  onPressed: () async {
                    await onAddToCart(product);
                    if (context.mounted) {
                      Navigator.pop(context);
                    }
                  },
                  icon: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(Icons.add_shopping_cart_rounded),
                      Text('Add to cart'),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
