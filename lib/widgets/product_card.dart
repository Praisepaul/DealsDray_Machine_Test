import 'package:flutter/material.dart';

class ProductCard extends StatelessWidget {
  final String productName;
  final double price;
  final String imagePath;

  const ProductCard({super.key, required this.productName, required this.price, required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(imagePath, height: 100, width: double.infinity, fit: BoxFit.cover),
            const SizedBox(height: 10),
            Text(
              productName,
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              overflow: TextOverflow.ellipsis,
            ),
            const SizedBox(height: 5),
            Text(
              '\$$price',
              style: const TextStyle(fontSize: 14, color: Colors.green),
            ),
          ],
        ),
      ),
    );
  }
}
