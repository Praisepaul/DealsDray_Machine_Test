import 'package:flutter/material.dart';
import 'dart:convert';  // To convert the form data to JSON

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool _isPhoneSelected = false;  // Track whether the user selects phone or email
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();

  // Function to send OTP via API call
  Future<void> _sendOtp() async {
    final url = Uri.parse('http://devapiv4.dealsdray.com/api/v2/user/otp');
      print('OTP sent successfully');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // App logo at the top, faded effect
            Center(
              child: Opacity(
                opacity: 0.5,  // Faded effect
                child: Image.asset(
                  'assets/logo.png',
                  height: 120,  // Replace with your logo image path
                ),
              ),
            ),
            const SizedBox(height: 30),
            
            // Toggle between Email and Phone
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      _isPhoneSelected = false;  // Select Email
                    });
                  },
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                     backgroundColor: _isPhoneSelected ? Colors.grey : Colors.blue,  // Highlight selected),
                  ),
                  child: const Text('Email'),
                ),
                const SizedBox(width: 10),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      _isPhoneSelected = true;  // Select Phone
                    });
                  },
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ), backgroundColor: _isPhoneSelected ? Colors.blue : Colors.grey,  // Highlight selected
                  ),
                  child: const Text('Phone'),
                ),
              ],
            ),
            const SizedBox(height: 20),

            // Show Phone fields if phone is selected, otherwise show email/password fields
            if (_isPhoneSelected) ...[
              // Phone number input
              TextField(
                controller: _phoneController,
                decoration: const InputDecoration(
                  labelText: 'Phone Number',
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.phone,
              ),
              const SizedBox(height: 16.0),
              // Send OTP button
              ElevatedButton(
                onPressed: (){
                  Navigator.pushReplacementNamed(context, '/home');
                },
                child: const Text('Send OTP'),
              ),
            ] else ...[
              // Email input
              TextField(
                controller: _emailController,
                decoration: const InputDecoration(
                  labelText: 'Email',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 16.0),
              // Password input
              TextField(
                controller: _passwordController,
                decoration: const InputDecoration(
                  labelText: 'Password',
                  border: OutlineInputBorder(),
                ),
                obscureText: true,
              ),
              const SizedBox(height: 16.0),
              // Login button
              ElevatedButton(
                onPressed: () {
                  Navigator.pushReplacementNamed(context, '/home');
                },
                child: const Text('Login'),
              ),
            ],

            // Sign-up link
            TextButton(
              onPressed: () {
                Navigator.pushNamed(context, '/signup');
              },
              child: const Text('Sign Up'),
            ),
          ],
        ),
      ),
    );
  }
}
