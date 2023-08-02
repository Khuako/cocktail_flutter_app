part of 'search_cubit.dart';

abstract class SearchState extends Equatable {
  const SearchState();

  @override
  List<Object> get props => [];
}

class SearchInitial extends SearchState {}

class SearchLoading extends SearchState {}

class SearchFoundNone extends SearchState {}

class SearchFound extends SearchState {
  final List<DrinkInfo> searchList;

  const SearchFound({required this.searchList});
}

class SearchFailure extends SearchState {}
