import 'package:dutch_app/bloc/gas_fee_state.dart';
import 'package:dutch_app/model/highway_tool.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HighwayItemsCubit extends Cubit<List<int>> {
  HighwayItemsCubit() : super([]);

  void addHighwayTool(int fare) {
    state.add(fare);
    print(List.of(state));
    emit(List.of(state));
  }

  int calculateHighwayTool() {
    int sum = 0;
    for (int i = 0; i < state.length; i++) {
      sum += i;
    }
    return sum;
  }

  void removeProduct(int number) {
    state.removeWhere((element) => element == number);
    emit(List.of(state));
  }
}
