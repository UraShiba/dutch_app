import 'package:dutch_app/bloc/parking_fee/parking_fee_cubit.dart';
import 'package:dutch_app/calculate_page/widget/entered_item_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ParkingFeeListview extends StatelessWidget {
  const ParkingFeeListview({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ScrollController _scrollController = ScrollController();
    return BlocBuilder<ParkingFeeCubit, List<int>>(
      builder: ((context, state) => state.isNotEmpty
          ? ListView.builder(
              controller: _scrollController,
              shrinkWrap: true,
              itemCount: state.length,
              itemBuilder: (context, index) => EnteredItemCard(
                  number: index, value: "${state[index].toString()} yen"))
          : Container()),
    );
  }
}
