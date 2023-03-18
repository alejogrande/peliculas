part of 'detail_bloc.dart';

@immutable
abstract class DetailEvent {}

class LoadDetails extends DetailEvent {
  String search;
  LoadDetails(this.search);
}
