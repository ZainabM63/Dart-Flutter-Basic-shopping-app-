import 'package:flutter/material.dart';
import 'screens/home_screen.dart';
import 'screens/cart_screen.dart';

void main() {
  runApp(ShoppingApp());
}

class ShoppingApp extends StatelessWidget {
  const ShoppingApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'ULTRIX SHOPPING APP',
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
        scaffoldBackgroundColor: Colors.grey[100], // light background
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.black,
          elevation: 2,
          centerTitle: true,
          titleTextStyle: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color.fromARGB(255, 14, 14, 15),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(6),
            ),
            padding: EdgeInsets.symmetric(vertical: 6, horizontal: 10),
            textStyle: TextStyle(fontSize: 12, fontWeight: FontWeight.bold,color: const Color.fromARGB(255, 245, 241, 241)),
          ),
        ),
        textTheme: TextTheme(
          bodyMedium: TextStyle(color: Colors.black87),
        ),
      ),
      home: HomeScreen(),
      routes: {
        CartScreen.routeName: (ctx) => CartScreen(),
      },
    );
  }
}
