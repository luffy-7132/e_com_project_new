part of 'search_cubit.dart';

@immutable
sealed class SearchState {}

final class SearchInitialState extends SearchState {}

final class SearchLoadingState extends SearchState {}

final class SearchLoadedState extends SearchState {
  SearchModel searchModel;
  SearchLoadedState({required this.searchModel});
}

final class SearchErrorState extends SearchState {
  String Error;
  SearchErrorState({required this.Error});
}
