import 'package:flutter/material.dart';

class TopicSection extends StatelessWidget {
  const TopicSection({Key? key, required this.enteredItemCard})
      : super(key: key);

  final Widget enteredItemCard;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        enteredItemCard,
      ],
    );
  }
}
