import 'package:flutter/material.dart';
import 'package:football_shop/screens/login.dart';
import 'package:football_shop/screens/menu.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Provider(
      create: (_) {
        CookieRequest request = CookieRequest();
        return request;
      },
      child: MaterialApp(
        title: 'Socceria',
        theme: ThemeData(
          useMaterial3: true,
          colorScheme: ColorScheme.fromSeed(
            seedColor: const Color(0xFFD16BA5), 
            brightness: Brightness.light,
            secondary: const Color(0xFFF8BBD0), 
          ).copyWith(
            onPrimary: Colors.white, 
            onSecondary: const Color(0xFF6A1B9A), 
          ),
        ),
        home: const LoginPage(),
      ),
    );
  }
}
