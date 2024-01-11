part of 'home_cubit.dart';

sealed class HomeState extends Equatable {
  final List<PersonModel> characters;
  final bool hasReachedMax;
  final int page;
  final Species species;

  const HomeState({
    this.characters = const [],
    this.hasReachedMax = false,
    this.page = 1,
    this.species = Species.all,
  });

  @override
  List<Object> get props => [
        characters,
        hasReachedMax,
      ];
}

final class HomeInitial extends HomeState {}

final class HomeLoading extends HomeState {
  const HomeLoading({
    required super.characters,
    required super.hasReachedMax,
    required super.page,
    required super.species,
  });
}

final class HomeSuccess extends HomeState {
  const HomeSuccess({
    required super.characters,
    required super.hasReachedMax,
    required super.page,
    required super.species,
  });
}

final class HomeError extends HomeState {
  final String message;

  const HomeError(this.message);

  @override
  List<Object> get props => [message];
}
