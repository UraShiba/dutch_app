import 'package:dutch_app/bloc/gas_fee/gas_fee_cubit.dart';
import 'package:dutch_app/bloc/total_amount/total_amount_cubit.dart';
import 'package:dutch_app/entities/transportation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GasInputCard extends StatelessWidget {
  const GasInputCard({Key? key, required this.gasFee}) : super(key: key);

  final Widget gasFee;

  @override
  Widget build(BuildContext context) {
    final _fuelConsumptionController = TextEditingController();
    final _startConsumptionController = TextEditingController();
    final _endConsumptionController = TextEditingController();
    final _litter = TextEditingController();

    return Card(
      color: const Color((0xFFF6F9FC)),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Gas fee",
              textAlign: TextAlign.left,
              style: TextStyle(fontSize: 20),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text("Litter (km/l)"),
                SizedBox(
                  width: 50,
                  height: 50,
                  child: TextFormField(
                    inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                    controller: _litter,
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text("Fuel Consumption (yen/l)"),
                SizedBox(
                  width: 50,
                  height: 50,
                  child: TextFormField(
                    inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                    controller: _fuelConsumptionController,
                  ),
                ),
              ],
            ),
            const Padding(padding: EdgeInsets.all(4)),
            const Text("Travel distance"),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text("Start trip"),
                SizedBox(
                  width: 50,
                  height: 50,
                  child: TextFormField(
                    inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                    controller: _startConsumptionController,
                  ),
                ),
                const Text("End trip"),
                SizedBox(
                  width: 50,
                  height: 50,
                  child: TextFormField(
                    inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                    controller: _endConsumptionController,
                  ),
                ),
              ],
            ),
            const Padding(padding: EdgeInsets.all(8)),
            Center(
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black,
                  ),
                  onPressed: () {
                    final totalAmount =
                        context.read<TotalAmountCubit>().getTotalAmount();

                    context.read<GasFeeCubit>().addGasFeeCalculatorData(
                        GasFeeCalculatorData(
                            fuelConsumption:
                                int.parse(_fuelConsumptionController.text),
                            startTrip:
                                int.parse(_startConsumptionController.text),
                            endTrip: int.parse(_endConsumptionController.text),
                            litter: int.parse(_litter.text)));
                    context.read<GasFeeCubit>().calculateGasFee();
                    context.read<TotalAmountCubit>().addFeeList(
                        totalAmount.copyWith(
                            sumGas: context.read<GasFeeCubit>().getGasFee()));
                    context.read<TotalAmountCubit>().calculateTotalAmount();
                  },
                  child: const Text("Add gas fee")),
            ),
            gasFee
          ],
        ),
      ),
    );
  }
}
