import 'package:flutter/material.dart';

class InputtedCard extends StatelessWidget {
  const InputtedCard({Key? key, required this.number, required this.value})
      : super(key: key);

  final int number;
  final int value;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Color.fromARGB(255, 153, 211, 221),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("No. ${number.toString()}"),
            Text("${value.toString()} yen"),
          ],
        ),
      ),
    );
  }
}
