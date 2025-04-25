import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pt1_rodriguez_pau/home_screen.dart';
import 'product_detail.dart';
import 'cart_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key); // Agregar el parámetro key

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
        colorScheme: ColorScheme.fromSwatch(
          primarySwatch: Colors.deepPurple,
        ).copyWith(
          secondary: Colors.deepOrangeAccent, // Usar colorScheme.secondary en lugar de accentColor
        ),
        textTheme: TextTheme(
          titleLarge: TextStyle(
            fontFamily: GoogleFonts.montserrat().fontFamily,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
          bodyLarge: TextStyle(
            fontFamily: GoogleFonts.lato().fontFamily,
            fontSize: 16,
          ),
        ),
      ),
      home: HomeScreen(),
      routes: {
        ProductDetailScreen.routeName: (ctx) => const ProductDetailScreen(),
        CartScreen.routeName: (ctx) => const CartScreen(),
      },
    );
  }
}