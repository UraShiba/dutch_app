import 'package:dutch_app/bloc/gas_fee_bloc.dart';
import 'package:dutch_app/bloc/highway_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TopicSection extends StatelessWidget {
  const TopicSection(
      {Key? key, required this.topicName, this.topicCard, this.expansionTile})
      : super(key: key);

  final String topicName;

  final Widget? topicCard;
  final Widget? expansionTile;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            topicName,
            textAlign: TextAlign.left,
          ),
        ),
        topicCard ?? Container(),
        expansionTile ?? Container()
      ],
    );
  }
}
