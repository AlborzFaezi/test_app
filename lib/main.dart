import 'package:flutter/material.dart';
import 'screens/cat_image_screen.dart';
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
      debugShowCheckedModeBanner: false,
      routes: {
        '/catImage': (context) => CatImageScreen(),
      },
    );
  }
}
