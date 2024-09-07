import 'package:flutter/material.dart';

class CheckoutScreen extends StatelessWidget {
  const CheckoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Checkout'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const TextField(
              decoration: InputDecoration(labelText: 'Card Number'),
            ),
            const TextField(
              decoration: InputDecoration(labelText: 'Expiration Date'),
            ),
            const TextField(
              decoration: InputDecoration(labelText: 'CVV'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                //Navigator.pushReplacementNamed(context, '/order-confirmation');
              },
              child: const Text('Confirm Order'),
            ),
          ],
        ),
      ),
    );
  }
}
