import 'package:dutch_app/feature/payment_management/presentation/entities/transportation.dart';
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
