import 'dart:convert';

import 'package:dutch_app/feature/payment_management/domain/entities/history.dart';

class HistoryModel extends History {
  const HistoryModel(
      {required DateTime dateTime,
      required List<String> memberName,
      required int money})
      : super(dateTime: dateTime, memberName: memberName, money: money);

  factory HistoryModel.fromJson(String json) {
    Map<String, dynamic> historyMap = jsonDecode(json);
    return HistoryModel(
        dateTime: DateTime.parse(historyMap['dateTime']),
        memberName: historyMap['memberName'].cast<String>() as List<String>,
        money: historyMap['money']);
  }

  String toJson(History history) {
    final map = {
      'dateTime': history.dateTime.toIso8601String(),
      'memberName': history.memberName,
      'money': history.money
    };
    return jsonEncode(map);
  }

  static String fromHistoriesToJson(List<HistoryModel> histories) {
    List<String> parsed =
        histories.map((history) => history.toJson(history)).toList();
    return jsonEncode(parsed);
  }
}
