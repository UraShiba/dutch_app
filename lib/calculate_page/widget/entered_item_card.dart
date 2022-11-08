import 'package:flutter/material.dart';

class EnteredItemCard extends StatelessWidget {
  const EnteredItemCard({Key? key, this.number, required this.value})
      : super(key: key);

  final int? number;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: const Color((0xFFF6F9FC)),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            if (number != null) Text("${(number! + 1).toString()}. "),
            Text(value),
          ],
        ),
      ),
    );
  }
}
