import 'package:dutch_app/model/history.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../utils/shared_preference_provider.dart';

class HistoryCubit extends Cubit<List<History>> {
  HistoryCubit() : super([]);

  void addHistory(History data) async {
    state.add(data);
    final newState = List.of(state);
    SharedPreferencesProvider.saveData(History.fromHistoriesToJson(newState));
    emit(List.of(state));
  }

  void initHistory() async {
    final data = await SharedPreferencesProvider.readData();
    if (data != "") emit(History.parseHistories(data));
  }
}
