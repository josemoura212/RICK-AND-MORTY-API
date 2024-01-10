import 'package:flutter/material.dart';

class ImagePerson extends StatelessWidget {
  final String image;
  const ImagePerson({super.key, required this.image});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(200),
      decoration: BoxDecoration(
          image: DecorationImage(
            image: NetworkImage(image),
            fit: BoxFit.cover,
          ),
          borderRadius:
              const BorderRadius.vertical(bottom: Radius.circular(30)),
          boxShadow: const [BoxShadow(blurRadius: 3, spreadRadius: 2)]),
    );
  }
}
