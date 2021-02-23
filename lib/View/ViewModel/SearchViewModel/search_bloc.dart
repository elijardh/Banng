import 'dart:async';

import 'package:bang/Controller/Services.dart';
import 'package:bang/Model/CharacterProfileList.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'search_event.dart';
part 'search_state.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  SearchCharacter _searchCharacter = new SearchCharacter();
  //SearchBloc() : super(SearchInitial());
  SearchState get initialState => SearchInitial();
  @override
  Stream<SearchState> mapEventToState(
    SearchEvent event,
  ) async* {
    // TODO: implement mapEventToState
    if(event is Search){
      yield SearchLoading();
      final CharacterProfileList list = await _searchCharacter.getCharacter(event.searchName);
      yield SearchLoaded(list);
    }
  }
}
