import 'package:equatable/equatable.dart';

class TotalAmount extends Equatable {
  final int? sumGas;
  final int? sumHighwayTool;

  const TotalAmount({this.sumGas, this.sumHighwayTool});

  TotalAmount copyWith({int? sumGas, int? sumHighwayTool}) => TotalAmount(
      sumGas: sumGas ?? this.sumGas,
      sumHighwayTool: sumHighwayTool ?? this.sumHighwayTool);

  @override
  List<Object> get props => [sumGas!, sumHighwayTool!];
}
