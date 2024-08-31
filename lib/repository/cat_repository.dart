import '../api/cat_api_provider.dart';
import '../models/cat_model.dart';

class CatRepository {
  final CatApiProvider catApiProvider;

  CatRepository(this.catApiProvider);

  Future<List<CatModel>> fetchCats() async {
    final response = await catApiProvider.fetchCats();
    if (response.statusCode == 200) {
      final List<dynamic> data = response.data;
      return data.map((json) => CatModel.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load cats');
    }
  }
}
