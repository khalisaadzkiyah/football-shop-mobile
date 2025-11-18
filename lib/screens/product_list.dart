import 'package:flutter/material.dart';
import 'package:football_shop/models/product.dart';
import 'package:football_shop/widgets/left_drawer.dart';
import 'package:football_shop/widgets/item_card.dart';
import 'package:provider/provider.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:football_shop/screens/product_detail.dart';

class ProductListPage extends StatefulWidget {
  const ProductListPage({super.key});

  @override
  State<ProductListPage> createState() => _ProductListPageState();
}

class _ProductListPageState extends State<ProductListPage> {
  Future<List<Product>> fetchProducts(CookieRequest request) async {
    final response = await request.get('http://localhost:8000/json/');

    List<Product> products = [];
    for (var d in response) {
      if (d != null) {
        products.add(Product.fromJson(d));
      }
    }
    return products;
  }

  @override
  Widget build(BuildContext context) {
    final request = context.watch<CookieRequest>();

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Socceria Products',
          style: TextStyle(
            color: Color(0xFF6B0F6B), // dark pink/purple
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Color(0xFFFED4E0), // pink pastel
      ),
      drawer: const LeftDrawer(),
      body: Container(
        color: Color(0xFFFED4E0), // pink pastel background
        child: FutureBuilder(
          future: fetchProducts(request),
          builder: (context, AsyncSnapshot snapshot) {
            if (snapshot.data == null) {
              return const Center(child: CircularProgressIndicator());
            }

            if (!snapshot.hasData) {
              return const Center(
                child: Text(
                  'No products found.',
                  style: TextStyle(
                    fontSize: 20,
                    color: Color(0xFF6B0F6B), // dark pink/purple
                  ),
                ),
              );
            }

            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (_, index) => ProductCard(
                product: snapshot.data![index],
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ProductDetailPage(
                        product: snapshot.data![index],
                      ),
                    ),
                  );
                },
              ),
            );
          },
        ),
      ),
    );

  }
}
