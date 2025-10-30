import 'package:flutter/material.dart';
import 'package:coffeeshop/intro_page.dart';
//import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const CoffeeApp());
}

class CoffeeApp extends StatelessWidget {
  const CoffeeApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const IntroPage(),
    );
  }
}
