import 'package:flutter/material.dart';
import 'package:my_app/model/product.dart';
class ProductItem extends StatelessWidget {
  final Product product;
  final Function addToCart;

  const ProductItem({super.key, required this.product, required this.addToCart});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min, 
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
      
        Image.asset(
          product.imageUrl,
          width: 100,
          height: 100,
          fit: BoxFit.cover,
        ),

        const SizedBox(height: 7),

        // Product name
        Text(
          product.name,
          style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
          overflow: TextOverflow.ellipsis,
          textAlign: TextAlign.center,
        ),

        // Product price
        Text(
          '\$${product.price.toStringAsFixed(2)}',
          style: TextStyle(fontSize: 11, color: Colors.grey[700]),
        ),

        Text(
          product.description,
          style: TextStyle(fontSize: 10, color: const Color.fromARGB(255, 10, 8, 8)),
          overflow: TextOverflow.ellipsis,
          maxLines: 3,
          textAlign: TextAlign.center,
        ),

        const SizedBox(height: 4),

        // Add button
        SizedBox(
          height: 28,      // small button
          width: 60,       // compact width
          child: ElevatedButton(
            onPressed: () => addToCart(product),
            style: ElevatedButton.styleFrom(
              padding: EdgeInsets.zero,
              textStyle: TextStyle(fontSize: 10),
            ),
            child: Text('Add to Cart',style:TextStyle(color :Colors.white)),
          ),
        ),
      ],
    );
  }
}
