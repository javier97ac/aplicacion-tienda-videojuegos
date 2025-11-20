import 'package:flutter/material.dart';
import '../utils/formatters.dart';
import '../models/product.dart';
import '../screens/product_detail_screen.dart';
import 'package:provider/provider.dart';
import '../providers/cart_provider.dart';

class ProductCard extends StatelessWidget {
  final Product product;
  const ProductCard({required this.product, super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Row(
          children: [
            Container(
              width: 64,
              height: 64,
              color: Colors.grey[300],
              child: (product.imageUrl == null) ? const Icon(Icons.videogame_asset) : Image.network(product.imageUrl!, fit: BoxFit.cover),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(product.title, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.black)),
                  const SizedBox(height: 6),
                  Text(formatCurrency(product.price), style: const TextStyle(color: Colors.black)),
                ],
              ),
            ),
            IconButton(
              icon: const Icon(Icons.info_outline, color: Colors.black),
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (_) => ProductDetailScreen(product: product)));
              },
            ),
            IconButton(
              icon: const Icon(Icons.add_shopping_cart, color: Colors.black),
              onPressed: () => Provider.of<CartProvider>(context, listen: false).add(product),
            ),
          ],
        ),
      ),
    );
  }
}
