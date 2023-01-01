import 'package:dutch_app/configuration/style.dart';
import 'package:flutter/material.dart';

class EnteredItemCard extends StatelessWidget {
  const EnteredItemCard({Key? key, this.number, required this.value})
      : super(key: key);

  final int? number;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: cardColor,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            if (number != null)
              Text(
                "${(number! + 1).toString()}. ",
                style: bodyMedium,
              ),
            Text(value, style: bodyMedium),
          ],
        ),
      ),
    );
  }
}
