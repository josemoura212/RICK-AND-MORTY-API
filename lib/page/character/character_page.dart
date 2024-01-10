import 'package:flutter/material.dart';
import 'package:rick_morty/model/person_model.dart';
import 'package:rick_morty/page/character/widgets/image_person.dart';
import 'package:rick_morty/page/character/widgets/stats_card.dart';

class CharacterPage extends StatelessWidget {
  final PersonModel person;
  const CharacterPage({super.key, required this.person});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            color: Colors.black,
            image: DecorationImage(
              image: AssetImage('assets/images/peakpx.jpg'),
              fit: BoxFit.cover,
              opacity: .3,
            ),
          ),
          child: Column(
            children: [
              ImagePerson(image: person.image),
              const Spacer(),
              StatsCard(person: person),
              const Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}
