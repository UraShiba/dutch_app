import 'package:dutch_app/feature/payment_management/presentation/bloc/button_enable/button_enable_cubit.dart';
import 'package:dutch_app/feature/payment_management/presentation/bloc/date_pick/date_pick_cubit.dart';
import 'package:dutch_app/feature/payment_management/presentation/bloc/gas_fee/gas_fee_cubit.dart';
import 'package:dutch_app/feature/payment_management/presentation/bloc/highway_tool/highway_tool_cubit.dart';
import 'package:dutch_app/feature/payment_management/presentation/bloc/member/member_cubit.dart';
import 'package:dutch_app/feature/payment_management/presentation/bloc/parking_fee/parking_fee_cubit.dart';
import 'package:dutch_app/feature/payment_management/presentation/bloc/total_amount/total_amount_cubit.dart';
import 'package:dutch_app/feature/payment_management/presentation/pages/widget/parking_fee/parking_fee_listview.dart';
import 'package:dutch_app/feature/payment_management/presentation/pages/widget/input_card/date_pick_card.dart';
import 'package:dutch_app/feature/payment_management/presentation/pages/widget/member/member_listview.dart';
import 'package:dutch_app/feature/payment_management/presentation/pages/widget/member/member_input_card.dart';
import 'package:dutch_app/feature/payment_management/presentation/pages/widget/parking_fee/parking_fee_card.dart';
import 'package:dutch_app/feature/payment_management/presentation/pages/widget/input_card/price_per_person_card.dart';
import 'package:dutch_app/feature/payment_management/presentation/pages/widget/gas_fee/gas_fee.dart';
import 'package:dutch_app/feature/payment_management/presentation/pages/widget/expressway/expressway.dart';
import 'package:dutch_app/feature/payment_management/presentation/pages/widget/gas_fee/gas_input_card.dart';
import 'package:dutch_app/feature/payment_management/presentation/pages/widget/expressway/expressway_input_card.dart';
import 'package:dutch_app/feature/payment_management/presentation/pages/widget/save_button.dart';
import 'package:dutch_app/feature/payment_management/presentation/pages/widget/common/topic_section.dart';
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
        ),
        BlocProvider(
          create: (_) => DatePickCubit(),
        ),
        BlocProvider(
          create: (_) => ParkingFeeCubit(),
        ),
        BlocProvider(create: (_) => ButtonEnableCubit())
      ],
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            DatePickCard(),
            TopicSection(
              enteredItemCard:
                  HighwayToolInputCard(listView: HighwayToolListView()),
            ),
            TopicSection(
              enteredItemCard: GasInputCard(gasFee: GasFee()),
            ),
            TopicSection(
              enteredItemCard: ParkingFeeCard(listView: ParkingFeeListview()),
            ),
            TopicSection(
              enteredItemCard: MemberInputCard(listView: MemberListView()),
            ),
            TopicSection(
              enteredItemCard: PricePerPersonCard(),
            ),
            SaveButton()
          ],
        ),
      ),
    );
  }
}
