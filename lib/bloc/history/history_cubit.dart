import 'package:dutch_app/entities/history.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dutch_app/utils/shared_preference_provider.dart';

class HistoryCubit extends Cubit<List<History>> {
  HistoryCubit() : super([]);

  void addHistory(History data) async {
    state.add(data);
    final newState = List.of(state);
    SharedPreferenceProvider.saveData(History.fromHistoriesToJson(newState));
    emit(List.of(state));
  }

  void initHistory() async {
    final data = await SharedPreferenceProvider.readData();
    if (data != null) emit(History.parseHistories(data));
  }
}
