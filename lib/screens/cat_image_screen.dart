import 'package:flutter/material.dart';


class CatImageScreen extends StatelessWidget {
  const CatImageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final String catId = ModalRoute.of(context)!.settings.arguments as String;
    final String imageUrl = 'https://cataas.com/cat/$catId';

    return Scaffold(
      appBar: AppBar(
        title: Text('Cat Image',style: TextStyle(color: Colors.white),),
        backgroundColor: Colors.cyan,
      ),
      body: SingleChildScrollView(
          child: Image.network(imageUrl)
      ),
    );
  }
}
