import 'package:flutter/material.dart';
import '../widgets/logo_widget.dart';

class NewsScreen extends StatelessWidget {
  const NewsScreen({super.key});
  @override
  Widget build(BuildContext context) {
    final items = [
      {'title': 'Good Game abre nueva tienda', 'date': '2025-11-01'},
      {'title': 'Promoción Black Friday', 'date': '2025-11-20'},
    ];
    return Scaffold(
      appBar: AppBar(title: Row(children: const [LogoWidget(size: 24), SizedBox(width: 8), Text('Noticias')])),
      body: ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index) {
          final n = items[index];
          return ListTile(
            title: Text(n['title']!, style: const TextStyle(color: Colors.black)),
            subtitle: Text(n['date']!),
          );
        },
      ),
    );
  }
}
