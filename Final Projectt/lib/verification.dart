import 'package:flutter/material.dart';
import 'Success Screen.dart';
void main() {
  runApp(const VerficationScreen());
}

class VerficationScreen extends StatelessWidget {
  const VerficationScreen({Key? key}) : super(key: key);

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
      // title: Text("Travel go"),
        centerTitle: true, leading: IconButton(onPressed: (){}, icon: Icon(Icons.arrow_back, size: 25,)),
      ),



       body: (

           Column(
               mainAxisAlignment: MainAxisAlignment.start,
         children: [
           Align(
             alignment: Alignment.centerRight,
           ),
           Padding(
             padding: EdgeInsets.all(12),
             child: Column(
               
               // crossAxisAligment: CrossAxisAligmen.start,
           children: [

             const Text("verification code",
               style: TextStyle(color: Colors.black, fontSize: 30, ), textAlign: TextAlign.left, ) ,
             const Text("We have sent verification ",
                 style: TextStyle( fontSize: 16, color: Color(0xFF68B0E2)), maxLines: 2, textAlign: TextAlign.left,),
             const Text("code to your email address",
                 style: TextStyle( fontSize: 16, color: Color(0xFF68B0E2)), maxLines: 2, textAlign: TextAlign.left,),
             Row(
                 mainAxisAlignment: MainAxisAlignment.center,
               children: [

                 const SizedBox(height: 100,width: 13,),
                 SizedBox(
                   width: 60,
                   height: 55,
                   child: TextField(

                     keyboardType: TextInputType.number, // Ensures the keyboard is for number input
                     decoration: InputDecoration(
                       //labelText: "Enter Number",
                       border: OutlineInputBorder(
                         borderRadius: BorderRadius.circular(10),
                       ),
                     ),
                   ),
                 ),
                 const SizedBox(height: 100,width: 13,),
                 SizedBox(
                     width: 60,
                     height: 55,
                     child: TextField(

                       keyboardType: TextInputType.number, // Ensures the keyboard is for number input
                       decoration: InputDecoration(
                         //labelText: "Enter Number",
                         border: OutlineInputBorder(
                           borderRadius: BorderRadius.circular(10),
                         ),
                       ),
                     )
                 ),
                 const SizedBox(height: 100,width: 13,),
                 SizedBox(
                     width: 60,
                     height: 55,
                     child: TextField(

                       keyboardType: TextInputType.number, // Ensures the keyboard is for number input
                       decoration: InputDecoration(
                         //labelText: "Enter Number",
                         border: OutlineInputBorder(
                           borderRadius: BorderRadius.circular(10),
                         ),
                       ),
                     )
                 ),
                 const SizedBox(height: 150,width: 13,),
                 SizedBox(
                     width: 60,
                     height: 55,
                     child: TextField(

                       keyboardType: TextInputType.number, // Ensures the keyboard is for number input
                       decoration: InputDecoration(
                         //labelText: "Enter Number",
                         border: OutlineInputBorder(
                             borderRadius: BorderRadius.circular(10),
                         ),
                       ),
                     )
                 ),
               ]
             ),
             ElevatedButton(
               onPressed: () {
                 // Action

                 Navigator.push(
                   context,
                   MaterialPageRoute(
                     builder: (context) =>  SuccessScreen(),
                   ),
                 );
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
               child: const Text('CONFIRM', style: TextStyle(fontSize: 35, color: Colors.black),),
             )
    ])
    ),
    ]
    )),
    );
  }
}





