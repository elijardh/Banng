import 'dart:async';

import 'package:bang/Controller/Services.dart';
import 'package:bang/Model/CharacterProfile.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'popular_heroes_event.dart';
part 'popular_heroes_state.dart';

class PopularHeroesBloc extends Bloc<PopularHeroesEvent, PopularHeroesState> {

  @override
  PopularHeroesState get initialState => PopularHeroesInitial();
  Popular _popular = new Popular();

  @override
  Stream<PopularHeroesState> mapEventToState(
    PopularHeroesEvent event,
  ) async* {
    // TODO: implement mapEventToState
    if(event is GetPopularHeroes){
      yield PopularHeroesLoading();
      final List<CharacterProfile> popList = await _popular.getPopular();
      yield PopularHeroesLoaded(popList);
    }
  }
}
