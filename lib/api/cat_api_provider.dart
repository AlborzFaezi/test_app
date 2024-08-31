import 'package:dio/dio.dart';

class CatApiProvider {
  final Dio dio;

  CatApiProvider(this.dio);

  Future<Response> fetchCats() async {
     return await dio.get('https://cataas.com/api/cats?limit=10&skip=0');
  }

  String getImageUrl(String catId) {
    return 'https://cataas.com/cat/$catId';
  }
}
