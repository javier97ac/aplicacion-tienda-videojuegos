import 'package:flutter/material.dart';
import '../models/product.dart';

class CartItem {
  final Product product;
  int qty;
  CartItem({required this.product, this.qty = 1});
}

class CartProvider extends ChangeNotifier {
  final Map<String, CartItem> _items = {};

  List<CartItem> get items => _items.values.toList();
  int get count => _items.length;

  double get total => _items.values.fold(0.0, (sum, item) => sum + item.product.price * item.qty);

  void add(Product product) {
    if (_items.containsKey(product.id)) {
      _items[product.id]!.qty++;
    } else {
      _items[product.id] = CartItem(product: product);
    }
    notifyListeners();
  }

  void remove(String productId) {
    _items.remove(productId);
    notifyListeners();
  }

  void clear() {
    _items.clear();
    notifyListeners();
  }
}
