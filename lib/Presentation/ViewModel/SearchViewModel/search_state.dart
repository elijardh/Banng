part of 'search_bloc.dart';

abstract class SearchState extends Equatable {
  SearchState([List props = const[]]) : super(props);
}

class SearchInitial extends SearchState {
  @override
  List<Object> get props => [];
}

class SearchLoading extends SearchState{

}

class SearchLoaded extends SearchState{
  CharacterProfileList characterProfileList;
  SearchLoaded(this.characterProfileList);
}

class SearchFailed extends SearchState{
  final String fail;
  SearchFailed(this.fail);
}
