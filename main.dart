import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:safetrip/screens/welcome_screen.dart';


void main() {
    debugPaintSizeEnabled = false;
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, 
      title: 'SafeTrip',
      theme: ThemeData(
       primaryColor: const Color(0xFFEBE302),
      ),
      home: welcomeScreen(),
    );
  }
}
