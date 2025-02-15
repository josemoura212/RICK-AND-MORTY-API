import 'package:flutter/material.dart';
import 'package:rick_morty/page/home/widgets/filter_species.dart';

class SectionSearch extends StatelessWidget {
  final TextEditingController textController;
  const SectionSearch({super.key, required this.textController});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(12, 50, 12, 50),
      child: Column(
        children: [
          TextField(
            onTapOutside: (event) => FocusScope.of(context).unfocus(),
            onChanged: (value) {},
            controller: textController,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              fillColor: Colors.white,
              filled: true,
              hintText: 'Search',
              prefixIcon: Icon(Icons.search),
            ),
          ),
          const SizedBox(
            height: 16,
          ),
          const FilterSpecies(),
        ],
      ),
    );
  }
}
