part of 'alco_list_cubit.dart';

@immutable
abstract class AlcoListState extends Equatable {}

class AlcoListInitial extends AlcoListState {
  @override

  List<Object?> get props => [];
}

class AlcoListLoading extends AlcoListState {
  @override

  List<Object?> get props => [];
}

class AlcoListLoaded extends AlcoListState {
  final List<Drinks> alcoDrinks;
  AlcoListLoaded({required this.alcoDrinks});
  @override

  List<Object?> get props => [alcoDrinks];
}

class AlcoListFailure extends AlcoListState {
  final Exception e;
  AlcoListFailure({required this.e});
  @override

  List<Object?> get props => [];
}
