import 'package:dutch_app/core/failures.dart';
import 'package:dutch_app/core/no_input.dart';
import 'package:dutch_app/feature/payment_management/domain/entities/history.dart';
import 'package:dutch_app/feature/payment_management/domain/usecase/get_history_data.dart';
import 'package:dutch_app/feature/payment_management/domain/usecase/set_history_data.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HistoryCubit extends Cubit<List<History>> {
  final SetHistoryUsecase calculateUsecase;
  final GetHistoryUseCase getCalculateUseCase;

  HistoryCubit(this.calculateUsecase, this.getCalculateUseCase) : super([]);

  void addHistory(History data) async {
    state.add(data);
    final newState = List.of(state);
    await calculateUsecase.call(newState);
    emit(List.of(state));
  }

  void getHistory() async {
    final input = NoInput();
    final result = await getCalculateUseCase.call(input);
    result.fold((failure) => const LocalStorageFailure(),
        (history) => emit(List.of(history)));
  }

  void initHistory() async {
    final input = NoInput();
    final result = await getCalculateUseCase.call(input);
    result.fold((failure) => const LocalStorageFailure(),
        (history) => emit(List.of(history)));
  }
}
