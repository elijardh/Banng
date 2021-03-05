import 'dart:async';

import 'package:bang/Model/CharacterProfile.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:bang/Controller/Services.dart';

part 'popular_villain_event.dart';
part 'popular_villain_state.dart';

class PopularVillainBloc extends Bloc<PopularVillainEvent, PopularVillainState> {
  //PopularVillainBloc() : super(PopularVillainInitial());
  Villains _villains = new Villains();
  PopularVillainState get initialState => PopularVillainInitial();
  @override
  Stream<PopularVillainState> mapEventToState(
    PopularVillainEvent event,
  ) async* {
    // TODO: implement mapEventToState
    if(event is GetPopVil){
      yield PopularVillainLoading();
      final List<CharacterProfile> list = await _villains.getPopular();
      yield PopularVillainLoaded(list);
    }
  }
}
