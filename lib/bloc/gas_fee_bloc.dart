import 'package:dutch_app/bloc/gas_fee_state.dart';
import 'package:dutch_app/model/highway_tool.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GasFeeCubit extends Cubit<GasFeeCalculatorState> {
  GasFeeCubit()
      : super(GasFeeCalculatorState(const GasFeeCalculatorData(
            fuelConsumption: 1, startTrip: 0, endTrip: 0)));

  void addGasFeeCalculatorData(GasFeeCalculatorData data) {
    emit(GasFeeCalculatorState(data));
  }

  int calculateGasFee() {
    final int gasFee;
    final GasFeeCalculatorData data = state.gasFeeCalculatorData;
    gasFee = ((data.endTrip - data.startTrip) / data.fuelConsumption).round();
    return gasFee;
  }
}
