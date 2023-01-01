import 'package:dutch_app/bloc/history/history_cubit.dart';
import 'package:dutch_app/configuration/style.dart';
import 'package:dutch_app/model/history.dart';
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
                .map((e) => Card(
                      color: cardColor,
                      child: Column(
                        children: [
                          Text(format.format(e.dateTime).toString(),
                              style: textStyle2),
                          Text(e.money.toString(), style: textStyle3),
                          const Text("Members", style: textStyle2),
                          Column(
                            children: e.memberName
                                .map((e) => Text(e, style: textStyle3))
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
