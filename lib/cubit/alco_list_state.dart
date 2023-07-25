part of 'alco_list_cubit.dart';

@immutable
abstract class AlcoListState extends Equatable {}

class AlcoListInitial extends AlcoListState {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class AlcoListLoading extends AlcoListState {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class AlcoListLoaded extends AlcoListState {
  final List<Drinks> alcoDrinks;
  AlcoListLoaded({required this.alcoDrinks});
  @override
  // TODO: implement props
  List<Object?> get props => [alcoDrinks];
}

class AlcoListFailure extends AlcoListState {
  Exception e;
  AlcoListFailure({required this.e});
  @override
  // TODO: implement props
  List<Object?> get props => [];
}
