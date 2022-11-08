import 'package:flutter_bloc/flutter_bloc.dart';

class TotalAmountCubit extends Cubit<List<int>> {
  TotalAmountCubit() : super([]);
  int sum = 0;

  void addFeeList(int fee) {
    state.add(fee);
    emit(List.of(state));
  }

  int calculateTotalAmount() {
    sum = 0;
    for (int i = 0; i < state.length; i++) {
      sum += state[i];
    }
    return sum;
  }

  int getPricePersonAmount(int numberOfPerson) {
    return (sum / numberOfPerson).round();
  }
}
