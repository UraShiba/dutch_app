import 'package:dutch_app/bloc/gas_fee/gas_fee_cubit.dart';
import 'package:dutch_app/bloc/gas_fee/gas_fee_state.dart';
import 'package:dutch_app/calculate_page/widget/entered_item_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GasFee extends StatelessWidget {
  const GasFee({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GasFeeCubit, GasFeeCalculatorState>(
      builder: ((context, state) {
        final value = context.read<GasFeeCubit>().getGasFee();
        final Widget widget;
        value > 0
            ? widget = EnteredItemCard(value: "${value.toString()} yen")
            : widget = Container();
        return widget;
      }),
    );
  }
}
