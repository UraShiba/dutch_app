import 'package:dutch_app/feature/payment_management/presentation/bloc/history/history_cubit.dart';
import 'package:dutch_app/core/configuration/style.dart';
import 'package:dutch_app/feature/payment_management/domain/entities/history.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

DateFormat format = DateFormat('yyyy-MM-dd');

class HistoryPage extends StatelessWidget {
  const HistoryPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HistoryCubit, List<History>>(
      builder: (context, state) {
        return ListView(
            padding: const EdgeInsets.all(8),
            children: state
                .map((history) => Card(
                      color: cardColor,
                      child: Column(
                        children: [
                          Text(format.format(history.dateTime).toString(),
                              style: bodyLarge),
                          Text(history.money.toString(), style: bodyMedium),
                          const Text("Members", style: bodyLarge),
                          Column(
                            children: history.memberName
                                .map((history) =>
                                    Text(history, style: bodyMedium))
                                .toList(),
                          )
                        ],
                      ),
                    ))
                .toList());
      },
    );
  }
}
