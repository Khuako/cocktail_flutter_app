import 'package:bloc/bloc.dart';
import 'package:cocktail_project/data/api_provider/cocktail_api_provider.dart';
import 'package:cocktail_project/model/cocktail_model.dart';
import 'package:equatable/equatable.dart';

part 'random_cocktail_state.dart';

class RandomCocktailCubit extends Cubit<RandomCocktailState> {
  RandomCocktailCubit() : super(RandomCocktailInitial());
  Future<void> fetchRandomCocktail() async {
    emit(RandomCocktailLoading());
    try {
      final result = await CocktailApiProvider().fetchRandomCocktail();
      emit(RandomCocktailLoaded(drinkInfo: result));
    } on Exception catch (e) {
      emit(RandomCocktailFailure());
    }
  }
}
