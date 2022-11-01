import 'package:equatable/equatable.dart';

class HighwayTool extends Equatable {
  final List<int> fare;

  const HighwayTool({required this.fare});

  @override
  List<Object> get props => [fare];
}

class Carfare extends Equatable {
  final HighwayTool? highwayTool;
  final int fuelBill;

  const Carfare({this.highwayTool, required this.fuelBill});

  @override
  List<Object> get props => [highwayTool!, fuelBill];
}

class GasFeeCalculatorData extends Equatable {
  final int fuelConsumption;
  final int startTrip;
  final int endTrip;

  const GasFeeCalculatorData(
      {required this.fuelConsumption,
      required this.startTrip,
      required this.endTrip});

  @override
  List<Object> get props => [fuelConsumption, startTrip, endTrip];
}
