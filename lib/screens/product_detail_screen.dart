import 'package:flutter/material.dart';
import '../utils/formatters.dart';
import '../models/product.dart';
import 'package:provider/provider.dart';
import '../providers/cart_provider.dart';
import '../widgets/logo_widget.dart';

class ProductDetailScreen extends StatelessWidget {
  final Product product;
  const ProductDetailScreen({required this.product, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(children: [const LogoWidget(size: 24), const SizedBox(width: 8), Text(product.title)]),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Container(
                width: 200,
                height: 200,
                color: Colors.grey[300],
                child: (product.imageUrl == null) ? const Icon(Icons.videogame_asset, size: 72) : Image.network(product.imageUrl!, fit: BoxFit.cover),
              ),
            ),
            const SizedBox(height: 16),
            Text(product.title, style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.black)),
            const SizedBox(height: 8),
            Text(formatCurrency(product.price), style: const TextStyle(fontSize: 18, color: Colors.black)),
            const SizedBox(height: 16),
            const Text('Producto en venta.'),
            const Spacer(),
            ElevatedButton.icon(
              onPressed: () {
                Provider.of<CartProvider>(context, listen: false).add(product);
                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Añadido al carrito')));
              },
              icon: const Icon(Icons.add_shopping_cart),
              label: const Text('Añadir al carrito'),
              style: ElevatedButton.styleFrom(backgroundColor: Colors.black),
            ),
          ],
        ),
      ),
      backgroundColor: Colors.white,
    );
  }
}
