import 'package:dutch_app/bloc/date_pick/date_pick_cubit.dart';
import 'package:dutch_app/configuration/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DatePickCard extends StatelessWidget {
  const DatePickCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: cardColor,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Date', style: titleLarge),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                BlocBuilder<DatePickCubit, DateTime>(builder: (context, date) {
                  return Text(
                    '${date.year}/${date.month}/${date.day}',
                    style: bodyLarge,
                  );
                }),
                const SizedBox(width: 8),
                InkWell(
                  onTap: () async {
                    DateTime? newDate = await getDateTime(context);
                    if (newDate != null) {
                      context.read<DatePickCubit>().setDateTime(newDate);
                    }
                  },
                  child: const Icon(
                    Icons.calendar_month_rounded,
                    color: buttonColor,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

Future<DateTime?> getDateTime(BuildContext context) async {
  var newDate = await showDatePicker(
      context: context,
      initialDate: context.read<DatePickCubit>().getDateTime(),
      firstDate: DateTime(2020),
      lastDate: DateTime(2100),
      builder: (context, child) {
        return Theme(
          data: ThemeData.light().copyWith(
              colorScheme:
                  const ColorScheme.light().copyWith(primary: orangeColor)),
          child: child!,
        );
      });
  return newDate;
}
