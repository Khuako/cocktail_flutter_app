part of 'ing_cubit.dart';

abstract class IngState extends Equatable {
  const IngState();

  @override
  List<Object> get props => [];
}

class IngInitial extends IngState {}

class IngLoading extends IngState {}

class IngLoaded extends IngState {
  final List<Drinks> drinks;

  const IngLoaded({required this.drinks});

}

class IngFailure extends IngState {}
