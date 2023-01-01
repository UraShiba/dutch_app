import 'package:dutch_app/bloc/date_pick/date_pick_cubit.dart';
import 'package:dutch_app/bloc/history/history_cubit.dart';
import 'package:dutch_app/bloc/member/member_cubit.dart';
import 'package:dutch_app/bloc/total_amount/total_amount_cubit.dart';
import 'package:dutch_app/configuration/style.dart';
import 'package:dutch_app/model/history.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SaveButton extends StatelessWidget {
  const SaveButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: buttonColor,
        ),
        onPressed: () {
          DateTime dateTime = context.read<DatePickCubit>().getDateTime();
          List<String> memberList = context.read<MemberCubit>().getMember();
          int money = context.read<TotalAmountCubit>().getPricePersonAmount(
              context.read<MemberCubit>().getPersonNumber());
          context.read<HistoryCubit>().addHistory(History(
              dateTime: dateTime, memberName: memberList, money: money));
        },
        child: const Text('Save', style: buttonTextStyle),
      ),
    );
  }
}
