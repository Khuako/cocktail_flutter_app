import 'package:bloc/bloc.dart';
import 'package:cocktail_project/data/api_provider/cocktail_api_provider.dart';
import 'package:equatable/equatable.dart';

import '../model/cocktail_model.dart';

part 'cocktail_detail_state.dart';

class CocktailDetailCubit extends Cubit<CocktailDetailState> {
  CocktailDetailCubit() : super(CocktailDetailInitial());
  Future<void> fetchCocktailById(String cocktailId) async {
    emit(CocktailDetailLoading());
    try {
      final result = await CocktailApiProvider().fetchCocktailById(cocktailId);
      emit(CocktailDetailLoaded(drinkInfo: result));
    } catch (e) {
      emit(CocktailDetailLoading());
    }
  }
}
