import 'package:flutter/material.dart';
import '../utils/formatters.dart';
import '../models/game.dart';
import 'package:provider/provider.dart';
import '../providers/cart_provider.dart';
import '../models/product.dart';

class GameDetailScreen extends StatelessWidget {
  final Game game;
  const GameDetailScreen({required this.game, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(game.title)),
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
                child: (game.imageUrl == null) ? const Icon(Icons.videogame_asset, size: 72) : Image.network(game.imageUrl!, fit: BoxFit.cover),
              ),
            ),
            const SizedBox(height: 16),
            Text(game.title, style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.black)),
            const SizedBox(height: 8),
            Text(formatCurrency(game.price), style: const TextStyle(fontSize: 18, color: Colors.black)),
            const SizedBox(height: 16),
            const Text('Descripción de ejemplo. Aquí puedes agregar detalles del juego, reseñas o capturas.'),
            const Spacer(),
            ElevatedButton.icon(
              onPressed: () {
                final product = Product(id: game.id, title: game.title, price: game.price, imageUrl: game.imageUrl, type: ProductType.game);
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
