import 'package:flutter_bloc/flutter_bloc.dart';
import '../repository/cat_repository.dart';
import 'cat_state.dart';

class CatCubit extends Cubit<CatState> {
  final CatRepository catRepository;

  CatCubit(this.catRepository) : super(CatInitial());

  Future<void> loadCats() async {
    emit(CatLoading());
    try {
      final cats = await catRepository.fetchCats();
      if (cats.isNotEmpty) {
        emit(CatLoaded(cats));
      } else {
        emit(CatError('No cats found.'));
      }
    } catch (e) {
      print('Error: $e');
      emit(CatError(e.toString()));
    }
  }
}
