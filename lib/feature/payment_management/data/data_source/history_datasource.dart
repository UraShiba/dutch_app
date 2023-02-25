import 'dart:convert';
import 'package:dutch_app/feature/payment_management/data/models/history_model.dart';
import 'package:dutch_app/core/utils/shared_preference_provider.dart';

class HistoryDatasource {
  final SharedPreferenceProvider sharedPreferencesProvider;
  List<String> checkKey = [];
  HistoryDatasource(this.sharedPreferencesProvider);

  Future<void> setHistoryStatus(List<HistoryModel> value) async {
    try {
      await sharedPreferencesProvider
          .saveData(HistoryModel.fromHistoriesToJson(value));
    } catch (e) {
      throw Exception();
    }
  }

  Future<List<HistoryModel>> getHistoryStatus() async {
    try {
      final state = await sharedPreferencesProvider.readData();
      if (state == null) {
        return [];
      } else {
        final jsonData = await jsonDecode(state);

        return parseHistories(jsonData);
      }
    } catch (e) {
      throw Exception();
    }
  }

  static List<HistoryModel> parseHistories(String responseBody) {
    final parsed = jsonDecode(responseBody);
    return parsed
        .map<HistoryModel>((json) => HistoryModel.fromJson(json))
        .toList();
  }
}
