import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: FailedScreen(), // Corrected class name here
    );
  }
}

class FailedScreen extends StatelessWidget { // Corrected class name here
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0XFFEAF7FD), Color(0XFFF89DA6)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Stack(
              alignment: Alignment.center,
              children: [
                Container(
                  width: 70,
                  height: 70,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.transparent,
                  ),
                  child: CustomPaint(
                    painter: FullCirclePainter(),
                  ),
                ),
                const Icon(
                  Icons.close,
                  color: Colors.red, // Red icon color
                  size: 40,
                ),
              ],
            ),
            const SizedBox(height: 40),
            const Text(
              'Authentication Failed!',
              style: TextStyle(
                fontSize: 24,
                color: Colors.red,
              ),
            ),
            const SizedBox(height: 20), // Added extra space between text and button
            // Resend New Code Button with Left Arrow below the text
            TextButton(
              onPressed: () {
                // Handle the resend new code action here
              },
              style: TextButton.styleFrom(
                foregroundColor: Colors.red, // Correct text color
                padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 15),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Text(
                    'Resend New Code',
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                  const Icon(
                    Icons.arrow_back_sharp, // Left arrow icon
                    size: 20,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 40), // Increased space between buttons
            // BACK TO LOGIN Button
            TextButton(
              onPressed: () {
                // Handle the "Back to Login" action here
              },
              style: TextButton.styleFrom(
                foregroundColor: Colors.blue, // Correct text color
                padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 15),
              ),
              child: const Text(
                'BACK TO LOGIN',
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class FullCirclePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = 3; // Adjust the stroke width to make it thinner

    // Draw the red outline for the full circle
    paint.color = Colors.red; // Red outline color
    canvas.drawCircle(
      Offset(size.width / 2, size.height / 2), // Center of the circle
      size.width / 2, // Radius of the circle
      paint,
    );
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
