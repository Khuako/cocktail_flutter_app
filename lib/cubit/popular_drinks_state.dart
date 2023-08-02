part of 'popular_drinks_cubit.dart';

abstract class PopularDrinksState extends Equatable {
  const PopularDrinksState();

  @override
  List<Object> get props => [];
}

class PopularDrinksInitial extends PopularDrinksState {}

class PopularDrinksLoading extends PopularDrinksState {}

class PopularDrinksLoaded extends PopularDrinksState {
  final List<Drinks> popularDrinks;
  const PopularDrinksLoaded({required this.popularDrinks});
}

class PopularDrinksFailure extends PopularDrinksState {}
