import 'dart:async';
import '../models/product.dart';
import '../models/game.dart';

class ApiService {
  // Método mock que simula una llamada a API y devuelve una lista de productos
  Future<List<Product>> fetchProducts() async {
    await Future.delayed(const Duration(milliseconds: 600));
    final data = [
      {'id': 'g1', 'title': 'Super Adventure', 'price': 19.99, 'type': 'game'},
      {'id': 'g2', 'title': 'Sky Battle', 'price': 29.99, 'type': 'game'},
      {'id': 'g3', 'title': 'Puzzle Master', 'price': 9.99, 'type': 'game'},
      {'id': 'c1', 'title': 'GameBox X', 'price': 299.99, 'type': 'console'},
      {'id': 'c2', 'title': 'PlayFun 5', 'price': 399.99, 'type': 'console'},
    ];
    return data.map((d) => Product.fromJson(d)).toList();
  }

  // Backwards compatibility: fetch only games as Game model list
  Future<List<Game>> fetchGames() async {
    final products = await fetchProducts();
    final games = products.where((p) => p.type == ProductType.game).map((p) => Game.fromJson(p.toJson())).toList();
    return games;
  }
}
