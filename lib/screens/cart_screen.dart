import 'package:flutter/material.dart';
import '../model/product.dart';

class CartScreen extends StatefulWidget {
  static const routeName = '/cart';

  const CartScreen({super.key});

  @override
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  late List<Product> cart;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    cart = ModalRoute.of(context)!.settings.arguments as List<Product>;
  }

  void removeFromCart(Product product) {
    setState(() {
      cart.remove(product);
    });
  }

  @override
  Widget build(BuildContext context) {
    double total = cart.fold(0, (sum, item) => sum + item.price);

    return Scaffold(
      appBar: AppBar(title: Text('Your Cart')),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: cart.length,
              itemBuilder: (ctx, i) {
                return ListTile(
                  leading: Image.asset(cart[i].imageUrl, width: 50, height: 50),
                  title: Text(cart[i].name),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text('\$${cart[i].price.toStringAsFixed(2)}'),
                      IconButton(
                        icon: Icon(Icons.delete, color: Colors.red),
                        onPressed: () => removeFromCart(cart[i]),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              'Total: \$${total.toStringAsFixed(2)}',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }
}
