import 'package:bloc/bloc.dart';
import 'package:cocktail_project/data/repositories/database_repository.dart';
import 'package:equatable/equatable.dart';

import '../data/repositories/auth_repository.dart';

part 'favorite_list_state.dart';

class FavoriteListCubit extends Cubit<FavoriteListState> {
  FavoriteListCubit() : super(FavoriteListInitial());
  DatabaseReposiory databaseReposiory =
      DatabaseReposiory(AuthRepository().firebaseAuth.currentUser!.uid);
  Future<void> fetchFavoriteList() async {
    emit(FavoriteListLoading());
    try {
      final result = await databaseReposiory.getUserFavorite();
      emit(FavoriteListLoaded(favDrinks: result));
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
