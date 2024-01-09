import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_morty/page/home/cubit/home_cubit.dart';
import 'package:rick_morty/page/home/widgets/card_character.dart';

class ListViewPerson extends StatelessWidget {
  final ScrollController scrollController;
  const ListViewPerson({super.key, required this.scrollController});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        if (state is HomeError) {
          return const Center(child: Text('error ao carregar'));
        } else if (state is HomeSuccess) {
          return ListView.builder(
            itemCount: state.hasReachedMax
                ? state.characters.length
                : state.characters.length + 1,
            controller: scrollController,
            itemBuilder: (context, index) {
              if (index >= state.characters.length) {
                return state.hasReachedMax
                    ? const SizedBox()
                    : const Center(
                        child: SizedBox(
                          height: 24,
                          width: 24,
                          child: CircularProgressIndicator(strokeWidth: 1.5),
                        ),
                      );
              }
              return CardCharacter(person: state.characters[index]);
            },
          );
        }
        return ListView.builder(
          itemCount: state.hasReachedMax
              ? state.characters.length
              : state.characters.length + 1,
          controller: scrollController,
          itemBuilder: (context, index) {
            if (index >= state.characters.length) {
              return state.hasReachedMax
                  ? const SizedBox()
                  : const Center(
                      child: SizedBox(
                        height: 24,
                        width: 24,
                        child: CircularProgressIndicator(strokeWidth: 1.5),
                      ),
                    );
            }
            return CardCharacter(person: state.characters[index]);
          },
        );
      },
    );
  }
}
