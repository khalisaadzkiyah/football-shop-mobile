import 'package:flutter/material.dart';
import 'package:football_shop/screens/login.dart';
import 'package:football_shop/screens/menu.dart';
import 'package:football_shop/screens/productentry_form.dart';
import 'package:football_shop/screens/product_list.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:provider/provider.dart';

class LeftDrawer extends StatelessWidget {
  const LeftDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          const DrawerHeader(
            decoration: BoxDecoration(
              color: Color(0xFFFFC1E3),
            ),
            child: Column(
              children: [
                Text(
                  'Socceria',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                Padding(padding: EdgeInsets.all(10)),
                Text(
                  "Shop the best football products here!",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 15,
                    color: Colors.white,
                    fontWeight: FontWeight.normal,
                  ),
                ),
              ],
            ),
          ),
          ListTile(
            leading: const Icon(Icons.home_outlined, color: Color(0xFFC2185B)),
            title: const Text('Home', style: TextStyle(color: Color(0xFF880E4F))),
            onTap: () {
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => MyHomePage(),
                  ));
            },
          ),
          ListTile(
            leading: const Icon(Icons.add_shopping_cart, color: Color(0xFFC2185B)),
            title: const Text('Add Product', style: TextStyle(color: Color(0xFF880E4F))),
            onTap: () {
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const ProductFormPage(),
                  ));
            },
          ),
          ListTile(
              leading: const Icon(Icons.add_reaction_rounded, color: Color(0xFFC2185B)),
              title: const Text('Product List', style: TextStyle(color: Color(0xFF880E4F))),
              onTap: () {
                  // Route to product list page
                  Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const ProductListPage()),
                  );
              },
          ),
          ListTile(
            leading: const Icon(Icons.logout, color: Color(0xFFC2185B)),
            title: const Text('Logout', style: TextStyle(color: Color(0xFF880E4F))),
            onTap: () async {
              final request = context.read<CookieRequest>();
              final response = await request.logout("http://localhost:8000/auth/logout/");
              String message = response["message"];
              if (context.mounted) {
                if (response['status']) {
                  String uname = response["username"];
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text("$message See you again, $uname.")),
                  );
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => const LoginPage()),
                  );
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text(message)),
                  );
                }
              }
            },
          ),

        ],
      ),
    );
  }
}