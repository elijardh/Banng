import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:bang/Controller/Services.dart';
import 'package:bang/Model/CharacterProfileList.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:http/http.dart' as http;

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
      try{
//        final CharacterProfileList list = await _searchCharacter.getCharacter(event.searchName);
//        print(list.response);

        CharacterProfileList _characterProfileList = new CharacterProfileList();
        String url = "https://superheroapi.com/api/1907388712734798/search/${event.searchName}";
        http.Response response = await http.get(url);
        if(response.statusCode == 200){

          String respons = json.decode(response.body)["response"];
          if(respons == "error"){
            print("Shitttt");
            yield SearchFailed(response.body);
          }

          _characterProfileList = CharacterProfileList.fromJson(json.decode(response.body));
          if(_characterProfileList.response == "success"){
            yield SearchLoaded(_characterProfileList);
          }
        }
        else{
          yield SearchFailed(response.body);
        }


      }
      catch(e){
        print(e);
        yield SearchFailed(e);
      }
    }
  }
}
