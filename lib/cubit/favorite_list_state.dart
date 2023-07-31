part of 'favorite_list_cubit.dart';

abstract class FavoriteListState extends Equatable {
  const FavoriteListState();

  @override
  List<Object> get props => [];
}

class FavoriteListInitial extends FavoriteListState {}

class FavoriteListLoading extends FavoriteListState {}

class FavoriteListLoaded extends FavoriteListState {
  final List<dynamic>? favDrinks;

  FavoriteListLoaded({required this.favDrinks});
}
