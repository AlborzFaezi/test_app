import '../models/cat_model.dart';

abstract class CatState {}

class CatInitial extends CatState {}

class CatLoading extends CatState {}

class CatLoaded extends CatState {
  final List<CatModel> cats;

  CatLoaded(this.cats);
}

class CatError extends CatState {
  final String message;

  CatError(this.message);
}
