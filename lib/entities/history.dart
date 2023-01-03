import 'dart:convert';
import 'package:equatable/equatable.dart';

class History extends Equatable {
  final DateTime dateTime;
  final List<String> memberName;
  final int money;

  const History(
      {required this.dateTime, required this.memberName, required this.money});

  factory History.fromJson(String json) {
    Map<String, dynamic> historyMap = jsonDecode(json);
    return History(
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

  static List<History> parseHistories(String responseBody) {
    final parsed = jsonDecode(responseBody);
    return parsed.map<History>((json) => History.fromJson(json)).toList();
  }

  static String fromHistoriesToJson(List<History> histories) {
    List<String> parsed =
        histories.map((history) => history.toJson(history)).toList();
    return jsonEncode(parsed);
  }

  @override
  List<Object> get props => [dateTime, memberName, money];
}
