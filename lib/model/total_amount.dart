import 'package:equatable/equatable.dart';

class TotalAmount extends Equatable {
  final int? sumGas;
  final int? sumHighwayTool;
  final int? sumParkingFee;

  const TotalAmount({this.sumGas, this.sumHighwayTool, this.sumParkingFee});

  TotalAmount copyWith(
          {int? sumGas, int? sumHighwayTool, int? sumParkingFee}) =>
      TotalAmount(
        sumGas: sumGas ?? this.sumGas,
        sumHighwayTool: sumHighwayTool ?? this.sumHighwayTool,
        sumParkingFee: sumParkingFee ?? this.sumParkingFee,
      );

  @override
  List<Object> get props => [sumGas!, sumHighwayTool!, sumParkingFee!];
}
