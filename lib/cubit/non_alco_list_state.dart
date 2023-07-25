part of 'non_alco_list_cubit.dart';

@immutable
abstract class NonAlcoListState extends Equatable {}

class NonAlcoListInitial extends NonAlcoListState {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class NonAlcoListLoading extends NonAlcoListState {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class NonAlcoListLoaded extends NonAlcoListState {
  final List<Drinks> alcoDrinks;
  NonAlcoListLoaded({required this.alcoDrinks});
  @override
  // TODO: implement props
  List<Object?> get props => [alcoDrinks];
}

class NonAlcoListFailure extends NonAlcoListState {
  Exception e;
  NonAlcoListFailure({required this.e});
  @override
  // TODO: implement props
  List<Object?> get props => [];
}
