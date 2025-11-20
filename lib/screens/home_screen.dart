import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/product_provider.dart';
import '../providers/auth_provider.dart';
import '../providers/cart_provider.dart';
import '../widgets/logo_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<ProductProvider>(context, listen: false).fetchProducts();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: const [
            LogoWidget(size: 28),
            SizedBox(width: 8),
            Text('Good Games'),
          ],
        ),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: const BoxDecoration(color: Colors.white),
              child: Row(
                children: [
                  const LogoWidget(size: 36),
                  const SizedBox(width: 12),
                  Column(crossAxisAlignment: CrossAxisAlignment.start, mainAxisAlignment: MainAxisAlignment.center, children: [
                    const Text('Good Games', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.black)),
                    const SizedBox(height: 6),
                    Consumer<AuthProvider>(builder: (context, auth, _) => Text('Usuario: ${auth.user ?? '-'}', style: const TextStyle(color: Colors.black)))
                  ]),
                ],
              ),
            ),
            ListTile(
              leading: const Icon(Icons.videogame_asset, color: Colors.black),
              title: const Text('Juegos', style: TextStyle(color: Colors.black)),
              onTap: () {
                Navigator.of(context).pop(); // close drawer
                Navigator.pushNamed(context, '/games');
              },
            ),
            ListTile(
              leading: const Icon(Icons.sports_esports, color: Colors.black),
              title: const Text('Consolas', style: TextStyle(color: Colors.black)),
              onTap: () {
                Navigator.of(context).pop();
                Navigator.pushNamed(context, '/consoles');
              },
            ),
            ListTile(
              leading: const Icon(Icons.shopping_cart, color: Colors.black),
              title: const Text('Carrito', style: TextStyle(color: Colors.black)),
              onTap: () {
                Navigator.of(context).pop();
                Navigator.pushNamed(context, '/cart');
              },
            ),
            ListTile(
              leading: const Icon(Icons.article, color: Colors.black),
              title: const Text('Noticias', style: TextStyle(color: Colors.black)),
              onTap: () {
                Navigator.of(context).pop();
                Navigator.pushNamed(context, '/news');
              },
            ),
            ListTile(
              leading: const Icon(Icons.settings, color: Colors.black),
              title: const Text('Ajustes', style: TextStyle(color: Colors.black)),
              onTap: () {
                Navigator.of(context).pop();
                Navigator.pushNamed(context, '/settings');
              },
            ),
          ],
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Bienvenido a Good Games', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.black)),
            const SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton.icon(onPressed: () => Navigator.pushNamed(context, '/games'), icon: const Icon(Icons.videogame_asset), label: const Text('Juegos'), style: ElevatedButton.styleFrom(backgroundColor: Colors.black)),
                  ElevatedButton.icon(onPressed: () => Navigator.pushNamed(context, '/consoles'), icon: const Icon(Icons.sports_esports), label: const Text('Consolas'), style: ElevatedButton.styleFrom(backgroundColor: Colors.black)),
                ],
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: Consumer<CartProvider>(builder: (context, cart, _) => FloatingActionButton(
        onPressed: () => Navigator.pushNamed(context, '/cart'),
        backgroundColor: Colors.black,
        child: Stack(alignment: Alignment.center, children: [
          const Icon(Icons.shopping_cart),
          if (cart.count > 0)
            Positioned(
              top: 0,
              right: 0,
              child: CircleAvatar(
                radius: 8,
                backgroundColor: Colors.white,
                child: Text(cart.count.toString(), style: const TextStyle(fontSize: 10, color: Colors.black)),
              ),
            ),
        ]),
      )),
    );
  }
}
