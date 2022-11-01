import 'package:dutch_app/bloc/gas_fee_bloc.dart';
import 'package:dutch_app/bloc/gas_fee_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ExpansionGasFee extends StatelessWidget {
  const ExpansionGasFee({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ScrollController _scrollController = ScrollController();
    return ExpansionTile(
      title: const Text("List view"),
      children: [
        BlocBuilder<GasFeeCubit, GasFeeCalculatorState>(
          builder: ((context, state) => Text(
              "${context.read<GasFeeCubit>().calculateGasFee().toString()} yen")),
        )
      ],
    );
  }
}
