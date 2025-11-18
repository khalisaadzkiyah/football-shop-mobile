import 'package:flutter/material.dart';
import 'package:football_shop/models/product.dart';
import 'package:football_shop/widgets/item_card.dart'; // untuk ProductCard
import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:provider/provider.dart';
import 'package:football_shop/widgets/left_drawer.dart';

class MyProductsPage extends StatefulWidget {
  const MyProductsPage({super.key});

  @override
  State<MyProductsPage> createState() => _MyProductsPageState();
}

class _MyProductsPageState extends State<MyProductsPage> {
  Future<List<Product>> fetchMyProducts(CookieRequest request) async {
    final response = await request.get('http://localhost:8000/json/?user=my');
    List<Product> listProducts = [];
    for (var d in response) {
      if (d != null) {
        listProducts.add(Product.fromJson(d));
      }
    }
    return listProducts;
  }

  @override
  Widget build(BuildContext context) {
    final request = context.watch<CookieRequest>();

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'My Products',
          style: TextStyle(
            color: Color(0xFF6B0F6B),
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Color(0xFFFED4E0),
      ),
      drawer: const LeftDrawer(),
      body: Container(
        color: Color(0xFFFED4E0),
        child: FutureBuilder(
          future: fetchMyProducts(request),
          builder: (context, AsyncSnapshot snapshot) {
            if (snapshot.data == null) {
              return const Center(child: CircularProgressIndicator());
            } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
              return const Center(child: Text(
                'You have no products yet.',
                style: TextStyle(color: Color(0xFF6B0F6B)), 
              ));
            } else {
              return ListView.builder(
                itemCount: snapshot.data!.length,
                itemBuilder: (_, index) => ProductCard(
                  product: snapshot.data![index],
                  onTap: () {},
                ),
              );
            }
          },
        ),
      ),
    );

  }
}
