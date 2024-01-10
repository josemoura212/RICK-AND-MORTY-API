import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import 'package:rick_morty/model/person_model.dart';
import 'package:rick_morty/repository/rick_and_morty_repository.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  final RickAndMortyRepository repository;

  HomeCubit(this.repository) : super(HomeInitial());

  Future<void> fetchPage() async {
    if (state is HomeLoading) return;
    final currentState = state;

    List<PersonModel> currentCharacters =
        (currentState is HomeSuccess) ? currentState.characters : [];

    emit(HomeLoading(
        characters: currentCharacters,
        hasReachedMax: false,
        page: currentState.page));

    try {
      final newCharacters =
          await repository.findAllPerson(page: currentState.page);

      if (newCharacters.isEmpty) {
        emit(HomeSuccess(
            characters: currentCharacters,
            hasReachedMax: true,
            page: currentState.page));
      } else {
        emit(HomeSuccess(
            characters: [...currentCharacters, ...newCharacters],
            hasReachedMax: false,
            page: currentState.page + 1));
      }
    } catch (e) {
      emit(const HomeError('error'));
    }
  }

  Future<void> fetchBySpecies(String species) async {
    if (state is HomeLoading) return;
    emit(HomeInitial());
    final currentState = state;

    List<PersonModel> currentCharacters =
        (currentState is HomeSuccess) ? currentState.characters : [];

    emit(HomeLoading(
        characters: currentCharacters,
        hasReachedMax: false,
        page: currentState.page));

    try {
      final newCharacters = await repository.findAllBySpecies(
          page: currentState.page, species: species);

      if (newCharacters.isEmpty) {
        emit(HomeSuccess(
            characters: currentCharacters,
            hasReachedMax: true,
            page: currentState.page));
      } else {
        final pageNext = currentState.page + 1;
        emit(HomeSuccess(
            characters: [...currentCharacters, ...newCharacters],
            hasReachedMax: false,
            page: pageNext));
      }
    } catch (e) {
      emit(const HomeError('error'));
    }
  }
}
