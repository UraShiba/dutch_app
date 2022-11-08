import 'package:dutch_app/bloc/date_pick/date_pick_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DatePickCard extends StatelessWidget {
  const DatePickCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: const Color((0xFFF6F9FC)),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            BlocBuilder<DatePickCubit, DateTime>(builder: (context, date) {
              return Text(
                '${date.year}/${date.month}/${date.day}',
                style: const TextStyle(fontSize: 20),
              );
            }),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.black,
              ),
              onPressed: () async {
                DateTime? newDate = await showDatePicker(
                    context: context,
                    initialDate: context.read<DatePickCubit>().getDateTime(),
                    firstDate: DateTime(2020),
                    lastDate: DateTime(2100));
                if (newDate != null) {
                  context.read<DatePickCubit>().setDateTime(newDate);
                }
              },
              child: const Text('Select date'),
            ),
          ],
        ),
      ),
    );
  }
}