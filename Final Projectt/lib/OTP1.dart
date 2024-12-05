import 'package:flutter/material.dart';
import 'verification.dart';
void main() {
  runApp(const OTP());
}

class OTP extends StatelessWidget {
  const OTP({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light(useMaterial3: true),
      home: SimpleProject(),
    );
  }
}

class SimpleProject extends StatelessWidget {
  const SimpleProject({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xFFB7E0F2),
        appBar: AppBar(elevation: 1,
          backgroundColor: Color(0xFFB7E0F2),
        ),

    body:

    Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Align(
            alignment: Alignment.centerRight,
          ),
          Padding(
            padding: EdgeInsets.all(12),

            child: Column(
              // crossAxisAligment: CrossAxisAligmen.start,
              children: [
                // Expanded(
                //   flex: 3,
                //   child: Center(
                //     child: Image.network(
                //       'https://5.imimg.com/data5/SELLER/Default/2023/7/322745470/DM/IE/MR/127740382/whatsapp-image-2023-07-05-at-6-40-02-pm-500x500.jpeg', // Replace with your image URL or asset
                //       fit: BoxFit.cover,
                //       height: 200,
                //   ),
                //  ),
                // ),
                // Image.asset(
                //   assets/images/1.jpeg
                //   // 'assets/image.png', // Path to your image
                //   width: 200, // Optional: specify the width
                //   height: 200, // Optional: specify the height
                //   fit: BoxFit.cover, // Optional: how the image should be fitted
                // ),

                const Text("OTP verification",
                  style: TextStyle(color: Colors.black, fontSize: 30, ), textAlign: TextAlign.left, ) ,
                const Text("Enter email or phone number to ",
                  style: TextStyle( fontSize: 16, color: Color(0xFF68B0E2)), maxLines: 2, textAlign: TextAlign.left,),
                const Text("send one time password",
                  style: TextStyle( fontSize: 16, color: Color(0xFF68B0E2)), maxLines: 2, textAlign: TextAlign.left,),

                const SizedBox(height: 100,width: 13,),
                SizedBox(
                  width: 300,
                  height: 70,
                  child: TextField(

                    keyboardType: TextInputType.number, // Ensures the keyboard is for number input
                    decoration: InputDecoration(
                      labelText: "Email OR Phone number",
                      labelStyle: TextStyle(
                        fontSize: 16,
                        color: Colors.grey,
                      ),
                      //labelText: "Enter Number",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {

                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const VerficationScreen(),
                      ),
                    );
                    // Action
                  },
                  style: ElevatedButton.styleFrom(

                    backgroundColor: Color(0xFF68B0E2), // Button color
                    shape: RoundedRectangleBorder(
                      // This defines the shape of the button
                      borderRadius: BorderRadius.circular(50), // Rounded corners with radius
                    ),
                    padding: EdgeInsets.symmetric(horizontal: 75, vertical: 18),
                    elevation: 10,
                  ),
                  child: const Text('CONTINUE', style: TextStyle(fontSize: 30, color: Colors.black),),
                )


              ],
            ),
          )
        ])
    );
  }
}
