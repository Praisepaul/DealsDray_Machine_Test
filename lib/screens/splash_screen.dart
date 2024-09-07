import 'package:flutter/material.dart';
import 'dart:async';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 3), () {
      Navigator.pushReplacementNamed(context, '/login');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,  // Expands to fill the screen
        children: [
          // Fullscreen image
          Image.asset(
            'assets/dealsdray_logo.png',  // DealsDray logo
            fit: BoxFit.cover,            // Ensures the image covers the entire screen
          ),
          
          // Optional loading indicator in the center
          const Positioned(
            top: 368,
            left: 0,
            right: 5,
            child: Center(
              child: CircularProgressIndicator(),
            ),
          ),
        ],
      ),
    );
  }
}
