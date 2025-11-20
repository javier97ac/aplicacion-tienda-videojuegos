import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/product.dart';
import '../providers/product_provider.dart';
import '../widgets/product_card.dart';
import '../widgets/logo_widget.dart';

class ConsolesScreen extends StatefulWidget {
  const ConsolesScreen({super.key});
  @override
  State<ConsolesScreen> createState() => _ConsolesScreenState();
}

class _ConsolesScreenState extends State<ConsolesScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) => Provider.of<ProductProvider>(context, listen: false).fetchProducts());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: const [
            LogoWidget(size: 24),
            SizedBox(width: 8),
            Text('Consolas'),
          ],
        ),
      ),
      body: Consumer<ProductProvider>(builder: (context, provider, _) {
        if (provider.loading) return const Center(child: CircularProgressIndicator());
        if (provider.error != null) return Center(child: Text(provider.error!));
        final consoles = provider.productsByType(ProductType.console);
        return ListView.builder(
          itemCount: consoles.length,
          itemBuilder: (context, index) => ProductCard(product: consoles[index]),
        );
      }),
    );
  }
}
