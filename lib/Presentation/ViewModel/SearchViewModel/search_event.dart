part of 'search_bloc.dart';

abstract class SearchEvent extends Equatable {
  SearchEvent([List props = const []]) : super(props);
}

class Search extends SearchEvent {
  final String searchName;
  Search(this.searchName);
}