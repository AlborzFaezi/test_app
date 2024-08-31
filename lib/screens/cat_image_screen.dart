import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:test_test/api/cat_api_provider.dart';


class CatImageScreen extends StatelessWidget {

  const CatImageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final catId = ModalRoute.of(context)!.settings.arguments as String;
    final catApiProvider = CatApiProvider(Dio());
    final String imageUrl = catApiProvider.getImageUrl(catId);

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
