import 'package:flutter/material.dart';
import '../widgets/product_card.dart';

class ProductGrid extends StatelessWidget {
  final List<String> productImages = [
    'assets/clothing.png',
    'assets/electronics.png',
    'assets/groceries.png',
    'assets/product_image.png',
  ];

  ProductGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: const EdgeInsets.all(8.0),
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
      ),
      itemCount: 10,
      itemBuilder: (context, index) {
        String imagePath = productImages[index % productImages.length];

        return ProductCard(
          productName: 'Product $index',
          price: 100 + index * 10,
          imagePath: imagePath,
        );
      },
    );
  }
}
