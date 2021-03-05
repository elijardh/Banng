part of 'popular_heroes_bloc.dart';

abstract class PopularHeroesEvent extends Equatable {
  PopularHeroesEvent([List props = const[]]) : super(props);
}

class GetPopularHeroes extends PopularHeroesEvent{
/*  final List<int> heroesIndex;
  GetPopularHeroes(this.heroesIndex);*/
}
