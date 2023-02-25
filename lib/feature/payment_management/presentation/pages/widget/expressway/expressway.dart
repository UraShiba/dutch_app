import 'package:dutch_app/feature/payment_management/presentation/bloc/highway_tool/highway_tool_cubit.dart';
import 'package:dutch_app/feature/payment_management/presentation/pages/widget/common/entered_item_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HighwayToolListView extends StatelessWidget {
  const HighwayToolListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ScrollController _scrollController = ScrollController();
    return BlocBuilder<HighwayToolCubit, List<int>>(
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
