part of 'random_bloc.dart';

abstract class RandomEvent extends Equatable {
  RandomEvent([List props = const []]) : super(props);
}

class GetRandomChar extends RandomEvent {
}