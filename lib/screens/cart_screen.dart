import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../widgets/logo_widget.dart';
import '../providers/cart_provider.dart';
import '../utils/formatters.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Row(children: const [LogoWidget(size: 24), SizedBox(width: 8), Text('Carrito')])),
      body: Consumer<CartProvider>(builder: (context, cart, _) {
        final items = cart.items;
        if (items.isEmpty) return const Center(child: Text('Tu carrito está vacío'));
        return Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: items.length,
                itemBuilder: (context, index) {
                  final item = items[index];
                  return ListTile(
                    leading: Container(width: 48, height: 48, color: Colors.grey[300], child: const Icon(Icons.videogame_asset)),
                    title: Text(item.product.title, style: const TextStyle(color: Colors.black)),
                    subtitle: Text('Cantidad: ${item.qty}'),
                    trailing: IconButton(onPressed: () => cart.remove(item.product.id), icon: const Icon(Icons.delete)),
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Total: ${formatCurrency(cart.total)}', style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                  ElevatedButton(onPressed: () {}, style: ElevatedButton.styleFrom(backgroundColor: Colors.black), child: const Text('Pagar')),
                ],
              ),
            )
          ],
        );
      }),
    );
  }
}
