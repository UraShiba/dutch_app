import 'package:dutch_app/bloc/gas_fee/gas_fee_cubit.dart';
import 'package:dutch_app/bloc/highway_tool/highway_tool_cubit.dart';
import 'package:dutch_app/bloc/member/member_cubit.dart';
import 'package:dutch_app/bloc/total_amount/total_amount_cubit.dart';
import 'package:dutch_app/calculate_page/widget/expense_items/member_listview.dart';
import 'package:dutch_app/calculate_page/widget/input_card/member_input_card.dart';
import 'package:dutch_app/calculate_page/widget/input_card/price_per_person_card.dart';
import 'package:dutch_app/calculate_page/widget/expense_items/gas_fee.dart';
import 'package:dutch_app/calculate_page/widget/expense_items/highway_tool_listview.dart';
import 'package:dutch_app/calculate_page/widget/input_card/gas_input_card.dart';
import 'package:dutch_app/calculate_page/widget/input_card/highway_tool_input_card.dart';
import 'package:dutch_app/calculate_page/widget/topic_section.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CalculatePage extends StatelessWidget {
  const CalculatePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => HighwayToolCubit(),
        ),
        BlocProvider(
          create: (_) => GasFeeCubit(),
        ),
        BlocProvider(
          create: (_) => MemberCubit(),
        ),
        BlocProvider(
          create: (_) => TotalAmountCubit(),
        )
      ],
      child: SingleChildScrollView(
        child: Column(
          children: const [
            TopicSection(
              enteredItemCard:
                  HighwayToolInputCard(listView: HighwayToolListView()),
            ),
            TopicSection(
              enteredItemCard: GasInputCard(gasFee: GasFee()),
            ),
            TopicSection(
              enteredItemCard: MemberInputCard(listView: MemberListView()),
            ),
            TopicSection(
              enteredItemCard: PricePerPersonCard(),
            )
          ],
        ),
      ),
    );
  }
}
