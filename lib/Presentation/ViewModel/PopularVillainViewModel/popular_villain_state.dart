part of 'popular_villain_bloc.dart';

abstract class PopularVillainState extends Equatable {
  PopularVillainState([List props = const[]]) : super(props);
}

class PopularVillainInitial extends PopularVillainState {
  @override
  List<Object> get props => [];
}

class PopularVillainLoading extends PopularVillainState{

}

class PopularVillainLoaded extends PopularVillainState{
  final List<CharacterProfile> list;

  PopularVillainLoaded(this.list);
}