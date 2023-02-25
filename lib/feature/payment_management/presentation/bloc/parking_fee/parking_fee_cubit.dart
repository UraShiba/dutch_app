import 'package:flutter_bloc/flutter_bloc.dart';

class ParkingFeeCubit extends Cubit<List<int>> {
  ParkingFeeCubit() : super([]);

  int sum = 0;

  void addParkingFee(int fare) {
    state.add(fare);
    emit(List.of(state));
  }

  void removeProduct(int number) {
    // To be implemented
    // state.removeWhere((element) => element == number);
    // emit(List.of(state));
  }

  int getParkingFee() {
    sum = 0;
    for (int i = 0; i < state.length; i++) {
      sum += state[i];
    }
    return sum;
  }
}
