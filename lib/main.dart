import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:untitled1/Routes/routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      debugShowCheckedModeBanner: false,
      title: 'Delivery Couriers',
      theme: ThemeData(
      fontFamily: 'Poppins',
        textTheme: GoogleFonts.poppinsTextTheme(),
        colorScheme: .fromSeed(seedColor: Colors.deepPurple),
      ),
      initialRoute: '/Splash',
      routes: routes,
    );
  }
}

