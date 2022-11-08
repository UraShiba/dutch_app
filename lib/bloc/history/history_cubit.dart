import 'package:dutch_app/model/history.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HistoryCubit extends Cubit<List<History>> {
  HistoryCubit() : super([]);

  void addHistory(History data) {
    state.add(data);
    print(state);
    emit(List.of(state));
  }
}
