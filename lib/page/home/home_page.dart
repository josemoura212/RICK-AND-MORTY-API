import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:rick_morty/page/home/cubit/home_cubit.dart';
import 'package:rick_morty/page/home/widgets/card_character.dart';
import 'package:rick_morty/page/home/widgets/filter_species.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _scrollController = ScrollController();

  void _onScroll() {
    if (_isBottom(context.read<HomeCubit>().state)) {
      context.read<HomeCubit>().fetchPage();
    }
  }

  bool _isBottom(HomeState state) {
    if (!_scrollController.hasClients) return false;
    final maxScroll = _scrollController.position.maxScrollExtent;
    final currentScroll = _scrollController.offset;
    return currentScroll >= maxScroll * 0.9 && state is! HomeLoading;
  }

  @override
  void dispose() {
    _scrollController
      ..removeListener(_onScroll)
      ..dispose();

    super.dispose();
  }

  @override
  void initState() {
    _scrollController.addListener(_onScroll);
    context.read<HomeCubit>().fetchPage();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Rick and Morty'),
      ),
      body: Column(
        children: [
          const FilterSpecies(),
          Expanded(
            child: BlocBuilder<HomeCubit, HomeState>(
              builder: (context, state) {
                if (state is HomeError) {
                  return const Center(child: Text('error ao carregar'));
                } else if (state is HomeSuccess) {
                  return ListView.builder(
                    itemCount: state.hasReachedMax
                        ? state.characters.length
                        : state.characters.length + 1,
                    controller: _scrollController,
                    itemBuilder: (context, index) {
                      if (index >= state.characters.length) {
                        return state.hasReachedMax
                            ? const SizedBox()
                            : const Center(
                                child: SizedBox(
                                  height: 24,
                                  width: 24,
                                  child: CircularProgressIndicator(
                                      strokeWidth: 1.5),
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
                  controller: _scrollController,
                  itemBuilder: (context, index) {
                    if (index >= state.characters.length) {
                      return state.hasReachedMax
                          ? const SizedBox()
                          : const Center(
                              child: SizedBox(
                                height: 24,
                                width: 24,
                                child:
                                    CircularProgressIndicator(strokeWidth: 1.5),
                              ),
                            );
                    }
                    return CardCharacter(person: state.characters[index]);
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
