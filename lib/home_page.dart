import 'package:dutch_app/bloc/gas_fee_bloc.dart';
import 'package:dutch_app/bloc/highway_bloc.dart';
import 'package:dutch_app/bloc/gas_fee_state.dart';
import 'package:dutch_app/model/highway_tool.dart';
import 'package:dutch_app/widget/expand_gas_fee.dart';
import 'package:dutch_app/widget/expansion_fare_list_view.dart';
import 'package:dutch_app/widget/gas_imput_card.dart';
import 'package:dutch_app/widget/normal_input_card.dart';
import 'package:dutch_app/widget/topic_section.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("TBD"),
        ),
        body: MultiBlocProvider(
          providers: [
            BlocProvider(
              create: (_) => HighwayItemsCubit(),
            ),
            BlocProvider(
              create: (_) => GasFeeCubit(),
            )
          ],
          child: SingleChildScrollView(
            child: Column(
              children: [
                const TopicSection(
                  topicName: "Highway tool",
                  topicCard: NormalInputCard(itemName: "fare"),
                  expansionTile: ExpansionFareListView(),
                ),
                const TopicSection(
                  topicName: "Gas fee",
                  topicCard: GasInputCard(),
                  expansionTile: ExpansionGasFee(),
                ),
                const TopicSection(
                  topicName: "People",
                  topicCard: NormalInputCard(itemName: "number"),
                ),
                BlocBuilder<GasFeeCubit, GasFeeState>(
                    builder: (context, state) {
                  return TopicSection(topicName: "Sum", topicCard: SumCard());
                })
              ],
            ),
          ),
        ));
  }
}

class SumCard extends StatelessWidget {
  const SumCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(context.read<GasFeeCubit>().calculateGasFee().toString());
  }
}
