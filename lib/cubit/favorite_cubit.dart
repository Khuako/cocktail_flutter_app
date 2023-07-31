import 'package:bloc/bloc.dart';
import 'package:cocktail_project/data/repositories/auth_repository.dart';
import 'package:cocktail_project/data/repositories/database_repository.dart';
import 'package:cocktail_project/model/alcoholic_model.dart';
import 'package:equatable/equatable.dart';

part 'favorite_state.dart';

class FavoriteCubit extends Cubit<FavoriteState> {
  DatabaseReposiory databaseReposiory =
      DatabaseReposiory(AuthRepository().firebaseAuth.currentUser!.uid);
  FavoriteCubit() : super(FavoriteInitial());

  Future<void> checkIfFavored(imageUrl, title, id) async {
    if (await databaseReposiory.isFavorited(
        imageUrl: imageUrl, title: title, id: id)) {
      emit(FavoriteRed());
    } else {
      emit(FavoriteWhite());
    }
  }

  Future<void> addOrRemove(imageUrl, title, id) async {
    if (state is FavoriteRed) {
      emit(FavoriteWhite());
    } else {
      emit(FavoriteRed());
    }
    await databaseReposiory.addOrRemoveFromFavorite(
        imageUrl: imageUrl, title: title, id: id);
    checkIfFavored(imageUrl, title, id);
  }
}
