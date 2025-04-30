import 'package:flutter/material.dart';
import '../models/product.dart';

class ProductDetailScreen extends StatelessWidget {
  final Product product;

  const ProductDetailScreen({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(product.title),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(
              product.image,
              height: 300,
              width: double.infinity,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) =>
                  Icon(Icons.error, size: 100),
            ),
            Padding(
              padding: EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    product.title,

                  ),
                  SizedBox(height: 8.0),
                  Text(
                    '\$${product.price.toStringAsFixed(2)}',

                  ),
                  SizedBox(height: 16.0),
                  Text(
                    'Description',

                  ),
                  SizedBox(height: 8.0),
                  Text(product.description),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}