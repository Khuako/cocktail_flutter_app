import 'package:bloc/bloc.dart';
import 'package:cocktail_project/data/api_provider/cocktail_api_provider.dart';
import 'package:cocktail_project/model/cocktail_model.dart';
import 'package:equatable/equatable.dart';

part 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  SearchCubit() : super(SearchInitial());
  Future<void> fetchSearch(String query) async {
    emit(SearchLoading());
    try {
      final result = await CocktailApiProvider().fetchSearchList(query);
      if (result.drinks!.isNotEmpty) {
        emit(SearchFound(searchList: result.drinks!));
      } else {
        emit(SearchFoundNone());
      }
    } catch (e) {
      emit(SearchFailure());
    }
  }
}
