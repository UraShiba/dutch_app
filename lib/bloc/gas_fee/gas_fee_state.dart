import 'package:dutch_app/model/transportation.dart';
import 'package:equatable/equatable.dart';

abstract class GasFeeState extends Equatable {
  @override
  List<Object> get props => [];
}

class GasFeeCalculatorState extends GasFeeState {
  final GasFeeCalculatorData gasFeeCalculatorData;
  GasFeeCalculatorState(this.gasFeeCalculatorData);

  @override
  List<Object> get props => [gasFeeCalculatorData];
}
