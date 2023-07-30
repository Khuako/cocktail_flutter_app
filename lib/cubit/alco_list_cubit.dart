import 'package:bloc/bloc.dart';
import 'package:cocktail_project/data/api_provider/cocktail_api_provider.dart';
import 'package:cocktail_project/model/alcoholic_model.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

part 'alco_list_state.dart';

class AlcoListCubit extends Cubit<AlcoListState> {
  AlcoListCubit() : super(AlcoListInitial());
  Future<void> fetchAlcoDrinks() async {
    emit(AlcoListLoading());
    try {
      final result = await CocktailApiProvider().fetchDrinks(true);
      emit(AlcoListLoaded(alcoDrinks: result));
    } on Exception catch (e) {
      emit(AlcoListFailure(e: e));
    }
  }
}
