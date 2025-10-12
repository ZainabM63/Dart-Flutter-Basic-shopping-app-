import 'package:flutter/material.dart';
import 'package:my_app/Widgets/product_item.dart';
import 'cart_screen.dart';
import '../model/product.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Product> products = [
    Product(
      id: 'p1',
      name: 'Smartphone',
      description: 'Latest model smartphone with high resolution camera.',
      price: 699.99,
      imageUrl: 'assets/images/phone.jpg',
    ),
    Product(
      id: 'p2',
      name: 'Camera',
      description:'Retro Camera 7mgpx',
      price: 199.99,
      imageUrl: 'assets/images/camera.jpg',
    ),
    Product(
      id: 'p3',
      name: 'Laptop',
      description: 'INTEL I5 512GB SSD GEN 7.',
      price: 89.99,
      imageUrl: 'assets/images/laptop.jpeg',
    ),
    Product(id: 'p4',
     name: 'Smartwatch S300', 
     description: 'Quadcore processor, 4 GB RAM',
      price: 60.00, 
      imageUrl: 'assets/images/smartwatch.jpg')
  ];

  List<Product> cart = [];

  void addToCart(Product product) {
    setState(() {
      cart.add(product);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('ULTRIX SHOPPING APP'),
        actions: [
          IconButton(
            icon: Icon(Icons.shopping_cart),
            onPressed: () {
              Navigator.pushNamed(context, CartScreen.routeName, arguments: cart);
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Wrap(
          spacing: 10,    // horizontal spacing between items
          runSpacing: 10, // vertical spacing between rows
          children: products.map((product) {
            return SizedBox(
              width: 120, 
              child: ProductItem(
                product: product,
                addToCart: addToCart,
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}
