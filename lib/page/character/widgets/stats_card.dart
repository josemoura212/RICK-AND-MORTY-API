import 'package:flutter/material.dart';
import 'package:rick_morty/model/person_model.dart';
import 'package:rick_morty/page/character/widgets/text_custom.dart';

class StatsCard extends StatelessWidget {
  final PersonModel person;
  const StatsCard({super.key, required this.person});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(10, 10, 100, 10),
      decoration: BoxDecoration(
          color: const Color.fromARGB(255, 207, 240, 208),
          boxShadow: const [BoxShadow(blurRadius: 4, spreadRadius: 3)],
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
    );
  }
}
