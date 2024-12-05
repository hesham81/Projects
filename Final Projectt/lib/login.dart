import 'package:flutter/material.dart';
import 'signup.dart';
void main() => runApp(TravelGoApp());

class TravelGoApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: TravelGoScreen(),
    );
  }
}

class TravelGoScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Color(0xFFB7E0F2), // Background color set to #B7E0F2
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Image at the top
            Expanded(
              flex: 3,
              child: Center(
                child: Image.network(
                  'https://5.imimg.com/data5/SELLER/Default/2023/7/322745470/DM/IE/MR/127740382/whatsapp-image-2023-07-05-at-6-40-02-pm-500x500.jpeg', // Replace with your image URL or asset
                  fit: BoxFit.cover,
                  height: 200,
                ),
              ),
            ),
            // App title with "Travel" in white and "Go" inside a circle with specific color
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // "Travel" text
                Text(
                  'Travel ',
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                    color: Colors.white, // Color for "Travel" text
                  ),
                ),
                // "Go" inside a circle
                Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white, // Circle background color for "Go"
                  ),
                  padding: EdgeInsets.all(10),
                  child: Text(
                    'go',
                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF0093E7), // "Go" text color
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            // Sign-up and Sign-in buttons
            Expanded(
              flex: 2,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: ()
                    {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const SignupScreen(),
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFF68B0E2), // Button color
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                    ),
                    child: Text(
                      'Sign up',
                      style: TextStyle(
                        fontSize: 18, // Adjusted font size
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFF68B0E2), // Button color
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                    ),
                    child: Text(
                      'Sign in',
                      style: TextStyle(
                        fontSize: 18, // Adjusted font size
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}