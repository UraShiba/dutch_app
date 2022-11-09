import 'package:dutch_app/model/total_amount.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// class TotalAmountCubit extends Cubit<List<int>> {
//   TotalAmountCubit() : super([]);
//   int sum = 0;

//   void addFeeList(int fee) {
//     state.add(fee);
//     emit(List.of(state));
//   }

//   int calculateTotalAmount() {
//     sum = 0;
//     for (int i = 0; i < state.length; i++) {
//       sum += state[i];
//     }
//     return sum;
//   }

//   int getPricePersonAmount(int numberOfPerson) {
//     return (sum / numberOfPerson).round();
//   }
// }

class TotalAmountCubit extends Cubit<TotalAmount> {
  TotalAmountCubit() : super(const TotalAmount(sumGas: 0, sumHighwayTool: 0));
  int sum = 0;

  void addFeeList(TotalAmount fee) {
    emit(fee);
  }

  TotalAmount getTotalAmount() {
    return state;
  }

  int calculateTotalAmount() {
    sum = state.sumGas! + state.sumHighwayTool!;
    return sum;
  }

  int getPricePersonAmount(int numberOfPerson) {
    return (sum / numberOfPerson).round();
  }
}
