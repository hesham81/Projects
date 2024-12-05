import 'package:flutter/material.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        // Handle the back button press if necessary, e.g., return true to allow exit, false to block
        return true; // Change to false to block the back button
      },
      child: Scaffold(
        backgroundColor: const Color(0xFFB7E0F2),
        appBar: AppBar(
          title: const Text('Sign Up'),
          backgroundColor: const Color(0xFFB7E0F2),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Sign Up',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 20),
              const Text(
                'Enter your details to create an account.',
                style: TextStyle(
                  fontSize: 16,
                  color: Color(0xFF68B0E2),
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 30),
              // Add your form fields here
            ],
          ),
        ),
      ),
    );
  }
}
