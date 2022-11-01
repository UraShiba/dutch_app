import 'package:dutch_app/bloc/gas_fee_bloc.dart';
import 'package:dutch_app/bloc/highway_bloc.dart';
import 'package:dutch_app/model/highway_tool.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GasInputCard extends StatelessWidget {
  const GasInputCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _fuelConsumptionController = TextEditingController();
    final _startConsumptionController = TextEditingController();
    final _endConsumptionController = TextEditingController();
    final _litter = TextEditingController();

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text("litter"),
                SizedBox(
                  width: 50,
                  height: 50,
                  child: TextFormField(
                    controller: _litter,
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text("Fuel Consumption"),
                SizedBox(
                  width: 50,
                  height: 50,
                  child: TextFormField(
                    controller: _fuelConsumptionController,
                  ),
                ),
              ],
            ),
            const Padding(padding: EdgeInsets.all(4)),
            const Text("Trip"),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text("start"),
                SizedBox(
                  width: 50,
                  height: 50,
                  child: TextFormField(
                    controller: _startConsumptionController,
                  ),
                ),
                const Text("end"),
                SizedBox(
                  width: 50,
                  height: 50,
                  child: TextFormField(
                    controller: _endConsumptionController,
                  ),
                ),
              ],
            ),
            const Padding(padding: EdgeInsets.all(8)),
            Center(
              child: ElevatedButton(
                  onPressed: () {
                    context.read<GasFeeCubit>().addGasFeeCalculatorData(
                        GasFeeCalculatorData(
                            fuelConsumption:
                                int.parse(_fuelConsumptionController.text),
                            startTrip:
                                int.parse(_startConsumptionController.text),
                            endTrip: int.parse(_endConsumptionController.text),
                            litter: int.parse(_litter.text)));
                  },
                  child: const Text("Add")),
            )
          ],
        ),
      ),
    );
  }
}
