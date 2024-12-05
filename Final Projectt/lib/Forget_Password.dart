import 'package:flutter/material.dart';
import 'OTPForgot.dart';
import 'newpasswordpage.dart';

class ForgotPasswordPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffB7E0F2),
      body: Column(
        children: [
          SizedBox(height: 190),
          // page title
          Text(
            'Forgot Password',
            style: TextStyle(
              color: Color(0xff008CED),
              fontSize: 40,
              fontFamily: "Poppins-Bold",
            ),
          ),
          SizedBox(height: 110),
          // the white container
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
              ),
              padding: EdgeInsets.all(40),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 50),

                  // Email title
                  Text(
                    'Email',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      fontFamily: "Poppins-SemiBold" ,
                    ),
                  ),
                  SizedBox(height: 10),
                  // TextField
                  TextField(
                    decoration: InputDecoration(
                      hintText: "Your Email",
                      hintStyle: TextStyle(
                          color: Colors.grey, // Set hint text color
                          fontFamily: "Poppins-SemiBold"
                      ),
                      prefixIcon: Icon(Icons.email_outlined, color: Colors.grey),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(23),
                        borderSide: BorderSide(color: Colors.grey),

                      ),
                    ),
                  ),
                  SizedBox(height: 30),
                  // Submit button
                  Center(
                    child: SizedBox(
                      width: 300,
                      height: 65,
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => OTP()),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color(0xff68B0E2),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(40),
                          ),
                        ),
                        child: Text(
                          "Submit",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                            fontFamily: "Poppins-SemiBold",

                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 70),
                  // Back to sign in
                  Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.arrow_back, color: Color(0xff2590D1)),
                        SizedBox(width: 3),
                        TextButton(
                          onPressed: () {},
                          child: Text(
                            "Back to sign in?",
                            style: TextStyle(
                              color: Color(0xff2590D1),
                              fontSize: 21,
                              fontFamily: "Poppins-SemiBold",
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
