import 'package:flutter/material.dart';

class FilterSpecies extends StatefulWidget {
  const FilterSpecies({
    super.key,
  });

  @override
  State<FilterSpecies> createState() => _FilterSpeciesState();
}

class _FilterSpeciesState extends State<FilterSpecies> {
  static const species = <String>[
    'All',
    'Human',
    'Alien',
  ];
  String dropdownValue = species.first;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        const Text('Species'),
        DropdownButton(
          value: dropdownValue,
          items: species
              .map<DropdownMenuItem<String>>(
                  (species) => DropdownMenuItem<String>(
                        value: species,
                        child: Text(species),
                      ))
              .toList(),
          onChanged: (String? value) {},
        )
      ],
    );
  }
}
