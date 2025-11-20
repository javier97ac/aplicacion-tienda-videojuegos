enum ProductType { game, console }

class Product {
  final String id;
  final String title;
  final double price;
  final String? imageUrl;
  final ProductType type;

  Product({required this.id, required this.title, required this.price, this.imageUrl, required this.type});

  factory Product.fromJson(Map<String, dynamic> json) {
    final typeStr = json['type']?.toString() ?? 'game';
    final type = typeStr == 'console' ? ProductType.console : ProductType.game;
    return Product(
      id: json['id']?.toString() ?? '',
      title: json['title']?.toString() ?? '',
      price: (json['price'] is num) ? (json['price'] as num).toDouble() : double.tryParse(json['price']?.toString() ?? '') ?? 0.0,
      imageUrl: json['imageUrl']?.toString(),
      type: type,
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'title': title,
        'price': price,
        'imageUrl': imageUrl,
        'type': type == ProductType.console ? 'console' : 'game',
      };
}
