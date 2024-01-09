import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import 'package:rick_morty/model/person_model.dart';
import 'package:rick_morty/repository/rick_and_morty_repository.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  final RickAndMortyRepository repository;
  int page = 1;

  HomeCubit(this.repository) : super(HomeInitial());

  Future<void> fetchPage() async {
    if (state is HomeLoading) return;
    final currentState = state;

    List<PersonModel> currentCharacters =
        (currentState is HomeSuccess) ? currentState.characters : [];

    emit(HomeLoading(characters: currentCharacters));

    try {
      final newCharacters = await repository.findAllPerson(page: page);

      if (newCharacters.isEmpty) {
        emit(HomeSuccess(characters: currentCharacters, hasReachedMax: true));
      } else {
        page++;
        emit(HomeSuccess(
            characters: [...currentCharacters, ...newCharacters],
            hasReachedMax: false));
      }
    } catch (e) {
      emit(const HomeError('error'));
    }
  }
}
