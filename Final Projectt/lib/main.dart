import 'package:flutter/material.dart';
import 'Forget_Password.dart';

void main() {
  runApp(SignUp());
}

class SignUp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Login UI',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: LoginScreen(),
    );
  }
}

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  // Method to handle login (just UI for now)
  void _handleLogin() {
    String username = _usernameController.text;
    String password = _passwordController.text;

    if (username.isNotEmpty && password.isNotEmpty) {
      print("Logging in with username: $username and password: $password");
      // Here you would typically call an API to log in
    } else {
      print("Please fill in both fields");
    }
  }

  // Navigate to Sign Up Screen (just UI for now)
  void _navigateToSignUp() {
    // You can replace this with actual navigation to a signup screen
    print("Navigate to Sign Up screen");
  }

  // Navigate to Forgot Password Screen (just UI for now)
  void _navigateToForgotPassword() {
    // You can replace this with actual navigation to a forgot password screen
    print("Navigate to Forgot Password screen");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login Screen'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // App title
            Text(
              'Welcome Back!',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 50),

            // Username (Email) TextField
            TextField(
              controller: _usernameController,
              decoration: InputDecoration(
                labelText: 'Username (Email)',
                hintText: 'Enter your email',
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.emailAddress,
            ),
            SizedBox(height: 20),

            // Password TextField
            TextField(
              controller: _passwordController,
              decoration: InputDecoration(
                labelText: 'Password',
                hintText: 'Enter your password',
                border: OutlineInputBorder(),
              ),
              obscureText: true,
            ),
            SizedBox(height: 20),

            // Login Button
            ElevatedButton(
              onPressed: _handleLogin,
              child: Text('Login'),
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(horizontal: 50, vertical: 12),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ),
            SizedBox(height: 20),

            // Forgot Password Button
            TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ForgotPasswordPage(),
                  ),
                );
              },
              child: Text('Forgot Password?', style: TextStyle(color: Colors.blue)),
            ),
            SizedBox(height: 20),

            // Social Media Login Buttons
            ElevatedButton.icon(
              onPressed: () {
                // Google sign-in action (just UI for now)
              },
              icon: Icon(Icons.login, color: Colors.white),
              label: Text('Login with Google'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.redAccent, // Google button color
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ),
            SizedBox(height: 20),

            ElevatedButton.icon(
              onPressed: () {
                // Facebook sign-in action (just UI for now)
              },
              icon: Icon(Icons.facebook, color: Colors.white),
              label: Text('Login with Facebook'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue, // Facebook button color
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ),
            SizedBox(height: 20),

            ElevatedButton.icon(
              onPressed: () {
                // Twitter sign-in action (just UI for now)
              },
              icon: Icon(Icons.airplane_ticket, color: Colors.white), // Icon placeholder
              label: Text('Login with Twitter'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.lightBlue, // Twitter button color
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ),
            SizedBox(height: 30),

            // Sign Up Option
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Don't have an account? "),
                TextButton(
                  onPressed: _navigateToSignUp,
                  child: Text('Sign Up', style: TextStyle(color: Colors.blue)),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
