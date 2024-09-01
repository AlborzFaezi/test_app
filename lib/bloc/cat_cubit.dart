import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_test/models/cat_model.dart';
import '../repository/cat_repository.dart';
import 'cat_state.dart';

class CatCubit extends Cubit<CatState> {
  final CatRepository _catRepository;
  List<CatModel> _allCats = [];


  CatCubit(this._catRepository) : super(CatInitial());

  Future<void> loadCats() async {
    try {
      emit(CatLoading());
      final cats = await _catRepository.fetchCats();
      _allCats = cats;
      emit(CatLoaded(cats: _allCats));
    } catch (e) {
      emit(CatError(message: e.toString()));
    }
  }


  void filterCats(String query) {
    final filteredCats = _allCats.where((cat) {
      return (cat.id?.contains(query) ?? false) ||
          (cat.tags?.any((tag) => tag.toLowerCase().contains(query.toLowerCase())) ?? false);
    }).toList();
    emit(CatLoaded(cats: filteredCats));
  }

}
