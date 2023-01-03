import 'package:dutch_app/bloc/gas_fee/gas_fee_state.dart';
import 'package:dutch_app/entities/transportation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GasFeeCubit extends Cubit<GasFeeCalculatorState> {
  GasFeeCubit()
      : super(GasFeeCalculatorState(const GasFeeCalculatorData(
            fuelConsumption: 1, startTrip: 0, endTrip: 0, litter: 0)));

  int gasFee = 0;

  void addGasFeeCalculatorData(GasFeeCalculatorData data) {
    emit(GasFeeCalculatorState(data));
  }

  void calculateGasFee() {
    gasFee = 0;
    final GasFeeCalculatorData data = state.gasFeeCalculatorData;
    gasFee =
        (((data.endTrip - data.startTrip) / data.litter) * data.fuelConsumption)
            .round();
  }

  int getGasFee() {
    return gasFee;
  }
}
