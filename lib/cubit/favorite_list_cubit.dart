import 'dart:io';

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
      final res = await InternetAddress.lookup('example.com');
      if (res.isNotEmpty && res[0].rawAddress.isNotEmpty) {
        print('connected');
              final result = await databaseReposiory.getUserFavorite();
      emit(FavoriteListLoaded(favDrinks: result));
      }
    } on SocketException catch (e) {
      emit(FavoriteListFailure());
    }
  }
}
