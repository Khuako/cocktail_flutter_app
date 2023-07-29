part of 'cocktail_detail_cubit.dart';

abstract class CocktailDetailState extends Equatable {
  const CocktailDetailState();

  @override
  List<Object> get props => [];
}

class CocktailDetailInitial extends CocktailDetailState {}

class CocktailDetailLoading extends CocktailDetailState {}

class CocktailDetailLoaded extends CocktailDetailState {
  final DrinkInfo drinkInfo;
  const CocktailDetailLoaded({required this.drinkInfo});
}
