part of 'search_bloc.dart';

@immutable
abstract class SearchEvent {}

class LoadSearch extends SearchEvent {
  String search;
  LoadSearch(this.search);
}
