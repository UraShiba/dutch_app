import 'package:dutch_app/feature/payment_management/presentation/entities/total_amount.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TotalAmountCubit extends Cubit<TotalAmount> {
  TotalAmountCubit()
      : super(
            const TotalAmount(sumGas: 0, sumHighwayTool: 0, sumParkingFee: 0));
  int sum = 0;

  void addFeeList(TotalAmount fee) {
    emit(fee);
  }

  TotalAmount getTotalAmount() {
    return state;
  }

  int calculateTotalAmount() {
    sum = state.sumGas! + state.sumHighwayTool! + state.sumParkingFee!;
    return sum;
  }

  int getPricePersonAmount(int numberOfPerson) {
    return (sum / numberOfPerson).round();
  }
}
