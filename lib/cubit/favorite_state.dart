part of 'favorite_cubit.dart';

abstract class FavoriteState extends Equatable {
  const FavoriteState();

  @override
  List<Object> get props => [];
}

class FavoriteInitial extends FavoriteState {
}
class FavoriteWhite extends FavoriteState {
}
class FavoriteRed extends FavoriteState {
}