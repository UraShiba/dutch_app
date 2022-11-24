import 'package:dutch_app/bloc/history/history_cubit.dart';
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
                      color: Theme.of(context).primaryColor,
                      child: Column(
                        children: [
                          Text(
                            format.format(e.dateTime).toString(),
                            style: Theme.of(context)
                                .textTheme
                                .headline6
                                ?.copyWith(
                                    color:
                                        Theme.of(context).secondaryHeaderColor),
                          ),
                          Text(
                            e.money.toString(),
                            style: Theme.of(context)
                                .textTheme
                                .headline6
                                ?.copyWith(
                                    color:
                                        Theme.of(context).secondaryHeaderColor),
                          ),
                          Text(
                            "Members",
                            style: Theme.of(context)
                                .textTheme
                                .headline6
                                ?.copyWith(
                                    color:
                                        Theme.of(context).secondaryHeaderColor),
                          ),
                          Column(
                            children: e.memberName
                                .map((e) => Text(
                                      e,
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyText2
                                          ?.copyWith(
                                              color: Theme.of(context)
                                                  .secondaryHeaderColor),
                                    ))
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
