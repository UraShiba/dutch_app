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

  @override
  List<Object> get props => [dateTime, memberName, money];
}
