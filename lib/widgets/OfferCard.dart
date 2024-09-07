import 'package:flutter/material.dart';

class OfferCard extends StatelessWidget {
  final String imagePath;

  const OfferCard({super.key, required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Image.asset(imagePath, fit: BoxFit.cover, width: 200), 
    );
  }
}
