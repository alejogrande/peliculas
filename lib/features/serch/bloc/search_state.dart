part of 'search_bloc.dart';

@immutable
abstract class SearchState {}

class SearchLoading extends SearchState {}

class SearchError extends SearchState {
  String? message;
  SearchError(this.message);
}

class SearchEmpty extends SearchState {}

class SearchHasData extends SearchState {
  Movies? data;
  SearchHasData({this.data});
}
