part of 'random_bloc.dart';

abstract class RandomState extends Equatable {
  RandomState([List props = const []]) : super(props);
}

class RandomInitial extends RandomState {
  @override
  List<Object> get props => [];
}

class RandomLoading extends RandomState{

}

class RandomLoaded extends RandomState{
  final List<CharacterProfile> randomList;

  RandomLoaded(this.randomList) : super([randomList]);
}