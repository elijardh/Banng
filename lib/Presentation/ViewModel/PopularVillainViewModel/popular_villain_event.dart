part of 'popular_villain_bloc.dart';

abstract class PopularVillainEvent extends Equatable {
  PopularVillainEvent([List props = const[]]):super(props);
}

class GetPopVil extends PopularVillainEvent{

}