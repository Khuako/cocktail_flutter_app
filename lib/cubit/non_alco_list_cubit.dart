import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import '../api_provider/cocktail_api_provider.dart';
import '../model/alcoholic_model.dart';

part 'non_alco_list_state.dart';

class NonAlcoListCubit extends Cubit<NonAlcoListState> {
  NonAlcoListCubit() : super(NonAlcoListInitial());
  Future<void> fetchNonAlcoDrinks() async {
    emit(NonAlcoListLoading());
    try {
      final result = await CocktailApiProvider().fetchDrinks(false);
      emit(NonAlcoListLoaded(alcoDrinks: result));
    } on Exception catch (e) {
      emit(NonAlcoListFailure(e: e));
    }
  }
}
