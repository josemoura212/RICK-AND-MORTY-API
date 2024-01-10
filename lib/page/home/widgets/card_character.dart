import 'package:flutter/material.dart';
import 'package:rick_morty/model/person_model.dart';
import 'package:rick_morty/page/character/text_custom.dart';

class CardCharacter extends StatelessWidget {
  final PersonModel person;
  const CardCharacter({super.key, required this.person});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, '/character', arguments: person);
      },
      child: Card(
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(70),
              decoration: BoxDecoration(
                borderRadius:
                    const BorderRadius.horizontal(left: Radius.circular(8)),
                image: DecorationImage(
                    image: NetworkImage(person.image), fit: BoxFit.cover),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(10, 5, 0, 5),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextCustom(info: 'Id: ', value: person.id.toString()),
                    TextCustom(info: 'Name: ', value: person.name),
                    TextCustom(info: 'Specie: ', value: person.species),
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
