import 'package:bloc/bloc.dart';
import 'package:cocktail_project/data/api_provider/cocktail_api_provider.dart';
import 'package:cocktail_project/model/alcoholic_model.dart';
import 'package:equatable/equatable.dart';

part 'popular_drinks_state.dart';

class PopularDrinksCubit extends Cubit<PopularDrinksState> {
  PopularDrinksCubit() : super(PopularDrinksInitial());
  Future<void> fetchPopularDrinks() async {
    emit(PopularDrinksLoading());
    try {
      final result = await CocktailApiProvider().fetchPopularDrinks();
      emit(PopularDrinksLoaded(popularDrinks: result));
    } on Exception {
      emit(PopularDrinksFailure());
    }
  }
}
