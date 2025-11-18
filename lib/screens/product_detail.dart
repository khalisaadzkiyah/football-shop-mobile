import 'package:flutter/material.dart';
import 'package:football_shop/models/product.dart';

class ProductDetailPage extends StatelessWidget {
  final Product product;

  const ProductDetailPage({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Product Detail',
          style: TextStyle(
            color: Color(0xFF6B0F6B), 
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Color(0xFFFED4E0),
      ),
      body: Container(
        color: Color(0xFFFED4E0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Thumbnail
              if (product.thumbnail.isNotEmpty)
                Image.network(
                  product.thumbnail,
                  width: double.infinity,
                  height: 250,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) => Container(
                    height: 250,
                    color: Colors.grey[300],
                    child: const Center(
                      child: Icon(Icons.broken_image, size: 50),
                    ),
                  ),
                ),

              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Featured badge
                    if (product.isFeatured)
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 12.0, vertical: 6.0),
                        margin: const EdgeInsets.only(bottom: 12.0),
                        decoration: BoxDecoration(
                          color: Color(0xFFFFC0CB), 
                        ),
                        child: const Text(
                          'Featured Product',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 12,
                            color: Color(0xFF6B0F6B), 
                          ),
                        ),
                      ),

                    // Name
                    Text(
                      product.name,
                      style: const TextStyle(
                        fontSize: 24.0,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF6B0F6B), 
                      ),
                    ),
                    const SizedBox(height: 12),

                    // Price
                    Text(
                      "Rp ${product.price}",
                      style: const TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.w600,
                        color: Color(0xFF6B0F6B),
                      ),
                    ),
                    const SizedBox(height: 12),

                    // Category
                    Text(
                      "Category: ${product.category}",
                      style: const TextStyle(
                        fontSize: 16.0,
                        color: Color(0xFF6B0F6B), 
                      ),
                    ),
                    const SizedBox(height: 12),

                    // Description
                    Text(
                      product.description,
                      style: const TextStyle(
                        fontSize: 16.0,
                        height: 1.6,
                        color: Color(0xFF6B0F6B), 
                      ),
                      textAlign: TextAlign.justify,
                    ),
                    const SizedBox(height: 24),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );

  }
}
