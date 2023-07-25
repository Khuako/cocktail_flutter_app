part of 'random_cocktail_cubit.dart';

abstract class RandomCocktailState extends Equatable {
  const RandomCocktailState();

  @override
  List<Object> get props => [];
}

class RandomCocktailInitial extends RandomCocktailState {}

class RandomCocktailLoading extends RandomCocktailState {}

class RandomCocktailLoaded extends RandomCocktailState {
  final DrinkInfo drinkInfo;
  RandomCocktailLoaded({required this.drinkInfo});
}
