import 'package:flutter_bloc/flutter_bloc.dart';

class HighwayToolCubit extends Cubit<List<int>> {
  HighwayToolCubit() : super([]);

  int sum = 0;

  void addHighwayTool(int fare) {
    state.add(fare);
    emit(List.of(state));
  }

  void removeProduct(int number) {
    // To be implemented
    // state.removeWhere((element) => element == number);
    // emit(List.of(state));
  }

  int getHighwayTool() {
    sum = 0;
    for (int i = 0; i < state.length; i++) {
      sum += state[i];
    }
    return sum;
  }
}
