import 'package:dutch_app/bloc/button_enable/button_enable_cubit.dart';
import 'package:dutch_app/bloc/gas_fee/gas_fee_cubit.dart';
import 'package:dutch_app/bloc/total_amount/total_amount_cubit.dart';
import 'package:dutch_app/model/transportation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class _GasFeeCalculatorData {
  int? fuelConsumption;
  int? startTrip;
  int? endTrip;
  int? litter;
}

class GasInputCard extends StatelessWidget {
  const GasInputCard({Key? key, required this.gasFee}) : super(key: key);

  final Widget gasFee;

  @override
  Widget build(BuildContext context) {
    final _gasFee = GlobalKey<FormState>();
    var inputData = _GasFeeCalculatorData();
    return Card(
      color: const Color((0xFFF6F9FC)),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Form(
          key: _gasFee,
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
                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly
                        ],
                        onSaved: (value) {
                          inputData.litter = int.parse(value!);
                        },
                        onChanged: (value) => context
                            .read<ButtonEnableCubit>()
                            .updateLitter(true)),
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
                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly
                        ],
                        onSaved: (value) {
                          inputData.fuelConsumption = int.parse(value!);
                        },
                        onChanged: (value) => context
                            .read<ButtonEnableCubit>()
                            .updateFuelConsumption(true)),
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
                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly
                        ],
                        onSaved: (value) {
                          inputData.startTrip = int.parse(value!);
                        },
                        onChanged: (value) => context
                            .read<ButtonEnableCubit>()
                            .updateStartTrip(true)),
                  ),
                  const Text("End trip"),
                  SizedBox(
                    width: 50,
                    height: 50,
                    child: TextFormField(
                      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                      onSaved: (value) {
                        inputData.endTrip = int.parse(value!);
                      },
                      onChanged: (value) =>
                          context.read<ButtonEnableCubit>().updateEndTrip(true),
                    ),
                  ),
                ],
              ),
              const Padding(padding: EdgeInsets.all(8)),
              Center(
                child: BlocBuilder<ButtonEnableCubit, IsButtonEnable>(
                    builder: (context, state) {
                  bool _isEnable =
                      context.read<ButtonEnableCubit>().isGasFeeButtonEnable();
                  return ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.black,
                      ),
                      onPressed: _isEnable
                          ? () {
                              _gasFee.currentState!.save();
                              context
                                  .read<GasFeeCubit>()
                                  .addGasFeeCalculatorData(GasFeeCalculatorData(
                                      fuelConsumption:
                                          inputData.fuelConsumption!,
                                      startTrip: inputData.startTrip!,
                                      endTrip: inputData.endTrip!,
                                      litter: inputData.litter!));
                              final totalAmount = context
                                  .read<TotalAmountCubit>()
                                  .getTotalAmount();

                              context.read<GasFeeCubit>().calculateGasFee();
                              context.read<TotalAmountCubit>().addFeeList(
                                  totalAmount.copyWith(
                                      sumGas: context
                                          .read<GasFeeCubit>()
                                          .getGasFee()));
                              context
                                  .read<TotalAmountCubit>()
                                  .calculateTotalAmount();
                            }
                          : null,
                      child: const Text("Add gas fee"));
                }),
              ),
              gasFee
            ],
          ),
        ),
      ),
    );
  }
}
