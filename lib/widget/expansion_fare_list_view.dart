import 'package:dutch_app/bloc/highway_bloc.dart';
import 'package:dutch_app/home_page.dart';
import 'package:dutch_app/widget/imputted_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ExpansionFareListView extends StatelessWidget {
  const ExpansionFareListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ScrollController _scrollController = ScrollController();
    return ExpansionTile(
      title: const Text("List view"),
      children: [
        BlocBuilder<HighwayItemsCubit, List<int>>(
          builder: ((context, state) => ListView.builder(
              controller: _scrollController,
              shrinkWrap: true,
              itemCount: state.length,
              itemBuilder: (context, index) =>
                  InputtedCard(number: index, value: state[index]))),
        )
      ],
    );
  }
}
