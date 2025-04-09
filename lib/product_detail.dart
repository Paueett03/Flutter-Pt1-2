import 'package:flutter/material.dart';
import 'product.dart';

class ProductDetail extends StatelessWidget {
  final Product product;
  const ProductDetail({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(product.title)),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(product.imageUrl, height: 200, width: double.infinity, fit: BoxFit.cover),
            const SizedBox(height: 10),
            Text(product.title, style: Theme.of(context).textTheme.titleLarge),
            const SizedBox(height: 10),
            Text(product.description),
            const SizedBox(height: 10),
            Text('€${product.price.toStringAsFixed(2)}',
                style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Afegit correctament al carretó')),
          );
        },
        child: const Icon(Icons.add_shopping_cart),
      ),
    );
  }
}
