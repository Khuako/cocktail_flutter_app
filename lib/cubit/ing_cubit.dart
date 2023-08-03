import 'package:bloc/bloc.dart';
import 'package:cocktail_project/data/api_provider/cocktail_api_provider.dart';
import 'package:cocktail_project/model/alcoholic_model.dart';

import 'package:equatable/equatable.dart';

part 'ing_state.dart';

class IngCubit extends Cubit<IngState> {
  IngCubit() : super(IngInitial());
  Future<void> fetchIngDrinks(String query) async {
    emit(IngLoading());
    try {
      final result = await CocktailApiProvider().fetchIngridientDrinks(query);
      emit(IngLoaded(drinks: result.drinks!));
    } catch (e) {
      emit(IngFailure());
    }
  }
}
