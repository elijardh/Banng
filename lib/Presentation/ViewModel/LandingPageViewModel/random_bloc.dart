import 'dart:async';

import 'package:bang/Controller/Services.dart';
import 'package:bang/Model/CharacterProfile.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'random_event.dart';
part 'random_state.dart';

class RandomBloc extends Bloc<RandomEvent, RandomState> {

  RandomHeroes _randomHeroes = new RandomHeroes();
/*  RandomBloc() : super(RandomInitial());*/
  @override
  RandomState get initialState => RandomInitial();

  @override
  Stream<RandomState> mapEventToState(
    RandomEvent event,
  ) async* {
    // TODO: implement mapEventToState
    if(event is GetRandomChar){
      yield RandomLoading();
      final List<CharacterProfile> randList = await _randomHeroes.getRandom();
      yield RandomLoaded(randList);
    }
  }
}
