import 'package:flutter/material.dart';
import 'package:rick_morty/model/person_model.dart';
import 'package:rick_morty/page/character/text_custom.dart';

class CharacterPage extends StatelessWidget {
  final PersonModel person;
  const CharacterPage({super.key, required this.person});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(200),
              decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(person.image),
                    fit: BoxFit.cover,
                  ),
                  borderRadius:
                      const BorderRadius.vertical(bottom: Radius.circular(30))),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                padding: const EdgeInsets.fromLTRB(10, 10, 100, 10),
                decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 207, 240, 208),
                    boxShadow: const [
                      BoxShadow(blurRadius: 3, spreadRadius: 2)
                    ],
                    borderRadius: BorderRadius.circular(10)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextCustom(info: 'Name: ', value: person.name),
                    TextCustom(info: 'Specie: ', value: person.species),
                    TextCustom(info: 'Status: ', value: person.status),
                    TextCustom(info: 'Gender: ', value: person.gender),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
