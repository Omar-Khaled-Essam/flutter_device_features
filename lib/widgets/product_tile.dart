import 'package:flutter/material.dart';

/// A simple product row for the shopping home screen.
class ProductTile extends StatelessWidget {
  const ProductTile({super.key, required this.name, required this.price});

  final String name;
  final double price;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: const Icon(Icons.shopping_bag_outlined),
        title: Text(name),
        trailing: Text('\$${price.toStringAsFixed(2)}'),
      ),
    );
  }
}
