import 'package:dutch_app/core/configuration/style.dart';
import 'package:dutch_app/feature/payment_management/presentation/bloc/parking_fee/parking_fee_cubit.dart';
import 'package:dutch_app/feature/payment_management/presentation/bloc/total_amount/total_amount_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ParkingFeeCard extends StatelessWidget {
  const ParkingFeeCard({Key? key, required this.listView}) : super(key: key);

  final Widget listView;

  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();
    final _editingController = TextEditingController();

    return Card(
      color: cardColor,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Parking tool",
              textAlign: TextAlign.left,
              style: titleLarge,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text("Fare", style: bodyLarge),
                SizedBox(
                  width: 50,
                  height: 50,
                  child: TextFormField(
                      key: _formKey,
                      cursorColor: orangeColor,
                      decoration: inputDecoration,
                      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                      controller: _editingController,
                      onFieldSubmitted: (value) {
                        _submitAction(context, value);
                      }),
                ),
              ],
            ),
            listView
          ],
        ),
      ),
    );
  }
}

void _submitAction(BuildContext context, String value) {
  final totalAmount = context.read<TotalAmountCubit>().getTotalAmount();

  context.read<ParkingFeeCubit>().addParkingFee((int.parse(value)));
  context.read<TotalAmountCubit>().addFeeList(totalAmount.copyWith(
      sumParkingFee: context.read<ParkingFeeCubit>().getParkingFee()));
  context.read<TotalAmountCubit>().calculateTotalAmount();
}
