import 'package:flutter/material.dart';
import 'screens/cat_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: CatScreen(),
      debugShowCheckedModeBanner: false,// Use the CatScreen as the home screen
    );
  }
}
