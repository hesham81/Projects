import 'package:flutter/material.dart';

class NewPasswordPage extends StatefulWidget {
  @override
  _NewPasswordPageState createState() => _NewPasswordPageState();
}

class _NewPasswordPageState extends State<NewPasswordPage> {
  bool _isPasswordVisible = false;
  bool _isConfirmPasswordVisible = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffB7E0F2),
      body: LayoutBuilder(
        builder: (context, constraints) {
          return SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(
                minHeight: constraints.maxHeight,
              ),
              child: IntrinsicHeight(
                child: Column(
                  children: [
                    SizedBox(height: 190),
                    // page title
                    Text(
                      'New Password',
                      style: TextStyle(
                        color: Color(0xff008CED),
                        fontSize: 40,
                        fontWeight: FontWeight.bold,
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
                        padding: EdgeInsets.all(36),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(height: 50),
                            // password label
                            Text(
                              'Password', //title
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 20,
                                fontFamily: "Poppins-SemiBold",

                              ),
                            ),
                            SizedBox(height: 10),
                            TextField(
                              obscureText: !_isPasswordVisible,
                              decoration: InputDecoration(
                                hintText: "Enter Password",
                                hintStyle: TextStyle(
                                    color: Colors.grey, // Set hint text color
                                    fontFamily: "Poppins-SemiBold"
                                ),
                                suffixIcon: IconButton(
                                  icon: Icon(
                                    _isPasswordVisible
                                        ? Icons.visibility
                                        : Icons.visibility_off,
                                    color: Colors.grey,
                                  ),
                                  onPressed: () {
                                    setState(() {
                                      _isPasswordVisible =
                                      !_isPasswordVisible;
                                    });
                                  },
                                ),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(23),
                                  borderSide: BorderSide(color: Colors.grey),
                                ),
                              ),
                            ),
                            SizedBox(height: 20),
                            // confirm password
                            Text(
                              'Confirm Password',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 20,
                                fontFamily: "Poppins-SemiBold",

                              ),
                            ),
                            SizedBox(height: 10),
                            TextField(
                              obscureText: !_isConfirmPasswordVisible,
                              decoration: InputDecoration(
                                hintText: "Confirm Password",
                                hintStyle: TextStyle(
                                    color: Colors.grey, // Set hint text color
                                    fontFamily: "Poppins-SemiBold"
                                ),
                                suffixIcon: IconButton(
                                  icon: Icon(
                                    _isConfirmPasswordVisible
                                        ? Icons.visibility
                                        : Icons.visibility_off,
                                    color: Colors.grey,
                                  ),
                                  onPressed: () {
                                    setState(() {
                                      _isConfirmPasswordVisible =
                                      !_isConfirmPasswordVisible;
                                    });
                                  },
                                ),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(23),
                                  borderSide: BorderSide(color: Colors.grey),
                                ),
                              ),
                            ),
                            SizedBox(height: 30),
                            // submit button
                            Center(
                              child: SizedBox(
                                width: 300,
                                height: 65,
                                child: ElevatedButton(
                                  onPressed: () {},
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
                                      fontSize: 33,
                                      fontWeight: FontWeight.bold,
                                      fontFamily: "Poppins-SemiBold",

                                    ),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(height: 70),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}