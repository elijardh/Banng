part of 'popular_heroes_bloc.dart';

abstract class PopularHeroesState extends Equatable {
  PopularHeroesState([List props = const []]) :super(props);
}

class PopularHeroesInitial extends PopularHeroesState {
  @override
  List<Object> get props => [];
}

class PopularHeroesLoading extends PopularHeroesState {

}

class PopularHeroesLoaded extends PopularHeroesState {
  final List<CharacterProfile> heroList;

  PopularHeroesLoaded(this.heroList);
}