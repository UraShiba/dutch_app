import 'package:dutch_app/feature/payment_management/presentation/bloc/button_enable/button_enable_cubit.dart';
import 'package:dutch_app/feature/payment_management/presentation/bloc/date_pick/date_pick_cubit.dart';
import 'package:dutch_app/feature/payment_management/presentation/bloc/history/history_cubit.dart';
import 'package:dutch_app/core/configuration/style.dart';
import 'package:dutch_app/feature/payment_management/domain/entities/history.dart';
import 'package:dutch_app/feature/payment_management/presentation/bloc/member/member_cubit.dart';
import 'package:dutch_app/feature/payment_management/presentation/bloc/total_amount/total_amount_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SaveButton extends StatelessWidget {
  const SaveButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: BlocBuilder<ButtonEnableCubit, IsButtonEnable>(
          builder: (context, state) {
        bool _isEnable = context.read<ButtonEnableCubit>().isSaveButtonEnable();

        return ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: buttonColor,
          ),
          onPressed: _isEnable ? () => buttonAction(context) : null,
          child: const Text('Save', style: bodyMedium),
        );
      }),
    );
  }
}

void buttonAction(BuildContext context) {
  DateTime dateTime = context.read<DatePickCubit>().getDateTime();
  List<String> memberList = context.read<MemberCubit>().getMember();
  int money = context
      .read<TotalAmountCubit>()
      .getPricePersonAmount(context.read<MemberCubit>().getPersonNumber());
  context.read<HistoryCubit>().addHistory(
      History(dateTime: dateTime, memberName: memberList, money: money));
}
