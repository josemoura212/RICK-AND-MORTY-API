import 'package:flutter/material.dart';

class TextCustom extends StatelessWidget {
  final String info;
  final String value;
  const TextCustom({super.key, required this.info, required this.value});

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      overflow: TextOverflow.ellipsis,
      TextSpan(
        text: info,
        style: const TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
        children: [
          TextSpan(
            text: value,
            style: const TextStyle(
              fontSize: 16,
            ),
          ),
        ],
      ),
    );
  }
}
